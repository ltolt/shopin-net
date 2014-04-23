package net.shopin.web.controller;

import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.aliLogConf.AlipayConfig;
import net.shopin.web.conf.aliLogConf.AlipayNotify;
import net.shopin.web.conf.aliLogConf.AlipayService;
import net.shopin.web.util.LoadProperties;
import org.dom4j.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-5-10
 * Time: 12:45:28
 */
@Controller
public class AliLogController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;
    @Autowired
    BankConf bankConf;

    @RequestMapping(value = "/aliLogin", method = {RequestMethod.GET, RequestMethod.POST})
    public String toLogin(@RequestParam("forward") String forward, Model m) {
        AlipayConfig.partner = bankConf.getPartner();
        AlipayConfig.key = bankConf.getKey();
        String return_url = LoadProperties.readValue("ALIPAY_REDIRECT_URL");
        if (forward == null || "".equals(forward)) {
            return_url = return_url + "index.html";
        } else {
            forward = forward.replace("/", "-");
            return_url = return_url + forward;
        }
        AlipayConfig.return_url = return_url;
        String anti_phishing_key = "";
        try {
            anti_phishing_key = AlipayService.query_timestamp();
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String url = AlipayService.alipay_auth_authorize(anti_phishing_key, "");
        m.addAttribute("url", url);
        return "toAlipayLog";
    }


    @RequestMapping(value = "/alipayReturn/{toUrl}", method = RequestMethod.GET)
    public String retrun(Model m, @PathVariable("toUrl") String toUrl, HttpServletRequest request, HttpServletResponse response) {
        String DOMAIN = LoadProperties.readValue("DOMAIN");

        String partner = bankConf.getPartner(); //partner合作伙伴id（必须填写）
        String key = bankConf.getKey(); //partner 的对应交易安全校验码（必须填写）
        //获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            //remove by jack for ETao at 2011-11-2 begin
            //生产环境不需要！
//            try {
//                valueStr = new String(valueStr.getBytes("ISO-8859-1"), "UTF-8");
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
            //remove by jack for ETao at 2011-11-2 end
            params.put(name, valueStr);
        }
        //计算得出通知验证结果
        boolean verify_result = AlipayNotify.verify(params);

        if (verify_result) {//验证成功
        	
            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表
            //支付宝用户id
            String user_id = request.getParameter("user_id");
            //授权令牌
            String token = request.getParameter("token");
            String real_name = request.getParameter("real_name");
            //remove by jack for ETao at 2011-11-2 begin
            //生产环境不需要！
//            try {
//                real_name = new String(real_name.getBytes("ISO-8859-1"), "UTF-8");
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
            //remove by jack for ETao at 2011-11-2 end
            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表
            String email = request.getParameter("email");
            if (email == null || "".equals(email)) {
                email = user_id + "@alipay.com";
            }
            boolean flag = memberService.validateEmail(email);
            MemberVO memberVO = new MemberVO();
            if (!flag) {
                //已注册过支付宝会员，直接登录
                memberVO = memberService.getMemberByEmail(email);
            } else {
                memberVO.setMemName(real_name);
                memberVO.setMemEmail(email);
                memberVO.setMemPwd(UUID.randomUUID().toString().substring(28));
                memberService.register(memberVO); //注册支付宝会员
                memberVO = memberService.validate(memberVO.getMemEmail(), memberVO.getMemPwd()); //重新取出来memberVO
            }

            if (memberVO != null) {
                if (real_name != null && !"".equals(real_name)) {
                    memberVO.setMemName(real_name);
                }
                String uid2 = UUID.randomUUID().toString();
                securityService.addLoginUser(uid2, memberVO);
                Cookie cookie = new Cookie("userTicket", uid2);
                cookie.setPath("/");
                cookie.setDomain(DOMAIN);
                response.addCookie(cookie);

                Cookie cookie1 = new Cookie("aliToken", token);
                cookie1.setPath("/");
                cookie1.setDomain(DOMAIN);
                response.addCookie(cookie1);

                Cookie cookie2 = new Cookie("alipayLog", "alipay");
                cookie2.setPath("/");
                cookie2.setDomain(DOMAIN);
                //cookie2.setMaxAge(600);
                response.addCookie(cookie2);
                
                //etao专用
            	if (request.getParameter("target_url") != null){
            	     //程序自动跳转到target_url参数指定的url去
    				return "redirect:" + request.getParameter("target_url");
    				
            	}
            	
                if (toUrl.equals("index")) {
                    return "redirect:"+"/index.html";
                } else {
                    toUrl = toUrl.replace("-", "/") + ".html";
                    return "redirect:" + toUrl;
                }
            } else {
                m.addAttribute("error", "支付宝账户登陆失败，请重试");
                return "login";
            }
        } else {
            m.addAttribute("error", "登陆失败，请重试");
            return "login";
        }
    }

}
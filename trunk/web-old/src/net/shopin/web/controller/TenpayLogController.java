package net.shopin.web.controller;

import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.util.LoadProperties;
import net.shopin.web.conf.tenpayLogConf.share.ShareRequestHandler;
import net.shopin.web.conf.tenpayLogConf.share.ShareResponseHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-5-10
 * Time: 12:45:28
 */
@Controller
public class TenpayLogController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;
    @Autowired
    BankConf bankConf;
//    private final static String DOMAIN = "1.202.151.98";
//    private final static String DOMAIN = "shopin.net";

    @RequestMapping(value = "/tenpayLogin", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(Model m, @RequestParam("forward") String forward, HttpServletRequest request, HttpServletResponse response) {
        //帐号(财付通商户号或者财付通帐号)
        String chnid = bankConf.getTenpayAccount();
        //密钥
        String key = bankConf.getTenpayKey();
        //回调通知URL
        String redirect_url = LoadProperties.readValue("TENPAY_REDIRECT_URL");

        if (forward == null || "".equals(forward)) {
            redirect_url = redirect_url + "index.html";
        } else {
            forward = forward.replace("/", "-");
            redirect_url = redirect_url + forward;
        }
        //创建请求示例
        ShareRequestHandler reqHandler = new ShareRequestHandler(request, response);
        //初始化
        reqHandler.init();
        //设置密钥
        reqHandler.setKey(key);
        //-----------------------------
        //设置请求参数
        //-----------------------------
        reqHandler.setParameter("input_charset", "UTF-8");        //字符集 GBK、UTF-8
        reqHandler.setParameter("chnid", chnid);                //财付通分配的合作方标志，可以是商户号、财付通账户。
        reqHandler.setParameter("chtype", "0");                    //chnid类型。0:商户号 1:财付通帐号
        reqHandler.setParameter("redirect_url", redirect_url);    //登录成功之后的目的URL
        //获取请求带参数的url
        String requestUrl = null;
        try {
            requestUrl = reqHandler.getRequestURL();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //获取debug信息
        String debuginfo = reqHandler.getDebugInfo();
        //System.out.println("debuginfo:" + debuginfo);
        //System.out.println("requestUrl:" + requestUrl);
        m.addAttribute("url", requestUrl);
        return "toTenpayLog";
    }

    @RequestMapping(value = "/tenpayLogReturn/{toUrl}", method = {RequestMethod.GET, RequestMethod.POST})
    public String result(Model m, @PathVariable("toUrl") String toUrl, HttpServletRequest request, HttpServletResponse response) {
        //密钥
        String key = bankConf.getTenpayKey();
        //创建实例
        ShareResponseHandler resHandler = null;
        try {
            resHandler = new ShareResponseHandler(request, response);
            resHandler.setUriEncoding("ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        resHandler.setKey(key);
        //判断签名
        if (resHandler.isTenpaySign()) {
            //财付通帐号
            String id = resHandler.getParameter("id");
            //------------------------------
            //处理业务开始
            String email = id + "@qq.com";
            boolean flag = memberService.validateLogin(email);
            MemberVO memberVO = new MemberVO();
            if (!flag) {
                //已注册过支付宝会员，直接登录
                memberVO = memberService.getMemberByEmail(email);
            } else {
                memberVO.setMemEmail(email);
                memberVO.setMemPwd(UUID.randomUUID().toString().substring(28));
                memberVO.setLoginKey(id);
                memberService.register(memberVO); //注册QQ会员
                memberVO = memberService.getMemberByEmail(email);
            }

            if (memberVO != null) {
                String domain = LoadProperties.readValue("DOMAIN");
                memberVO.setMemName(id);
                String uid2 = UUID.randomUUID().toString();
                securityService.addLoginUser(uid2, memberVO);
                Cookie cookie = new Cookie("userTicket", uid2);
                cookie.setPath("/");
                cookie.setDomain(domain);
                response.addCookie(cookie);
                if (toUrl.equals("index")) {
                    return "redirect:" + "/index.html";
                } else {
                    toUrl = toUrl.replace("-", "/") + ".html";
                    return "redirect:" + toUrl;
                }
            } else {
                m.addAttribute("error", "账户登陆失败，请重试");
                return "login";
            }
        } else {
            //System.out.println("认证签名失败");
            String debugInfo = resHandler.getDebugInfo();
            System.out.println("debugInfo:" + debugInfo);
            m.addAttribute("error", "财付通账户登陆失败，认证签名失败，请重试");
            return "login";
        }
    }

}
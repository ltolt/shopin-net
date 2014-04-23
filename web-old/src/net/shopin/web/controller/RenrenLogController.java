package net.shopin.web.controller;

import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.BankConf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.UUID;
import java.util.regex.Pattern;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-5-10
 * Time: 12:45:28
 */
@Controller
public class RenrenLogController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;

    /*
    * 判断一个字符串是否是数字格式
    */
    private final static Pattern NumbericRegexp = Pattern.compile("^\\d*$");
    /*
    * 定义商家自己站点的首页地址，用于参数验证失败或者md5验证失败的时候跳转到首页
    */
    private final static String MALL_HOME_PAGE_URL = "/index.html";
    private final static String KEY="F03mBl";

    @RequestMapping(value = "/unionlogin", method = {RequestMethod.GET, RequestMethod.POST})
    public String retrun(Model m, HttpServletRequest req, HttpServletResponse resp) {
        String toUrl = MALL_HOME_PAGE_URL;
        /*
        * 第一步，获取各个参数的值并验证参数的正确性，若参数不合法，则写log后跳转到商家自己的首页
        */
        String aid = req.getParameter("aid");
        if (isNullOrEmpty(aid)) {
            return "redirect:" + toUrl;
        }

        String aname = req.getParameter("aname");
        if (isNullOrEmpty(aname)) {
            aname = "";
        }

        String auser = req.getParameter("auser");
        if (isNullOrEmpty(auser)) {
            return "redirect:" + toUrl;
        }

        String uname = req.getParameter("uname");
        if (isNullOrEmpty(uname)) {
            uname = "";
        }

        String url = req.getParameter("url");
        if (isNullOrEmpty(url)) {
            url = MALL_HOME_PAGE_URL;
        }

        String furl = req.getParameter("furl");
        if (isNullOrEmpty(url)) {
            furl = MALL_HOME_PAGE_URL;
        }
        String redirectUrl = furl;
        
        String timestamp = req.getParameter("timestamp");
        if (isNullOrEmpty(timestamp)) {
            return "redirect:" + toUrl;
        }

        String sig = req.getParameter("sig");
        if (isNullOrEmpty(sig) ) {
            return "redirect:" + toUrl;
        }
        String aurl=req.getQueryString();
        System.out.println(""+aurl);

        url=URLEncoder.encode(url);
        furl=URLEncoder.encode(furl);
        aid=URLEncoder.encode(aid);
        aname=URLEncoder.encode(aname);
        auser=URLEncoder.encode(auser);
        uname=URLEncoder.encode(uname);
        timestamp=URLEncoder.encode(timestamp);

        String rawMD5String = "aid="+aid+"&aname="+aname+"&auser="+auser+"&uname="+uname+"&url="+url+"&furl="+furl+"&timestamp="+timestamp+"&key="+KEY;
        String md5_1 = getLowerMd5(rawMD5String, 32);
        if (!md5_1.equals(sig)) {
            // 如果vkey检测不通过，那么5秒后就跳转到商家首页
           return "redirect:" + redirectUrl;
        }
        String email = auser + "@shopin.renren.net";
        boolean flag = false;

        if ("382991".equals(aid)) { //和支付宝联合登录冲突，需要验证是否支付宝已登录
            flag = memberService.validateEmail(auser+"@alipay.com");
            if (flag) {
                flag = memberService.validateLogin(auser);
            }
            email = auser + "@alipay.com";
        } else {
            flag = memberService.validateLogin(auser);
        }
        MemberVO memberVO = new MemberVO();
        String viewinfo="您好"+aname+"用户"+uname;
        if (!flag) {
            //已注册过会员，直接登录
            memberVO = memberService.getMemberByKey(auser);
        } else {
            memberVO.setMemEmail(email);
            memberVO.setMemPwd(UUID.randomUUID().toString().substring(28));
            memberVO.setLoginKey(auser);
            memberService.register(memberVO); //注册QQ会员
            memberVO = memberService.getMemberByKey(auser);
        }
        if (memberVO != null) {
            try {
                if (viewinfo.lastIndexOf("%25") > 0) {
                    viewinfo = viewinfo.replaceAll("%25", "%");
                }
                viewinfo = URLDecoder.decode(viewinfo, "UTF-8");

            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            memberVO.setMemName(viewinfo);
            String uid2 = UUID.randomUUID().toString();
            securityService.addLoginUser(uid2, memberVO);
            Cookie cookie = new Cookie("userTicket", uid2);
            cookie.setPath("/");
            cookie.setDomain("shopin.net");
            resp.addCookie(cookie);
            return "redirect:"+URLDecoder.decode(url);
        } else {
            m.addAttribute("error", "账户登陆失败，请重试");
            return "login";
        }
    }

    private boolean isNumeric(String str) {
        return NumbericRegexp.matcher(str).matches();
    }

    // / MD5加密算法
    // / <param name="md5str">要加密的字符串</param>
    // / <param name="type">16还是32位加密</param>
    // / <returns>Asp md5加密结果</returns>

    private String getLowerMd5(String md5str, int type) {
        String md5 = org.apache.commons.codec.digest.DigestUtils.md5Hex(md5str)
                .toLowerCase();
        if (type == 16) {
            return md5.substring(8, 24);
        } else if (type == 32) {
            return md5;
        }
        return "";
    }

    /*
    * 字符串是否为空或空白
    */

    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().length() == 0;
    }

}
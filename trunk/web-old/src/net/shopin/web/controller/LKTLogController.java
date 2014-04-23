package net.shopin.web.controller;

import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.BankConf;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.util.UUID;
import java.util.regex.Pattern;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-5-10
 * Time: 12:45:28
 */
@Controller
public class LKTLogController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;

    /*
    * 定义商家自己站点的首页地址，用于参数验证失败或者md5验证失败的时候跳转到首页
    */
    private final static String MALL_HOME_PAGE_URL = "/index.html";
    private final static String MEMBERID = "shopin";


    @RequestMapping(value = "/lktLogin", method = {RequestMethod.GET, RequestMethod.POST})
    public String retrun(Model m, HttpServletRequest req, HttpServletResponse resp) {
        String toUrl = MALL_HOME_PAGE_URL;
        /*
        * 第一步，获取各个参数的值并验证参数的正确性，若参数不合法，则写log后跳转到商家自己的首页
        */
        String acct = req.getParameter("acct");
        String userName="";
        if (isNullOrEmpty(acct)) {
            return "redirect:" + toUrl;
        }else{
            userName=acct.substring(3,acct.length());
        }

        String ts = req.getParameter("ts");
        if (isNullOrEmpty(ts)) {
            ts = "";
        }
        String key = req.getParameter("key");
        if (isNullOrEmpty(key)) {
            key = "";
        }
        String memberid="";
        String url = req.getParameter("url");
        if (isNullOrEmpty(url)) {
            url = MALL_HOME_PAGE_URL;
        }
        String from = req.getParameter("from");
        if (isNullOrEmpty(from)) {
            from = "";
        }

        String tu = req.getParameter("tu");
        if (isNullOrEmpty(key)) {
            tu = "";
        }
        String key2=getLowerMd5(getLowerMd5("linktech^"+MEMBERID)+getLowerMd5(acct));
        if(!key.equals(key2)){
            url = MALL_HOME_PAGE_URL;
        }
        boolean flag = memberService.validateLogin(userName);
        MemberVO memberVO = new MemberVO();
        if (!flag) {
            //已注册过会员，直接登录
            memberVO = memberService.getMemberByKey(userName);
        } else {
            memberVO.setMemEmail(userName);
            memberVO.setMemPwd(UUID.randomUUID().toString().substring(28));
            memberVO.setLoginKey(userName);
            memberService.register(memberVO); //注册会员
            memberVO = memberService.getMemberByKey(userName);
        }
        if (memberVO != null) {;
            memberVO.setMemName(userName);
            String uid2 = UUID.randomUUID().toString();
            securityService.addLoginUser(uid2, memberVO);
            Cookie cookie = new Cookie("userTicket", uid2);
            cookie.setPath("/");
            cookie.setDomain("shopin.net");
            resp.addCookie(cookie);
            return "redirect:" + url;
        } else {
            m.addAttribute("error", "账户登陆失败，请重试");
            return "login";
        }
    }

    // / <summary>
    // / MD5加密算法
    private String getLowerMd5(String md5str) {
        String md5 = org.apache.commons.codec.digest.DigestUtils.md5Hex(md5str)
                .toLowerCase();
            return md5;
    }

    /*
    * 字符串是否为空或空白
    */

    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().length() == 0;
    }
}
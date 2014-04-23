package net.shopin.web.controller;

import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.util.LoadProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;
import java.util.regex.Pattern;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-5-10
 * Time: 12:45:28
 */
@Controller
public class KingLogController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;
    @Autowired
    BankConf bankConf;
    private final static String DOMAIN = LoadProperties.readValue("DOMAIN");
    //判断一个字符串是否是数字格式
    private final static Pattern NumbericRegexp = Pattern.compile("^\\d*$");
    //定义商家自己站点的首页地址，用于参数验证失败或者md5验证失败的时候跳转到首页
    private final static String MALL_HOME_PAGE_URL = "/index.html";

    @RequestMapping(value = "/kingLogin", method = {RequestMethod.GET, RequestMethod.POST})
    public String retrun(Model m, HttpServletRequest req, HttpServletResponse resp) {
        String toUrl = MALL_HOME_PAGE_URL;
        String acct = req.getParameter("acct");
        if (isNullOrEmpty(acct)) {
            return "redirect:" + toUrl;
        }
        String url = req.getParameter("url");
        if (isNullOrEmpty(url)) {
            url = MALL_HOME_PAGE_URL;
        }
        String merchantId = url.substring(url.indexOf("m=") + 2, url.indexOf("&from"));
        String md5key1 = getLowerMd5("linktech^" + merchantId, 32);
        String md5key2 = getLowerMd5(acct, 32);
        String md5key3 = getLowerMd5(md5key1 + md5key2, 32);

        String tu=url.substring(url.indexOf("tu=") + 3, url.length());

        acct = acct.substring(acct.indexOf("^") + 1, acct.length());

        String ts = req.getParameter("ts");
        if (isNullOrEmpty(ts)) {
            return "redirect:" + toUrl;
        }

        String key = req.getParameter("key");
        if (isNullOrEmpty(key) || key.length() != 32) {
            return "redirect:" + toUrl;
        }


        if (!md5key3.equals(key)) {
            // 如果vkey检测不通过，那么5秒后就跳转到商家首页
            return "redirect:" + toUrl;
        }

        String email = acct;
        boolean flag = memberService.validateLogin(acct);
        MemberVO memberVO = new MemberVO();
        if (!flag) {
            //已注册过支付宝会员，直接登录
            memberVO = memberService.getMemberByKey(acct);
        } else {
            memberVO.setMemEmail(email);
            memberVO.setMemPwd(UUID.randomUUID().toString().substring(28));
            memberVO.setLoginKey(acct);
            memberService.register(memberVO); //注册会员
            memberVO = memberService.getMemberByKey(acct);
        }

        if (memberVO != null) {
            //viewinfo = StringEscapeUtils.escapeHtml(URLDecoder.decode(viewinfo).replace("&nbsp;", " ")).replace(" ", "&nbsp;");
            //memberVO.setMemName(viewinfo);

            String uid2 = UUID.randomUUID().toString();
            securityService.addLoginUser(uid2, memberVO);
            Cookie cookie = new Cookie("userTicket", uid2);
            cookie.setPath("/");
            cookie.setDomain(DOMAIN);
            resp.addCookie(cookie);
            return "redirect:" + tu;
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
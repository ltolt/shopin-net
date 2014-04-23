package net.shopin.web.controller;

import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberAddressVO;
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
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.UUID;
import java.util.regex.Pattern;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-5-10
 * Time: 12:45:28
 */
@Controller
public class FanliLogController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;

    private final static Pattern NumbericRegexp = Pattern.compile("^\\d*$");
    private final static String MALL_HOME_PAGE_URL = "/myshopin/orders.html";
    private final static String KEY = "51fanlishopin";

//    private final static String DOMAIN="shopin.net";
    private final static String DOMAIN="1.202.151.98";

    @RequestMapping(value = "/fanliLogin", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(Model m, HttpServletRequest req, HttpServletResponse resp) {
        String channelid = req.getParameter("channelid");
        String u_id = req.getParameter("u_id");
        String url = req.getParameter("url");
        String code = req.getParameter("code");
        String syncname = req.getParameter("syncname");
        String usersafekey = req.getParameter("usersafekey");
        String action_time = req.getParameter("action_time");
        String email = req.getParameter("email");
        String pwd = req.getParameter("pwd");
        String syncaddress = req.getParameter("syncaddress");
        String username = null;
        String province = null;
        String city=null;
        String address = null;
        String name = null;
        try {
            username = URLDecoder.decode(req.getParameter("username"), "gb2312");
            name = URLDecoder.decode(req.getParameter("name"), "gb2312");
            province = URLDecoder.decode(req.getParameter("province"), "gb2312");
            city = URLDecoder.decode(req.getParameter("city"), "gb2312");
            String area = URLDecoder.decode(req.getParameter("area"), "gb2312");
            address = URLDecoder.decode(req.getParameter("address"), "gb2312");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String zip = req.getParameter("zip");
        String phone = req.getParameter("phone");
        String mobile = req.getParameter("mobile");
        String viewinfo = "";
        saveCookies(resp,channelid,u_id);
        if (url.equals("")) {
            url = MALL_HOME_PAGE_URL;
        }

        if (syncname.equals("false")) {
            return "redirect:" + url;
        }

        if (verifyActionTime(action_time) == false) {
            return "redirect:" + url;
        }
        if (verifyCode(username, KEY, action_time, code) == false) {
            return "redirect:" + url;
        }

        boolean flag = memberService.validateEmail(email);
        MemberVO memberVO = new MemberVO();
        if (flag == false) {
            memberVO = memberService.getMemberByEmail(email);
            if (!memberVO.getLoginKey().equals(usersafekey)) {
                return "redirect:" + url;
            }
        } else {
            memberVO.setMemEmail(email);
            memberVO.setMemName(username);
            memberVO.setLoginKey(usersafekey);
            memberVO.setMemPwd(pwd);
            memberService.register(memberVO);
            memberVO = memberService.getMemberByKey(usersafekey);
        }

        if (syncaddress.equals("true")) {
            MemberAddressVO vo = new MemberAddressVO();
            vo.setCityName(city);
            vo.setProvinceName(province);
            vo.setAddress(address);
            vo.setPostcode(zip);
            vo.setTel(phone);
            vo.setMobileTel(mobile);
//            saveAddress(vo);
        }

        if (memberVO != null) {
//            viewinfo = StringEscapeUtils.escapeHtml(URLDecoder.decode(viewinfo).replace("&nbsp;", " "))
//                    .replace(" ", "&nbsp;");
            viewinfo = "您好，返利网用户 " + username;
            memberVO.setMemName(viewinfo);
            String uid2 = UUID.randomUUID().toString();
            securityService.addLoginUser(uid2, memberVO);
            Cookie cookie = new Cookie("userTicket", uid2);
            cookie.setPath("/");
            cookie.setMaxAge(2592000);
            cookie.setDomain(DOMAIN);
            resp.addCookie(cookie);
            return "redirect:" + url;
        } else {
            return "redirect:" + url;
        }

    }

    private void saveAddress(MemberAddressVO vo) {
        memberService.saveAddress(vo);
    }

    private Boolean verifyActionTime(String time) {
        Boolean flag = false;
        long stand = 5 * 60 * 1000;
        Date now = new Date();
        long sub =  now.getTime()-Long.parseLong(time);
        if (sub < stand) {
            flag = true;
        }
        return flag;
    }

    private Boolean verifyCode(String username, String key, String actionTime, String code) {
        Boolean flag = false;
        String md5s = getLowerMd5(username + key + actionTime, 32);
        if (md5s.equals(code)) {
            flag = true;
        }
        return flag;
    }

    private void saveCookies(HttpServletResponse resp, String channelid, String uid) {
        Cookie c1 = new Cookie("LTINFO",uid);
        c1.setMaxAge(2592000);
        c1.setDomain(DOMAIN);
        c1.setPath("/");
        resp.addCookie(c1);

        Cookie c2 = new Cookie("LTYPE",channelid);
        c2.setMaxAge(2592000);
        c2.setDomain(DOMAIN);
        c2.setPath("/");
        resp.addCookie(c2);
    }


    private boolean isNumeric(String str) {
        return NumbericRegexp.matcher(str).matches();
    }


    // / MD5加密算法
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
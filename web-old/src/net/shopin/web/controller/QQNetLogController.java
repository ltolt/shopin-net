package net.shopin.web.controller;

import com.qq.config.Config;
import com.qq.connect.AccessToken;
import com.qq.connect.InfoToken;
import com.qq.connect.RequestToken;
import com.qq.util.ParseString;
import com.qq.util.Verify;
import com.qq.util.XMLHelper;
import com.shopin.modules.utils.Codec;
import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;
import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.util.LoadProperties;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.xml.sax.SAXException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.UUID;
import java.util.regex.Pattern;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-5-10
 * Time: 12:45:28
 */
@Controller
public class QQNetLogController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;
    @Autowired
    private MemcachedClient methodSecurityClient;

    private final static String DOMAIN = LoadProperties.readValue("DOMAIN");

    @RequestMapping(value = "/qqLog", method = {RequestMethod.GET, RequestMethod.POST})
    public String log(Model m, @RequestParam("forward") String forward, HttpServletRequest request, HttpServletResponse response) {
        String key = LoadProperties.readValue("QQ_API_KEY");
        String secret = LoadProperties.readValue("QQ_API_SECRET");
        String back = LoadProperties.readValue("QQ_REDIRECT_URL");
        if (forward == null || "".equals(forward)) {
            back = back + "index.html";
        } else {
            forward = forward.replace("/", "-");
            back = back + forward;
        }
        String redirect_url = "http://openapi.qzone.qq.com/oauth/qzoneoauth_authorize?oauth_consumer_key=" + key;
        try {
            RequestToken token = new RequestToken();
            String request_token = null;
            request_token = token.getRequestToken();
            HashMap<String, String> tokens = ParseString.parseTokenString(request_token);
            String oauth_token = tokens.get("oauth_token");
            String oauth_token_secret = tokens.get("oauth_token_secret");
            saveCookie(response, oauth_token_secret, "oauth_token_secret");
            redirect_url += "&oauth_token=" + oauth_token;
            redirect_url += "&oauth_callback=" + URLEncoder.encode(back, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + redirect_url;

    }

    @RequestMapping(value = "/qqLogReturn/{toUrl}", method = {RequestMethod.GET, RequestMethod.POST})
    public String logReturn(Model m, @PathVariable("toUrl") String toUrl, HttpServletRequest request, HttpServletResponse response) {
        String oauth_token = oauth_token = request.getParameter("oauth_token");
        String openid = openid = request.getParameter("openid");
        String oauth_signature = oauth_signature = request.getParameter("oauth_signature");
        String oauth_vericode = oauth_vericode = request.getParameter("oauth_vericode");
        String timestamp = timestamp = request.getParameter("timestamp");
        //QQ互联登录，授权成功后会回调此地址 必须要用授权的request token换取access token
        try {
            if (!Verify.verifyOpenID(openid, timestamp, oauth_signature)) {
                m.addAttribute("error", "openid verify false!");
//                return "login";
            }
            // 用授权的request token换取access token
            AccessToken token = new AccessToken();
            String oauth_token_secret = getFromCookie(request, "oauth_token_secret");
            String access_token = token.getAccessToken(oauth_token, oauth_token_secret, oauth_vericode);
            HashMap<String, String> tokens = ParseString.parseTokenString(access_token);
            if (tokens.get("error_code") != null) {
                m.addAttribute("error", tokens.get("error_code"));
                return "login";
            }
            // 获取access token成功后也会返回用户的openid
            if (!Verify.verifyOpenID(tokens.get("openid"), tokens.get("timestamp"), tokens.get("oauth_signature"))) {
                m.addAttribute("error", "openid verify false2!");
                return "login";
            }
            oauth_token = tokens.get("oauth_token");
            openid = tokens.get("openid");
            oauth_token_secret = tokens.get("oauth_token_secret");
            InfoToken infotoken = new InfoToken();
            String info_xml = infotoken.getInfo(oauth_token, oauth_token_secret, openid, "xml");
            HashMap<String, String> userinfo = XMLHelper.getInstance().getInfo(info_xml);
            String nickname = userinfo.get("nickname");
//            request.getSession().setAttribute("islogin", 1);
//            request.getSession().setAttribute("openid", openid);
//            request.getSession().setAttribute("nickname", new String(userinfo.get("nickname").getBytes("ISO-8859-1"), "UTF-8"));
//            request.getSession().setAttribute("oauth_token", oauth_token);
//            request.getSession().setAttribute("oauth_token_secret", oauth_token_secret);

            if (userinfo != null) {
                boolean flag = memberService.validateLogin(tokens.get("openid"));
                MemberVO memberVO = new MemberVO();
                if (!flag) {
                    //已注册,直接登录
                    memberVO = memberService.getMemberByKey(tokens.get("openid"));
                } else {
                    memberVO.setMemName("您好，QQ会员：" + nickname);
                    memberVO.setLoginKey(tokens.get("openid"));
                    memberVO.setMemEmail(tokens.get("openid") + "@shopin.qq.net");
                    memberVO.setMemPwd(UUID.randomUUID().toString().substring(28));
                    memberService.register(memberVO); //注册
                    memberVO = memberService.validate(memberVO.getMemEmail(), memberVO.getMemPwd()); //重新取出来memberVO
                }
                if (memberVO != null) {
                    memberVO.setMemName(nickname);
                    String uid2 = UUID.randomUUID().toString();
                    securityService.addLoginUser(uid2, memberVO);
                    saveCookie(response, uid2, "userTicket");
                    saveCookie(response, tokens.get("openid"), "openid");
                    saveCookie(response, tokens.get("openid"), "qqlog");
                    saveCookie(response, "linktech", "LTYPE");
                    notG2log(request, response);
                }
            } else {
                m.addAttribute("error", "request error，请重试");
                return "login";
            }
            if (toUrl.equals("index")) {
                return "redirect:" + "/index.html";
            } else {
                toUrl = toUrl.replace("-", "/") + ".html";
                return "redirect:" + toUrl;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "login";
    }

    private void saveCookie(HttpServletResponse response, String value, String key) {
        Cookie cookie = new Cookie(key, value);
        cookie.setPath("/");
        cookie.setDomain(DOMAIN);
        response.addCookie(cookie);
    }

    private String getFromCookie(HttpServletRequest request, String name) {
        String key = "";
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals(name)) {
                key = cookies[i].getValue();
            }
        }
        return key;
    }

    private void notG2log(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        String ltinfo = "";
        String ltype = "";
        String cid = "";
        String qqlog = "";
        String openid = "";
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("LTINFO")) ltinfo = cookies[i].getValue();
            if (cookies[i].getName().equals("LTYPE")) ltype = cookies[i].getValue();
            if (cookies[i].getName().equals("cid")) cid = cookies[i].getValue();
            if (cookies[i].getName().equals("openid")) openid = cookies[i].getValue();
            if (cookies[i].getName().equals("qqlog")) qqlog = cookies[i].getValue();
        }
        if (ltinfo.length() == 0) {
            Cookie ltinfos = new Cookie("LTINFO", "A100060164" + openid);
            ltinfos.setPath("/");
            ltinfos.setDomain(DOMAIN);
            response.addCookie(ltinfos);
        }
    }

}
package net.shopin.web.controller;

import com.shopin.modules.utils.Codec;
import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;
import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.util.LoadProperties;
import net.shopin.web.conf.sinaConf.Weboauth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import weibo4j.User;
import weibo4j.Weibo;
import weibo4j.WeiboException;
import weibo4j.http.AccessToken;
import weibo4j.http.RequestToken;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.UUID;
import java.util.concurrent.TimeoutException;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-5-10
 * Time: 12:45:28
 */
@Controller
public class SinaWeiBoLogController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;
    @Autowired
    BankConf bankConf;
    private static String DOMAIN = LoadProperties.readValue("DOMAIN");
    @Autowired
    private MemcachedClient methodSecurityClient;

    @RequestMapping(value = "/sinaLog", method = {RequestMethod.GET, RequestMethod.POST})
    public String toLogin(Model m, @RequestParam("forward") String forward, HttpServletRequest request, HttpServletResponse response) {
        String return_url = LoadProperties.readValue("SINA_REDIRECT_URL");
        if (forward == null || "".equals(forward)) {
            return_url = return_url + "index.html";
        } else {
            forward = forward.replace("/", "-");
            return_url = return_url + forward;
        }
        RequestToken resToken = Weboauth.request(return_url);
        if (resToken != null) {
            String uid = UUID.randomUUID().toString();
            String key = Codec.encodeMd5(uid);
            Cookie cookie = new Cookie("resToken", key);
            cookie.setPath("/");
            cookie.setDomain(DOMAIN);
            response.addCookie(cookie);
            try {
                methodSecurityClient.add(key, 0, resToken);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "redirect:" + resToken.getAuthorizationURL();
        } else {
            m.addAttribute("error", "新浪微博账户登陆失败request error，请重试");
            return "login";
        }
    }


    @RequestMapping(value = "/sinaLogReturn/{toUrl}", method = RequestMethod.GET)
    public String retrun(Model m, @PathVariable("toUrl") String toUrl, HttpServletRequest request, HttpServletResponse response) {
        try {
            String verifier = request.getParameter("oauth_verifier");
            if (verifier != null) {
                RequestToken resToken =getFromKey(request) ;
                if (resToken != null) {
                    AccessToken accessToken = Weboauth.requstAccessToken(resToken, verifier);
                    if (accessToken != null) {
                        Weibo weibo = new Weibo();
                        weibo.setToken(accessToken.getToken(), accessToken.getTokenSecret());
                        User user = weibo.verifyCredentials();
                        //第二个参数每次只能用一次，发表微博内容不能重复，如果重复发会返回400错误
                        if (user != null) {
                            boolean flag = memberService.validateLogin(user.getId() + "");
                            MemberVO memberVO = new MemberVO();
                            if (!flag) {
                                //已注册,直接登录
                                memberVO = memberService.getMemberByKey(user.getId() + "");
                            } else {
                                memberVO.setMemName(user.getName());
                                memberVO.setLoginKey(user.getId() + "");
                                memberVO.setMemEmail(user.getId() + "@sinaWeibo.com");
                                memberVO.setMemPwd(UUID.randomUUID().toString().substring(28));
                                memberService.register(memberVO); //注册
                                memberVO = memberService.validate(memberVO.getMemEmail(), memberVO.getMemPwd()); //重新取出来memberVO
                            }
                            if (memberVO != null) {
                                if (user.getName() != null && !"".equals(user.getName())) {
                                    memberVO.setMemName(user.getName());
                                }
                                String uid2 = UUID.randomUUID().toString();
                                securityService.addLoginUser(uid2, memberVO);
                                Cookie cookie = new Cookie("userTicket", uid2);
                                cookie.setPath("/");
                                cookie.setDomain(DOMAIN);
                                response.addCookie(cookie);
                                if (toUrl.equals("index")) {
                                    return "redirect:" + "/index.html";
                                } else {
                                    toUrl = toUrl.replace("-", "/") + ".html";
                                    return "redirect:" + toUrl;
                                }
                            }
                        } else {
                            m.addAttribute("error", "新浪微博API访问出错request error，请重试");
                            return "login";
                        }
                    } else {
                        m.addAttribute("error", "新浪微博API访问出错access token request error，请重试");
                        return "login";
                    }

                } else {
                    m.addAttribute("error", "新浪微博API访问出错request token session error，请重试");
                    return "login";
                }
            } else {
                m.addAttribute("error", "新浪微博API访问出错verifier String error，请重试");
                return "login";
            }
        } catch (WeiboException e) {
            m.addAttribute("error", "新浪微博API访问出错，请重试");
            e.printStackTrace();
        }
        return "login";
    }

    private RequestToken getFromKey(HttpServletRequest request) {
        String key = "";
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("resToken")) {
                key = cookies[i].getValue();
            }
        }
        RequestToken resToken = null;
        if (key != null && !"".equals(key)) {
            try {
                resToken = methodSecurityClient.get(key);
            } catch (TimeoutException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (MemcachedException e) {
                e.printStackTrace();
            }
        }
        return resToken;
    }

}
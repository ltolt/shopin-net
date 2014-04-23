package net.shopin.web.controller;

import com.renren.api.client.RenrenApiClient;
import com.renren.api.client.RenrenApiConfig;
import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.renrenConf.model.AccessToken;
import net.shopin.web.conf.renrenConf.util.*;
import net.shopin.web.util.LoadProperties;
import org.json.simple.JSONArray;
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
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 11-7-5
 * Time: 上午11:02
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class RenRenNetLogController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;

    @RequestMapping(value = "/renrenLog", method = {RequestMethod.GET, RequestMethod.POST})
    public String toLogin(Model m, @RequestParam("forward") String forward, HttpServletRequest request, HttpServletResponse response) {
        String redirect_url = LoadProperties.readValue("RENREN_REDIRECT_URL");
        String apikey = LoadProperties.readValue("RENREN_API_KEY");
        if (forward == null || "".equals(forward)) {
            redirect_url = redirect_url + "index.html";
        } else {
            forward = forward.replace("/", "-");
            redirect_url = redirect_url + forward;
        }
        StringBuffer authorizeurl = new StringBuffer();
        authorizeurl.append(CommonConst.RENREN_OAUTH_AUTHORIZE_URL);
        authorizeurl.append("?client_id=" + apikey);
        authorizeurl.append("&redirect_uri=" + redirect_url);
        authorizeurl.append("&response_type=code");
        authorizeurl.append("&connect_display=popup");
        m.addAttribute("authorizeurl", authorizeurl);
        return "toRenRenLog";
    }

    @RequestMapping(value = "/renrenReturn/{toUrl}", method = {RequestMethod.GET, RequestMethod.POST})
    public String retrun(Model m, @PathVariable("toUrl") String toUrl, HttpServletRequest request, HttpServletResponse response) {
        String redirect_url = LoadProperties.readValue("RENREN_REDIRECT_URL");
        redirect_url = redirect_url + toUrl + ".html";
        String authorization_code = request.getParameter("code");

        AccessToken accesstoken = accesstoken = XiaoneiOauthAccessTokenUtil.getAccessToken(authorization_code, redirect_url);
        String sessionkey_json = XiaoneiRestfulApiUtil.getXiaonei_SessionKey_info(accesstoken.getAccess_token());
        net.sf.json.JSONObject ob1 = net.sf.json.JSONObject.fromObject(sessionkey_json);

        net.sf.json.JSONArray userArray = net.sf.json.JSONArray.fromObject(ob1.get("user"));
        net.sf.json.JSONObject userObj = net.sf.json.JSONObject.fromObject(userArray.get(0));
        String uid = userObj.get("id").toString();

        net.sf.json.JSONArray sessionArray = net.sf.json.JSONArray.fromObject(ob1.get("renren_token"));
        net.sf.json.JSONObject sessionObj = net.sf.json.JSONObject.fromObject(sessionArray.get(0));
        String sessionKey = sessionObj.get("session_key").toString();
        String email = uid + "@renren.com";

        RenrenApiConfig.renrenApiKey = LoadProperties.readValue("RENREN_API_KEY");
        RenrenApiConfig.renrenApiSecret = LoadProperties.readValue("RENREN_API_SECRET");
        //调用JAVA SDK 传入参数sessionkey
        RenrenApiClient client = new RenrenApiClient(sessionKey);
        String fields = "id,name,sex,birthday,tinyurl,headurl,mainurl";
        //传入userid fields 获取用户信息 返回JSONArray 数据
        JSONArray renren_user = client.getUserService().getInfo(uid, fields);

        String realName = ((org.json.simple.JSONObject) renren_user.get(0)).get("name").toString();
        boolean flags = memberService.validateEmail(email);
        MemberVO memberVO = new MemberVO();
        if (!flags) {
            //已注册会员，直接登录
            memberVO = memberService.getMemberByEmail(email);
        } else {
            memberVO.setMemName(realName);
            memberVO.setLoginKey(uid);
            memberVO.setMemEmail(email);
            memberVO.setMemPwd(UUID.randomUUID().toString().substring(28));
            memberService.register(memberVO); //注册会员
            memberVO = memberService.validate(memberVO.getMemEmail(), memberVO.getMemPwd()); //重新取出来memberVO
        }

        if (memberVO != null) {
            String domain = LoadProperties.readValue("DOMAIN");
            if (realName != null && !"".equals(realName)) {
                memberVO.setMemName(realName);
            }
            String uid2 = UUID.randomUUID().toString();
            securityService.addLoginUser(uid2, memberVO);
            Cookie cookie = new Cookie("userTicket", uid2);
            cookie.setPath("/");
            cookie.setDomain(domain);
            response.addCookie(cookie);
        } else {
            m.addAttribute("error", "人人账户登陆失败，请重试");
            return "login";
        }

        if (toUrl.equals("index")) {
            return "redirect:" + "/index.html";
        } else {
            toUrl = toUrl.replace("-", "/") + ".html";
            return "redirect:" + toUrl;
        }
    }

}

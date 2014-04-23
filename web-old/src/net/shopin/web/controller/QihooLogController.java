package net.shopin.web.controller;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.QihooException;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.QihooSDK;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.User;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.http.AccessToken;
import net.shopin.web.util.LoadProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QihooLogController
{

  @Autowired
  IMemberService memberService;

  @Autowired
  ISecurityService securityService;
  private final String appKey = LoadProperties.readValue("CLIENT_ID");
  private final String sercretKey = LoadProperties.readValue("CLIENT_SECRET");
  private static final String RETURN_URL = LoadProperties.readValue("360_RETURN_URL");

  @RequestMapping(value={"/cps360/unionlog"}, method={org.springframework.web.bind.annotation.RequestMethod.GET, org.springframework.web.bind.annotation.RequestMethod.POST})
  public String toLogin(Model m, @RequestParam("forward") String forward, HttpServletRequest request, HttpServletResponse response)
  {
    String return_url = LoadProperties.readValue("360_RETURN_URL");
    if ((forward == null) || ("".equals(forward))) {
      return_url = return_url + "index.html";
    } else {
      forward = forward.replace("/", "-");
      return_url = return_url + forward;
    }
    String redirect_url = "https://openapi.360.cn/oauth2/authorize?client_id=" + this.appKey + "&response_type=code&redirect_uri=" + return_url + "&scope=basic&display=default";

    return "redirect:" + redirect_url;
  }

  @RequestMapping(value={"/cps360/unionreturn/{toUrl}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET, org.springframework.web.bind.annotation.RequestMethod.POST})
  public String code(Model model, HttpServletRequest request, HttpServletResponse response, @PathVariable("toUrl") String toUrl)
  {
    String authorizationCode = request.getParameter("code");
    QihooSDK qihooSDK = new QihooSDK();
    AccessToken accessToken = null;
    String token = null;
    try
    {
      if ((authorizationCode != null) && (!"".equals(authorizationCode))) {
        accessToken = qihooSDK.getOAuthAccessTokenFromCode(authorizationCode);
        token = accessToken.getToken();
      }

      User user = qihooSDK.getUserMe(token);
      MemberVO memberVO = new MemberVO();
      String qihooId = user.getId();
      String qihooName = user.getName();
      String qihooMail = qihooName + "@shopin.cn";

      if (this.memberService.validateEmail(qihooMail).booleanValue()) {
        memberVO.setMemEmail(qihooMail);
        memberVO.setMemPwd(qihooId);
        this.memberService.register(memberVO);
      }
      memberVO = this.memberService.validate(qihooMail, qihooId);
      String uid = UUID.randomUUID().toString();
      this.securityService.addLoginUser(uid, memberVO);
      Cookie cookie = new Cookie("userTicket", uid);
      cookie.setPath("/");
      cookie.setDomain("shopin.net");
      response.addCookie(cookie);

      if (toUrl.equals("index")) {
        return "redirect:/index.html";
      }
      toUrl = toUrl.replace("-", "/") + ".html";
      return "redirect:" + toUrl;
    }
    catch (QihooException e) {
      e.printStackTrace();
      return "login";
    } catch (NoSuchAlgorithmException e) {
      e.printStackTrace();
      return "login";
    } catch (KeyManagementException e) {
      e.printStackTrace();
    }return "login";
  }
}
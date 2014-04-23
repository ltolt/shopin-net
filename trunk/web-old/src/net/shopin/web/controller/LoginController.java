package net.shopin.web.controller;

import net.rubyeye.xmemcached.MemcachedClient;
import net.shopin.api.IMemberService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.view.UserLoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-7-29
 * Time: 12:45:28
 */
@Controller
public class LoginController {
    @Autowired
    IMemberService memberService;
    @Autowired
    ISecurityService securityService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLogin(Model m) {
        return "login";
    }

    @RequestMapping(value = "/logins", method = RequestMethod.POST)
    public String login(@RequestParam("forward") String forward,@ModelAttribute UserLoginVO userLoginVO,Model m, HttpServletRequest request,HttpServletResponse response) {

        MemberVO memberVO=memberService.validate(userLoginVO.getJ_username(), userLoginVO.getJ_password());
        if (memberVO!=null) {
            String uid = UUID.randomUUID().toString();
            securityService.addLoginUser(uid, memberVO);
            Cookie cookie = new Cookie("userTicket", uid);
            cookie.setPath("/");
            cookie.setDomain("shopin.net");
            response.addCookie(cookie);
            if(forward==null||"".equals(forward)){
               return "redirect:/index.html";
            }
            return "redirect:"+forward;
        } else {
            m.addAttribute("error","用户名或密码不正确");
            m.addAttribute("username",userLoginVO.getJ_username());
            m.addAttribute("password",userLoginVO.getJ_password());
            return "login";
        }
    }

}
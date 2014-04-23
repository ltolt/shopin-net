package net.shopin.web.controller;

import net.shopin.api.ISecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-1-27
 * Time: 13:50:47
 */
@Controller
public class LogoutController {
    @Autowired
    ISecurityService securityService;

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String getLogin(@CookieValue(value="userTicket",required=false,defaultValue="") String userTicket, HttpServletResponse response, Model m) {
        if (userTicket != null) {
            securityService.userLogout(userTicket);
        }
        String sid = java.util.UUID.randomUUID().toString();
        Cookie cookie = new Cookie("shopin_sid", sid);
        cookie.setMaxAge(-1);
        cookie.setPath("/");
        cookie.setDomain("shopin.net");
        response.addCookie(cookie);
        return "redirect:/index.html";
    }
}

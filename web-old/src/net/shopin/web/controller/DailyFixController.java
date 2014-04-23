package net.shopin.web.controller;

import net.shopin.api.IOrderService;
import net.shopin.exception.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-7-27
 * Time: 11:38:42
 */
@Controller
public class DailyFixController {

    @Autowired
    private IOrderService orderService;


    @RequestMapping(value = "/lianmeng/dailyFix", method = RequestMethod.GET)
    public String dailyFix(@RequestParam("yyyymmdd") String yyyymmdd,Model m){
        m.addAttribute("list",orderService.getLianMengDaily("linktech",yyyymmdd));
        return "dailyFix";
    }

}

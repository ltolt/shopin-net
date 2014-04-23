package net.shopin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-3-1
 * Time: 13:46:03
 */
@Controller
public class HelpController {

    @RequestMapping(value = "/help/{page}", method = RequestMethod.GET)
    public String getHelp(@PathVariable("page") String page,Model m) {
        return "help/"+page;
    }
}

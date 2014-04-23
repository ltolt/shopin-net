package net.shopin.web.controller;

import net.shopin.api.IMemberService;
import net.shopin.view.UserSubscribeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-4-20
 * Time: 13:06:57
 */
@Controller
public class SubscribeController {
    @Autowired
    IMemberService memberService;

    @RequestMapping(value = "/subscribe", method = RequestMethod.POST)
    public String subscribe(UserSubscribeVO userSubscribeVO, Model m) {
        m.addAttribute("subscribe", memberService.saveUserSubscribe(userSubscribeVO));
        return "subscribe";
    }

    @RequestMapping(value = "/toSubscribe", method = RequestMethod.GET)
    public String toSubscribe() {
        return "toSubscribe";
    }

    @RequestMapping(value = "/saveSubscribe", method = RequestMethod.POST)
    public String saveSubscribe(Model m, String email) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        if (email != null && !"".equals(email)) {
            UserSubscribeVO vo = new UserSubscribeVO();
            vo.setEmail(email);
            vo.setSubscribeDate(sdf.format(new Date()));
            m.addAttribute("subscribe", memberService.saveUserSubscribe(vo).getEmail());
        }
        return null;
    }
}

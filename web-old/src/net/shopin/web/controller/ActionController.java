package net.shopin.web.controller;

import net.shopin.api.IChannelService;
import net.shopin.api.INoticeService;
import net.shopin.api.IPromotionService;
import net.shopin.view.ChannelVO;
import net.shopin.view.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-4-2
 * Time: 17:30:48
 */
@Controller
public class ActionController {
    @Autowired
    private IPromotionService promotionService;
    @Autowired
    private IChannelService channelService;
    @Autowired
    private INoticeService noticeService;

    @RequestMapping(value = "/act/{page}", method = RequestMethod.GET)
    public String getHelp(@PathVariable("page") String page, Model m) {
        ChannelVO channelVO = channelService.getChannelByName("index");
        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));
        //打折快报
        List<NoticeVO> notices = noticeService.findNoticesByCate("0");
        //网站公告
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");

        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);
        return "act/"+page;
    }

    @RequestMapping(value = "/action/{page}", method = RequestMethod.GET)
    public String action(@PathVariable("page") String page, Model m) {
        return "action/"+page;
    }
}

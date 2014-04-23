package net.shopin.web.controller;

import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.*;
import net.shopin.view.ChannelPromotionVO;
import net.shopin.view.ChannelVO;
import net.shopin.view.NoticeVO;
import net.shopin.view.PromotionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-2-4
 * Time: 17:30:30
 */
@Controller
public class PromotionController {
    @Autowired
    private IPromotionService promotionService;

    @Autowired
    private IPromotionStoreShopService promotionStoreShopService;

    @Autowired
    private IChannelService channelService;

    @Autowired
    private INoticeService noticeService;

    @RequestMapping(value = "/promotion/{id}", method = RequestMethod.GET)
    public String memberZone(@PathVariable("id") String id,HttpServletRequest request, Model m) {
        PromotionVO promotionVO = promotionService.getPromotionVO(id);
        m.addAttribute("columns",promotionService.getPromotion(id));
        m.addAttribute("promotion",promotionVO);
        return promotionVO.getPageTemplate().getPage();
    }

    @RequestMapping(value = "/promotion/storeShop/{id}", method = RequestMethod.GET)
    public String storeShop(@PathVariable("id") String id,HttpServletRequest request, Model m) {
        PromotionVO promotionVO = promotionService.getPromotionVO(id);
        m.addAttribute("columns",promotionStoreShopService.getPromotion(id,"82"));
        m.addAttribute("promotion",promotionVO);
        return promotionVO.getPageTemplate().getPage();
    }

    @RequestMapping(value = "/promotions", method = RequestMethod.GET)
    public String index(HttpServletRequest request, Model m) {
        List<ChannelPromotionVO> relist = new ArrayList<ChannelPromotionVO>();
        List<ChannelVO> list = channelService.findAllChannels();
        for (int i = 0; i < list.size(); i++) {
            ChannelVO channelVO = list.get(i);
            List<PromotionVO> promotions = promotionService.findPromotion(channelVO.getSid());
            if(promotions!=null&&promotions.size()>0){
                PromotionVO promotionVO = promotions.get(0);
                ChannelPromotionVO channelPromotionVO = new ChannelPromotionVO();
                channelPromotionVO.setChannelDesc(channelVO.getChannelDesc());
                channelPromotionVO.setChannelUrl(channelVO.getChannelUrl());
                channelPromotionVO.setDisplayName(channelVO.getDisplayName());
                channelPromotionVO.setName(channelVO.getName());
                channelPromotionVO.setPromotionBeginTime(promotionVO.getPromotionBeginTime());
                channelPromotionVO.setPromotionBpict(promotionVO.getPromotionBpict());
                channelPromotionVO.setPromotionDesc(promotionVO.getPromotionDesc());
                channelPromotionVO.setPromotionEndTime(promotionVO.getPromotionEndTime());
                channelPromotionVO.setPromotionLink(promotionVO.getPromotionLink());
                channelPromotionVO.setPromotionTitle(promotionVO.getPromotionTitle());
                relist.add(channelPromotionVO);
            }
        }
        m.addAttribute("channels",list);
        m.addAttribute("actlist",relist);
        ChannelVO channelVO = channelService.getChannelByName("index");
        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));
        //打折快报
        List<NoticeVO> notices = noticeService.findNoticesByCate("0");
        //网站公告
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");

        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);
        m.addAttribute("page", "current");
        return "activity/promotions";
    }

    @RequestMapping(value = "/promotions-past", method = RequestMethod.GET)
    public String indexpast(HttpServletRequest request, Model m) {
        List<ChannelPromotionVO> relist = new ArrayList<ChannelPromotionVO>();
        List<ChannelVO> list = channelService.findAllChannels();
        for (int i = 0; i < list.size(); i++) {
            ChannelVO channelVO = list.get(i);
            List<PromotionVO> promotions = promotionService.findPastPromotion(channelVO.getSid());
            if(promotions!=null&&promotions.size()>0){
                PromotionVO promotionVO = promotions.get(0);
                ChannelPromotionVO channelPromotionVO = new ChannelPromotionVO();
                channelPromotionVO.setChannelDesc(channelVO.getChannelDesc());
                channelPromotionVO.setChannelUrl(channelVO.getChannelUrl());
                channelPromotionVO.setDisplayName(channelVO.getDisplayName());
                channelPromotionVO.setName(channelVO.getName());
                channelPromotionVO.setPromotionBeginTime(promotionVO.getPromotionBeginTime());
                channelPromotionVO.setPromotionBpict(promotionVO.getPromotionBpict());
                channelPromotionVO.setPromotionDesc(promotionVO.getPromotionDesc());
                channelPromotionVO.setPromotionEndTime(promotionVO.getPromotionEndTime());
                channelPromotionVO.setPromotionLink(promotionVO.getPromotionLink());
                channelPromotionVO.setPromotionTitle(promotionVO.getPromotionTitle());
                relist.add(channelPromotionVO);
            }
        }
        m.addAttribute("channels",list);
        m.addAttribute("actlist",relist);
        ChannelVO channelVO = channelService.getChannelByName("index");
        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));
        //打折快报
        List<NoticeVO> notices = noticeService.findNoticesByCate("0");
        //网站公告
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");

        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);
        m.addAttribute("page", "past");
        return "activity/promotions";
    }

    @RequestMapping(value = "/promotions-future", method = RequestMethod.GET)
    public String indexfuture(HttpServletRequest request, Model m) {
        List<ChannelPromotionVO> relist = new ArrayList<ChannelPromotionVO>();
        List<ChannelVO> list = channelService.findAllChannels();
        for (int i = 0; i < list.size(); i++) {
            ChannelVO channelVO = list.get(i);
            List<PromotionVO> promotions = promotionService.findPromotionOnTheWay(channelVO.getSid());
            if(promotions!=null&&promotions.size()>0){
                PromotionVO promotionVO = promotions.get(0);
                ChannelPromotionVO channelPromotionVO = new ChannelPromotionVO();
                channelPromotionVO.setChannelDesc(channelVO.getChannelDesc());
                channelPromotionVO.setChannelUrl(channelVO.getChannelUrl());
                channelPromotionVO.setDisplayName(channelVO.getDisplayName());
                channelPromotionVO.setName(channelVO.getName());
                channelPromotionVO.setPromotionBeginTime(promotionVO.getPromotionBeginTime());
                channelPromotionVO.setPromotionBpict(promotionVO.getPromotionBpict());
                channelPromotionVO.setPromotionDesc(promotionVO.getPromotionDesc());
                channelPromotionVO.setPromotionEndTime(promotionVO.getPromotionEndTime());
                channelPromotionVO.setPromotionLink(promotionVO.getPromotionLink());
                channelPromotionVO.setPromotionTitle(promotionVO.getPromotionTitle());
                relist.add(channelPromotionVO);
            }
        }
        m.addAttribute("channels",list);
        m.addAttribute("actlist",relist);
        ChannelVO channelVO = channelService.getChannelByName("index");
        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));
        //打折快报
        List<NoticeVO> notices = noticeService.findNoticesByCate("0");
        //网站公告
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");

        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);
        m.addAttribute("page", "future");
        return "activity/promotions";
    }

    @RequestMapping(value = "/promotions/{channel}", method = RequestMethod.GET)
    public String channel(@PathVariable("channel") String channel,HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName(channel);
        List<PromotionVO> promotions = promotionService.findPromotion(channelVO.getSid());
        List<ChannelVO> list = channelService.findAllChannels();
        m.addAttribute("channels",list);
        m.addAttribute("promotions", promotions);
        m.addAttribute("page", "current");
        m.addAttribute("channelname", channelVO);
        return "activity/channelpromotions";
    }

    @RequestMapping(value = "/promotions/{channel}/past", method = RequestMethod.GET)
    public String channelpast(@PathVariable("channel") String channel,HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName(channel);
        List<PromotionVO> pastpromotions = promotionService.findPastPromotion(channelVO.getSid());
        List<ChannelVO> list = channelService.findAllChannels();
        m.addAttribute("channels",list);
        m.addAttribute("promotions", pastpromotions);
        m.addAttribute("page", "past");
        m.addAttribute("channelname", channelVO);
        return "activity/channelpromotions";
    }
    
    @RequestMapping(value = "/promotions/{channel}/future", method = RequestMethod.GET)
    public String channelfuture(@PathVariable("channel") String channel,HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName(channel);
        List<PromotionVO> futurepromotions = promotionService.findPromotionOnTheWay(channelVO.getSid());
        List<ChannelVO> list = channelService.findAllChannels();
        m.addAttribute("channels",list);
        m.addAttribute("promotions", futurepromotions);
        m.addAttribute("page", "future");
        m.addAttribute("channelname", channelVO);
        return "activity/channelpromotions";
    }
}

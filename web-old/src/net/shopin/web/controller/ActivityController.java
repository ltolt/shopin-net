package net.shopin.web.controller;

import com.shopin.modules.security.interceptor.MethodSecurity;
import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;
import net.shopin.api.*;
import net.shopin.view.ChannelVO;
import net.shopin.view.MemberVO;
import net.shopin.view.NoticeVO;
import net.shopin.view.ProductQueryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * 活动控制器
 * Description:ActivityController.
 * User: Su Haibo
 * Date: 2010-1-16
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class ActivityController {

    @Autowired
    private IChannelService channelService;

    @Autowired
    private ISecurityService securityService;

    @Autowired
    private IProductService productService;

    @Autowired
    private IMemberService memberService;

    @Autowired
    private IPromotionService promotionService;

    @Autowired
    private IMemberAccountService memberAccountService;

    @Autowired
    private IMemberPointService memberPointService;
    @Autowired
    private INoticeService noticeService;

    @MethodSecurity
    @RequestMapping(value = "/memberzone", method = RequestMethod.GET)
    public String memberZone(@CookieValue(value = "userTicket", required = false) String uid, HttpServletRequest request, Model m) {
        PageVO page = new PageVO();
        MemberVO memberVo = securityService.getLoginUserId(uid);
        page = productService.getMemberProduct(page, "", memberVo.getMembersLevelSid());

        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/memberzone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));

        //会员及账户相关信息
        m.addAttribute("member", memberService.getMemberBySid(memberVo.getSid()));
        m.addAttribute("memberPoint", memberPointService.getPoint(memberVo.getSid()));
        m.addAttribute("memberAccount", memberAccountService.getAccount(memberVo.getSid()));

        //会员专享活动
        List<NoticeVO> notices = noticeService.findNoticesByCate("0");
        //网站公告
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");

        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);
        return "activity/memberzone";
    }

    @MethodSecurity
    @RequestMapping(value = "/memberzone/{page}", method = RequestMethod.GET)
    public String memberZonePage(@CookieValue(value = "userTicket", required = false) String uid, @PathVariable("page") int pageNo, HttpServletRequest request, Model m) {
        PageVO page = new PageVO();
        MemberVO memberVo = securityService.getLoginUserId(uid);
        page.setPageNo(pageNo);
        page = productService.getMemberProduct(page, "", memberVo.getMembersLevelSid());

        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/memberzone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));

        //会员及账户相关信息
        m.addAttribute("member", memberService.getMemberBySid(memberVo.getSid()));
        m.addAttribute("memberPoint", memberPointService.getPoint(memberVo.getSid()));
        m.addAttribute("memberAccount", memberAccountService.getAccount(memberVo.getSid()));

        //会员专享活动
        List<NoticeVO> notices = noticeService.findNoticesByCate("0");
        //网站公告
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");

        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);
        return "activity/memberzone";
    }

    @MethodSecurity
    @RequestMapping(value = "/{channel}/memberzone", method = RequestMethod.GET)
    public String channelMemberZone(@CookieValue(value = "userTicket", required = false) String uid, @PathVariable("channel") String channel, HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName(channel);
        MemberVO memberVo = securityService.getLoginUserId(uid);
        PageVO page = new PageVO();
        page = productService.getMemberProduct(page, channelVO.getProductClass(), memberVo.getMembersLevelSid());
        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/"+channel+"/memberzone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));

        //会员及账户相关信息
        m.addAttribute("member", memberService.getMemberBySid(memberVo.getSid()));
        m.addAttribute("memberPoint", memberPointService.getPoint(memberVo.getSid()));
        m.addAttribute("memberAccount", memberAccountService.getAccount(memberVo.getSid()));

        //会员专享活动
        List<NoticeVO> notices = noticeService.findNoticesByCate("0");
        //网站公告
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");

        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);
        return "activity/memberzone";
    }

    @MethodSecurity
    @RequestMapping(value = "/{channel}/memberzone/{page}", method = RequestMethod.GET)
    public String channelMemberZonePage(@CookieValue(value = "userTicket", required = false) String uid, @PathVariable("channel") String channel, @PathVariable("page") int pageNo, HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName(channel);
        MemberVO memberVo = securityService.getLoginUserId(uid);
        PageVO page = new PageVO();
        page.setPageNo(pageNo);
        page = productService.getMemberProduct(page, channelVO.getProductClass(), memberVo.getMembersLevelSid());
        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/"+channel+"/memberzone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));

        //会员及账户相关信息
        m.addAttribute("member", memberService.getMemberBySid(memberVo.getSid()));
        m.addAttribute("memberPoint", memberPointService.getPoint(memberVo.getSid()));
        m.addAttribute("memberAccount", memberAccountService.getAccount(memberVo.getSid()));

        //会员专享活动
        List<NoticeVO> notices = noticeService.findNoticesByCate("0");
        //网站公告
        List<NoticeVO> notices2 = noticeService.findNoticesByCate("1");

        m.addAttribute("notices", notices);
        m.addAttribute("notices2", notices2);
        return "activity/memberzone";
    }


    /**
     * 新品上架页面
     *
     * @return String
     * @roseuid 4B5031D80203
     */
    @RequestMapping(value = "/newzone")
    public String newZone(HttpServletRequest request, Model m,String recent) {
        ChannelVO channelVO = channelService.getChannelByName("index");
        m.addAttribute("columns", promotionService.findNewPromotionByChannel(channelVO.getSid()));
        ProductQueryVO queryVo = new ProductQueryVO();
        if (recent == null || "".equals(recent)) {
            recent = "3";
        }
        queryVo.setRecent(recent);

        PageVO page = new PageVO();
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("brands", productService.findCurrentBrandList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/newzone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo", queryVo);
        m.addAttribute("recent",recent);
        return "activity/newzone";
    }

    @RequestMapping(value = "/newzone/{page}")
    public String newZonePage(@PathVariable("page") int pageNo,String recent, HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName("index");
        m.addAttribute("columns", promotionService.findNewPromotionByChannel(channelVO.getSid()));
        ProductQueryVO queryVo = new ProductQueryVO();
        if (recent == null || "".equals(recent)) {
            recent = "3";
        }
        queryVo.setRecent(recent);
        PageVO page = new PageVO();
        page.setPageNo(pageNo);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("brands", productService.findCurrentBrandList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/newzone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo", queryVo);
        m.addAttribute("recent",recent);
        return "activity/newzone";
    }

    @RequestMapping(value = "/{channel}/newzone")
    public String channelNewZone(@PathVariable("channel") String channel, String recent, HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName(channel);
        m.addAttribute("columns", promotionService.findNewPromotionByChannel(channelVO.getSid()));
        ProductQueryVO queryVo = new ProductQueryVO();
        if (recent == null || "".equals(recent)) {
            recent = "3";
        }
        queryVo.setRecent(recent);
        PageVO page = new PageVO();
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("brands", productService.findCurrentBrandList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/newzone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo", queryVo);
        m.addAttribute("recent",recent);
        return "activity/newzone";
    }

    @RequestMapping(value = "/{channel}/newzone/{page}")
    public String channelNewZonePage(@PathVariable("channel") String channel, String recent, @PathVariable("page") int pageNo, HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName(channel);
        m.addAttribute("columns", promotionService.findNewPromotionByChannel(channelVO.getSid()));
        ProductQueryVO queryVo = new ProductQueryVO();
        if (recent == null || "".equals(recent)) {
            recent = "3";
        }
        queryVo.setRecent(recent);
        PageVO page = new PageVO();
        page.setPageNo(pageNo);
        page = productService.findProductPage(page, queryVo);
        m.addAttribute("cates", productService.findCurrentCateList(queryVo));
        m.addAttribute("brands", productService.findCurrentBrandList(queryVo));
        m.addAttribute("prices", productService.findCurrentPriceList(queryVo));
        m.addAttribute("discounts", productService.findCurrentDiscountList(queryVo));
        m.addAttribute("products", page.getList());
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/newzone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        m.addAttribute("queryVo", queryVo);
        m.addAttribute("recent",recent);
        return "activity/newzone";
    }

    /**
     * 超值抢购页面
     *
     * @return String
     * @roseuid 4B5031E300DA
     */
    @RequestMapping(value = "/onsalezone", method = RequestMethod.GET)
    public String onsaleZone(HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName("index");
        m.addAttribute("columns", promotionService.findRightValuePromotionByChannel(channelVO.getSid()));
        PageVO page = new PageVO();
        page = productService.getRightValueProduct(page, channelVO.getProductClass());
        m.addAttribute("products", page.getList());
        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));
        m.addAttribute("promotionsOnTheWay", promotionService.findPromotionOnTheWay(channelVO.getSid()));
        m.addAttribute("pastPromotions", promotionService.findPastPromotion(channelVO.getSid()));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/onsalezone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "activity/onsalezone";
    }

    @RequestMapping(value = "/onsalezone/{page}", method = RequestMethod.GET)
    public String onsaleZonePage(@PathVariable("page") int pageNo, HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName("index");
        m.addAttribute("columns", promotionService.findRightValuePromotionByChannel(channelVO.getSid()));
        PageVO page = new PageVO();
        page.setPageNo(pageNo);
        page = productService.getRightValueProduct(page, channelVO.getProductClass());
        m.addAttribute("products", page.getList());
        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));
        m.addAttribute("promotionsOnTheWay", promotionService.findPromotionOnTheWay(channelVO.getSid()));
        m.addAttribute("pastPromotions", promotionService.findPastPromotion(channelVO.getSid()));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/onsalezone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "activity/onsalezone";
    }

    @RequestMapping(value = "/{channel}/onsalezone", method = RequestMethod.GET)
    public String channelOnsaleZone(@PathVariable("channel") String channel, HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName(channel);
        m.addAttribute("columns", promotionService.findRightValuePromotionByChannel(channelVO.getSid()));
        PageVO page = new PageVO();
        page = productService.getRightValueProduct(page, channelVO.getProductClass());
        m.addAttribute("products", page.getList());
        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));
        m.addAttribute("promotionsOnTheWay", promotionService.findPromotionOnTheWay(channelVO.getSid()));
        m.addAttribute("pastPromotions", promotionService.findPastPromotion(channelVO.getSid()));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/onsalezone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "activity/onsalezone";
    }

    @RequestMapping(value = "/{channel}/onsalezone/{page}", method = RequestMethod.GET)
    public String channelOnsaleZonePage(@PathVariable("channel") String channel, @PathVariable("page") int pageNo, HttpServletRequest request, Model m) {
        ChannelVO channelVO = channelService.getChannelByName(channel);
        m.addAttribute("columns", promotionService.findRightValuePromotionByChannel(channelVO.getSid()));
        PageVO page = new PageVO();
        page.setPageNo(pageNo);
        page = productService.getRightValueProduct(page, channelVO.getProductClass());
        m.addAttribute("products", page.getList());
        m.addAttribute("promotions", promotionService.findPromotion(channelVO.getSid()));
        m.addAttribute("promotionsOnTheWay", promotionService.findPromotionOnTheWay(channelVO.getSid()));
        m.addAttribute("pastPromotions", promotionService.findPastPromotion(channelVO.getSid()));
        PageHelper pageHelper = new PageHelper(request, "page.ftl", "/onsalezone");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "activity/onsalezone";
    }
}

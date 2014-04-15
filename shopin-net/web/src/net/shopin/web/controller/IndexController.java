/**
 * 说明:
 *      v3三版网站首页和首页预览控制器
 * @Probject Name: web
 * @Path: net.shopin.web.controller.IndexController.java
 * @Create By kongm
 * @Create In 2013-7-17 上午10:45:45
 * TODO
 */
package net.shopin.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.shopin.api.IChannelService;
import net.shopin.api.INavigationService;
import net.shopin.api.INoticeService;
import net.shopin.api.IPageFieldService;
import net.shopin.api.IPromotionService;
import net.shopin.exception.TemplateException;
import net.shopin.view.AdvertisementVO;
import net.shopin.view.ChannelPromotionVO;
import net.shopin.view.ChannelVO;
import net.shopin.view.NavigationVO;
import net.shopin.view.NoticeVO;
import net.shopin.view.PromotionVO;

import org.perf4j.LoggingStopWatch;
import org.perf4j.StopWatch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Class Name IndexController
 * @Author kongm
 * @Create In 2013-7-17
 */
@Controller
@Scope("prototype")
public class IndexController {

    private  StopWatch stopWatch = null;
	
	@Autowired
	private IPromotionService promotionService;

	@Autowired
	private IChannelService channelService;

	@Autowired
	private INoticeService noticeService;

	@Autowired
	private IPageFieldService pageFiledService;

	@Autowired
	private INavigationService navigationService;
	
	/**
	 * 说明:
	 *     展示首页
	 * @Methods Name index
	 * @Create In 2013-9-6 By kongm
	 * @param m
	 * @param request
	 * @return
	 * @throws TemplateException
	 * @throws ParseException String
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model m, HttpServletRequest request)
			throws TemplateException, ParseException {
		stopWatch = new LoggingStopWatch();
		// 查询网站公告活动
		List<NoticeVO> notices = this.noticeService.findNoticesByCate("1");
		// 查询打折预告的活动
		List<NoticeVO> saleOff = this.noticeService.findNoticesByCate("0");
		m.addAttribute("notices", notices);
		m.addAttribute("saleOff", saleOff);
		stopWatch.lap("query notices");
		// 查询广告头
//		stopWatch = new LoggingStopWatch(" channel and ads ");
		ChannelVO channelsVO = this.channelService.getChannelByName("index");
		List<AdvertisementVO> ads = this.channelService
				.findAdsInChannel(channelsVO.getSid());
		//广告位设置  0 头部广告  1 待定  2 待定
		for (int i = 0; i < ads.size(); i++) {
			AdvertisementVO advertisementVO = (AdvertisementVO) ads.get(i);
			m.addAttribute("ads" + i, advertisementVO);
		}
		stopWatch.lap("query channel and ads");
		// 首页图片轮播--焦点图
//		stopWatch = new LoggingStopWatch(" promotions cost  ");
		List<PromotionVO> promotionsList = this.promotionService
				.findPromotion(channelsVO.getSid());
		m.addAttribute("promotions", promotionsList);
//		stopWatch.stop();
		stopWatch.lap("query promotions");
		// 获取正在进行频道活动列表
//		stopWatch = new LoggingStopWatch(" vip promotions  ");
		List<PromotionVO> promotions = this.promotionService
				.findVipPromotions();
		m.addAttribute("actlist", promotions);

		// 获取正在疯抢的频道活动
		List<PromotionVO> promotionfq = this.promotionService
				.findLastVipPromotions();
		m.addAttribute("actlastFQ", promotionfq);

		// 获取即将推出频道活动列表
		List<PromotionVO> promotionFuture = this.promotionService
				.findFutureVipPromotions();
		m.addAttribute("actlistOnTheWay", promotionFuture);
//		stopWatch.stop();
		stopWatch.lap("query vippromotions");
		// 根据频道查找栏目下的模板
//		stopWatch = new LoggingStopWatch(" columns  ");
		m.addAttribute("columns",
				this.pageFiledService.findColumnsByChannel(channelsVO.getSid()));
		stopWatch.stop("columns cost");
		return "index";
	}

}

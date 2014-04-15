/**
 * 说明:
 *     预览功能controller
 * @Probject Name: web
 * @Path: net.shopin.web.controller.PreviewController.java
 * @Create By kongm
 * @Create In 2013-7-31 下午1:55:14
 * TODO
 */
package net.shopin.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.shopin.api.IChannelService;
import net.shopin.api.INavigationService;
import net.shopin.api.INoticeService;
import net.shopin.api.IPageFieldService;
import net.shopin.api.IPromotionService;
import net.shopin.api.ISysParameterService;
import net.shopin.api.ITemplateService;
import net.shopin.exception.TemplateException;
import net.shopin.view.AdvertisementVO;
import net.shopin.view.ChannelPromotionVO;
import net.shopin.view.ChannelVO;
import net.shopin.view.NavigationVO;
import net.shopin.view.PageColumnVO;
import net.shopin.view.PageFieldTemplateVO;
import net.shopin.view.PageFieldVO;
import net.shopin.view.PromotionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Class Name PreviewController
 * @Author kongm
 * @Create In 2013-7-31
 */
@Controller
@Scope("prototype")
public class PreviewController {

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

	@Autowired
	private ISysParameterService sysParameterService;

	@Autowired
	private ITemplateService templateService;

	@RequestMapping(value = "/preview/{id}", method = RequestMethod.GET)
	public String index(Model m, @PathVariable("id") String id,
			HttpServletRequest request) throws TemplateException,
			ParseException {

		List notices = this.noticeService.findNoticesByCate("1");// 查询网站公告活动
		List saleOff = this.noticeService.findNoticesByCate("0");// 查询打折预告的活动
		m.addAttribute("notices", notices);
		m.addAttribute("saleOff", saleOff);

		// 查询广告头
		ChannelVO channelsVO = this.channelService.getChannelByName("index");
		List<AdvertisementVO> ads = this.channelService
				.findAdsInChannel(channelsVO.getSid());
		for (int i = 0; i < ads.size(); i++) {
			AdvertisementVO advertisementVO = (AdvertisementVO) ads.get(i);
			m.addAttribute("ads" + i, advertisementVO);
		}
		// 首页图片轮播
		List<PromotionVO> promotionsList = this.promotionService
				.findPromotion(channelsVO.getSid());
		m.addAttribute("promotions", promotionsList);

		// 首页频道活动
		List relist = new ArrayList();
		List list = this.channelService.findAllChannels();

		// 获取正在进行频道活动列表
		for (int i = 0; i < list.size(); i++) {
			ChannelVO channelVO = (ChannelVO) list.get(i);
			List promotions = this.promotionService.findPromotion(channelVO
					.getSid());
			if ((promotions != null) && (promotions.size() > 0)) {
				for (int j = 0; j < promotions.size(); j++) {
					PromotionVO promotionVO = (PromotionVO) promotions.get(j);
					ChannelPromotionVO channelPromotionVO = new ChannelPromotionVO();
					channelPromotionVO.setChannelDesc(channelVO
							.getChannelDesc());
					channelPromotionVO.setChannelUrl(channelVO.getChannelUrl());
					channelPromotionVO.setDisplayName(channelVO
							.getDisplayName());
					channelPromotionVO.setName(channelVO.getName());
					channelPromotionVO.setPromotionBeginTime(promotionVO
							.getPromotionBeginTime());
					channelPromotionVO.setPromotionBpict(promotionVO
							.getPromotionBpict());
					channelPromotionVO.setPromotionDesc(promotionVO
							.getPromotionDesc());
					channelPromotionVO.setPromotionEndTime(promotionVO
							.getPromotionEndTime());
					channelPromotionVO.setPromotionLink(promotionVO
							.getPromotionLink());
					channelPromotionVO.setPromotionTitle(promotionVO
							.getPromotionTitle());
					relist.add(channelPromotionVO);
				}
			}

		}
		m.addAttribute("channels", list);
		m.addAttribute("actlist", relist);

		// 获取正在疯抢的频道活动
		List relist1 = new ArrayList();
		List lastlist = new ArrayList();
		for (int i = 0; i < list.size(); i++) {

			ChannelVO channelVO = (ChannelVO) list.get(i);
			List<PromotionVO> promotions = this.promotionService
					.findPromotionFengQiang(channelVO.getSid());
			if ((promotions != null) && (promotions.size() > 0)) {
				for (int j = 0; j < promotions.size(); j++) {
					PromotionVO promotionVO = (PromotionVO) promotions.get(j);
					// Date tody = new Date();
					// Date endDay = promotionVO.getPromotionEndTime();
					// SimpleDateFormat df = new
					// SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					// String d1 = df.format(tody);
					// String d2 = df.format(endDay);
					// Date now = df.parse(d1);
					// Date end = df.parse(d2);
					// long diff = end.getTime() - now.getTime();
					// long days = diff / (1000 * 60 * 60 * 24);
					ChannelPromotionVO channelPromotionVO = new ChannelPromotionVO();
					channelPromotionVO.setChannelDesc(channelVO
							.getChannelDesc());
					channelPromotionVO.setChannelUrl(channelVO.getChannelUrl());
					channelPromotionVO.setDisplayName(channelVO
							.getDisplayName());
					channelPromotionVO.setName(channelVO.getName());
					channelPromotionVO.setPromotionBeginTime(promotionVO
							.getPromotionBeginTime());
					channelPromotionVO.setPromotionBpict(promotionVO
							.getPromotionBpict());
					channelPromotionVO.setPromotionDesc(promotionVO
							.getPromotionDesc());
					channelPromotionVO.setPromotionEndTime(promotionVO
							.getPromotionEndTime());
					channelPromotionVO.setPromotionLink(promotionVO
							.getPromotionLink());
					channelPromotionVO.setPromotionTitle(promotionVO
							.getPromotionTitle());
					relist1.add(channelPromotionVO);
				}
			}
		}
		m.addAttribute("actlistFQ", relist1);
		m.addAttribute("actlastFQ", relist1);

		// 获取即将推出频道活动列表
		List relist2 = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			ChannelVO channelVO = (ChannelVO) list.get(i);
			List promotions = this.promotionService
					.findPromotionOnTheWay(channelVO.getSid());
			if ((promotions != null) && (promotions.size() > 0)) {
				for (int j = 0; j < promotions.size(); j++) {
					PromotionVO promotionVO = (PromotionVO) promotions.get(j);
					ChannelPromotionVO channelPromotionVO = new ChannelPromotionVO();
					channelPromotionVO.setChannelDesc(channelVO
							.getChannelDesc());
					channelPromotionVO.setChannelUrl(channelVO.getChannelUrl());
					channelPromotionVO.setDisplayName(channelVO
							.getDisplayName());
					channelPromotionVO.setName(channelVO.getName());
					channelPromotionVO.setPromotionBeginTime(promotionVO
							.getPromotionBeginTime());
					channelPromotionVO.setPromotionBpict(promotionVO
							.getPromotionBpict());
					channelPromotionVO.setPromotionDesc(promotionVO
							.getPromotionDesc());
					channelPromotionVO.setPromotionEndTime(promotionVO
							.getPromotionEndTime());
					channelPromotionVO.setPromotionLink(promotionVO
							.getPromotionLink());
					channelPromotionVO.setPromotionTitle(promotionVO
							.getPromotionTitle());
					relist2.add(channelPromotionVO);
				}
			}
		}

		m.addAttribute("actlistOnTheWay", relist2);

		// 根据频道查找栏目下的模板
		List listColumn = new ArrayList();
		Map map = this.sysParameterService
				.getSysParameter("TEMPLATE_PARAMETER");
		List<PageFieldVO> listField = this.pageFiledService
				.findFieldsByPageLayoutSid(id);
		for (PageFieldVO fieldVo : listField) {
			PageFieldTemplateVO templateVo = fieldVo.getTemplateVo();
			if ((templateVo == null) || (templateVo.getTemplate() == null)
					|| ("".equals(templateVo.getTemplate()))) {
				throw new TemplateException("no template in page field.");
			}

			Map root = new HashMap();
			root.put("root", fieldVo);
			root.put("images", map.get("images"));
			root.put("ctx", map.get("ctx"));
			String str = this.templateService.getTemplate(templateVo.getName(),
					root);
			PageColumnVO columnVo = new PageColumnVO();
			columnVo.setSeq(fieldVo.getSeq());
			columnVo.setTemplate(str);
			listColumn.add(columnVo);
		}

		m.addAttribute("columns", listColumn);

		List<NavigationVO> navigations = this.navigationService
				.getAllNavigations();
		m.addAttribute("navigations", navigations);

		return "index";
	}

}

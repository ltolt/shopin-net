/**
 * 说明:
 *     网站三版频道控制器
 * @Probject Name: web
 * @Path: net.shopin.web.controller.ChannelController.java
 * @Create By kongm
 * @Create In 2013-8-12 上午11:16:10
 * TODO
 */
package net.shopin.web.controller;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import net.shopin.api.IBrandService;
import net.shopin.api.IChannelService;
import net.shopin.api.IPageFieldService;
import net.shopin.api.IPromotionService;
import net.shopin.exception.TemplateException;
import net.shopin.view.ChannelVO;
import net.shopin.view.PageColumnVO;
import net.shopin.view.PromotionVO;
import net.shopin.view.SsdBrandDisplay;

import org.perf4j.LoggingStopWatch;
import org.perf4j.StopWatch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Class Name ChannelController
 * @Author kongm
 * @Create In 2013-8-12
 */
@Controller
@Scope("prototype")
public class ChannelController {
	
	@Autowired
	private IPromotionService promotionService;
	@Autowired
	private IChannelService channelService;
	@Autowired
	private IPageFieldService pageFiledService;
	@Autowired
	private IBrandService brandService;
	
	/**
	 * 说明:
	 *   频道展示web tier
	 * @Methods Name channel
	 * @Create In 2013-9-23 By kongm
	 * @param m
	 * @param request
	 * @return String
	 */
	@RequestMapping(value = "/channel/{page}", method = RequestMethod.GET)
	public String channel(@PathVariable("page") String page,Model m, HttpServletRequest request){
		StopWatch stopWatch = new LoggingStopWatch();
		//获取频道信息
		ChannelVO channelVO = this.channelService.getChannelByName(page);
		List<PromotionVO> promotionsList = this.promotionService
				.findPromotion(channelVO.getSid());
		m.addAttribute("promotions", promotionsList);
		if(channelVO != null) {
			m.addAttribute("channel", channelVO);
			try {
				//根据频道id 获取栏目模版
				List<PageColumnVO> columns = this.pageFiledService.findColumnsByChannel(channelVO.getSid());
				m.addAttribute("columns", columns);
			} catch (TemplateException e) {
				e.printStackTrace();
			}
		} else {
			return "redirect:/index.html";
		}
		stopWatch.stop("channel page ");
		return "channel/"+page;
	}
	
	
	/**
	 * 说明:
	 *     品牌馆频道展示web tier
	 * @Methods Name brandStores
	 * @Create In 2013-8-12 By kongm
	 * @return String
	 */
	 @RequestMapping(value = "/channel/brandstores", method = RequestMethod.GET)
	 public String brandStores(Model m, HttpServletRequest request){
		 try{
			 StopWatch stopWatch = new LoggingStopWatch();
			 Map<String, List<SsdBrandDisplay>>  list= new TreeMap<String, List<SsdBrandDisplay>>();
					list = this.brandService.getAllBrands();
			 if(list==null){
				 return "redirect:/index.html";
			 }
			 m.addAttribute("root",list);
			 stopWatch.stop("brandstores page");
			 return "channel/brandstores";
		 }catch (Exception e) {
				e.printStackTrace();
				return "redirect:/index.html";
		}
	 }
}

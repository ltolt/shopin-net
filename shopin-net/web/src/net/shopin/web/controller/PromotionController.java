/**
\ * @Probject Name: web
 * @Path: net.shopin.web.controller.PromotionController.java
 * @Create By kongm
 * @Create In 2013-8-7 上午10:47:10
 * TODO
 */
package net.shopin.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;
import net.shopin.api.IPromotionService;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;
import net.shopin.view.PageColumnVO;
import net.shopin.view.PromotionVO;
import net.shopin.web.util.HttpClientUtil;
import net.shopin.web.util.LoadProperties;

import org.perf4j.LoggingStopWatch;
import org.perf4j.StopWatch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Class Name PromotionController
 * @Author kongm
 * @Create In 2013-8-7
 */
@Controller
@Scope("prototype")
public class PromotionController {
	
	@Autowired
	private IPromotionService promotionService;
	@Autowired
	private ISecurityService securityService;
	/**
	 * 双蛋活动接口
	 */
	private final static  String REMOTE_PROMOTION_URL = LoadProperties.readValue("REMOTE_PROMOTION_URL");
	
	/**
	 * 说明:
	 *     闪购活动页面
	 * @Methods Name vippromotion
	 * @Create In 2013-9-12 By kongm
	 * @param id
	 * @param request
	 * @param m
	 * @return String
	 */
	@RequestMapping(value = { "/vippromotion/{id}" }, method = { RequestMethod.GET })
	public String vippromotion(@PathVariable("id") String id,HttpServletRequest request, Model m){
		StopWatch stopWatch = new LoggingStopWatch();
		PromotionVO promotionVO = this.promotionService.getPromotionVO(id);
		if(promotionVO !=null && promotionVO.getSid() != null && !"".equals(promotionVO.getSid())) {
			List<PageColumnVO> flashColumns = this.promotionService.getPromotion(promotionVO.getSid());
			m.addAttribute("flashColumns", flashColumns);
			m.addAttribute("flashPromotion", promotionVO);
			stopWatch.stop("vippromotion page");
			return promotionVO.getPageTemplate().getPage();
		} else {
			return "redirect:/index.html";
		}
	}
	
	/**
	 * 说明:
	 *     正常活动页面
	 * @Methods Name promotion
	 * @Create In 2013-9-12 By kongm
	 * @param id
	 * @param request
	 * @param m
	 * @return String
	 */
	@RequestMapping(value = { "/promotion/{id}" }, method = { RequestMethod.GET })
	public String promotion(@PathVariable("id") String id,
			HttpServletRequest request, Model m) {
		StopWatch stopWatch = new LoggingStopWatch();
		PromotionVO promotionVO = this.promotionService.getPromotionVO(id);
		if(promotionVO !=null && promotionVO.getSid() != null && !"".equals(promotionVO.getSid())) {
			List<PageColumnVO> columns = this.promotionService.getPromotion(promotionVO.getSid());
			m.addAttribute("columns", columns);
			m.addAttribute("promotion", promotionVO);
			stopWatch.stop("promotion page");
			return promotionVO.getPageTemplate().getPage();
		} else {
			return "redirect:/index.html";
		}
		
	}
	
	/**
	 * 保存活动的报名信息
	 * @Methods Name saveActiveInfo
	 * @Create In 2013-12-16 By liheng
	 * @param m   spring封装模型
	 * @param uid 用户ID
	 * @param realName 真实姓名
	 * @param mobile   手机号
	 * @param city     所在城市
	 * @return String  返回地址
	 */
	@RequestMapping(value = { "/activeInfo" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET,
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public String saveActiveInfo(Model m,
			@CookieValue(value = "userTicket", required = false) String uid,String realName,String mobile,String city) {
		String isLogin = "0";
		
		// 如果是登陆状态 isLogin为1 否则为0
		MemberVO member=this.securityService.getLoginUserId(uid);
		if(member!=null){
			String email = "";
			isLogin = "1";
			email = member.getMemEmail();
			m.addAttribute("isLogin", "" + isLogin);
			Map<String,String> paramMap=new HashMap<String,String>();
			paramMap.put("email", email);
			paramMap.put("realName", realName);
			paramMap.put("mobile", mobile);
			paramMap.put("city", city);
			
			//保存注册信息
			String regInfo=HttpClientUtil.HttpPost(REMOTE_PROMOTION_URL, "insert", paramMap, "html");
			//String regInfo="{'success':'true'}";
			
			JSONObject regInfoJson = JSONObject.fromObject(regInfo);
			if(regInfoJson.get("success").equals("true")){
				m.addAttribute("success", true);
			}else{
				m.addAttribute("success",false);
				m.addAttribute("reason",regInfoJson.getString("reason"));
			}
			
		}else{
			m.addAttribute("isLogin", "" + isLogin);
			m.addAttribute("success",false);
		}
		return null;
	}
	
	

}

/**
 * 说明:
 *     网站单品页展示控制器
 * @Probject Name: web
 * @Path: net.shopin.web.controller.ProductController.java
 * @Create By kongm
 * @Create In 2013-8-1 下午6:03:15
 * TODO
 */
package net.shopin.web.controller;


import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;
import net.shopin.api.IProductService;
import net.shopin.api.ISecurityService;
import net.shopin.exception.SystemException;
import net.shopin.view.SsdProductVO;
import net.shopin.web.util.HttpUtil;
import net.shopin.web.util.SystemConstants;
import net.shopin.web.util.WebUtil;

import org.perf4j.LoggingStopWatch;
import org.perf4j.StopWatch;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * @Class Name ProductController
 * @Author kongm
 * @Create In 2013-8-1
 */
@Controller
@Scope("prototype")
public class ProductController {

	protected final Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private IProductService productService;

	@Autowired
	private ISecurityService securityService;
	

	/**
	 * 说明: 三版网站单品页面展示接口
	 * 
	 * @Methods Name productPage
	 * @Create In 2013-8-1 By kongm
	 * @param sid
	 * @param uid
	 * @param id
	 * @param m
	 * @param request
	 * @return String
	 */
	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String productPage(
			@CookieValue(value = "shopin_sid", required = false) String sid,
			@CookieValue(value = "userTicket", required = false) String uid,
			@PathVariable("id") String id, Model m, HttpServletRequest request) {
		StopWatch stopWatch = new LoggingStopWatch();
		String isLogin = "0";

		if (validateUid(uid)) {
			isLogin = "1";
		}
		if (!WebUtil.validatePath(id)) {
			return "redirect:/" + SystemConstants.PAGE_ROUTE_404;
		}
		try {

			SsdProductVO productVO = this.productService.getProduct(id);

			if (productVO == null) {
				return "redirect:/" + SystemConstants.PAGE_ROUTE_404;
			}
			if(null == productVO.getPromotionPrice() || "".equals(productVO.getPromotionPrice().trim()) ||null == productVO.getProDetail()||productVO.getProDetail().isEmpty() ){
				m.addAttribute("saleoff", 1);
			}
			m.addAttribute("root", productVO);
			m.addAttribute("isLogin",  isLogin);
			stopWatch.stop("productPage cost time ");
			return "product/productpage";

		} catch (SystemException e) {
			log.error("SSD System Remote Exception", e);
			stopWatch.stop("SSD Error","Exception is " + e);
			return "redirect:/index.html";
		} catch (Exception e) {
			e.printStackTrace();
			stopWatch.stop("Error","Exception is " + e);
			return "redirect:/index.html";
		}

	}

	@RequestMapping(value = { "/getStock" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public void getStock(Model m, String proDetailSid, String price,String flag) {
		StopWatch stopWatch = new LoggingStopWatch();
		long total = this.productService.getStockByDetail(proDetailSid, price,flag);
		m.addAttribute("result", Long.valueOf(total));
		stopWatch.stop("get stock ");
	}

	/**
	 * 说明：
	 * 		动态获取该类商品销售记录
	 * @Methods Name getSaleRecords
	 * @Create In 2013-12-31 By jingpeng
	 * @param id
	 * @param m
	 * @param request
	 * @return void
	 */
	@RequestMapping(value = "/product/getSaleRecords", method = {RequestMethod.GET, RequestMethod.POST})
	public void getSaleRecords(String id, Model m, HttpServletRequest request) {
		String resultJson = "";
		SsdProductVO productVO = this.productService.getProduct(id);
		//处理销售记录的获取
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("fromSystem", SystemConstants.FORM_SYSTEM);
		jsonObject.put("proSid", productVO.getSid());
		jsonObject.put("fetchSize", SystemConstants.FETCH_SIZE);
		try{
			String json=HttpUtil.HttpPostForLogistics(SystemConstants.ORDER_DETAIL_URL, "selectPurchaseRecords", jsonObject.toString());
			JSONObject jo = JSONObject.fromObject(json);
			 String success = jo.getString("success");
			 if("true".equals(success)){
			     m.addAttribute("result", json);
			 } else {
				 json = "{\"success\": \"false\"}";
				 m.addAttribute("result", json);
			 }
		}catch(Exception e){
			e.printStackTrace();
			log.error("OMS System Remote Exception,查询商品销售记录失败！", e);
			String json = "{\"success\": \"false\"}";
			m.addAttribute("result", json);
		}
	}
	
	/**
	 * 说明: 验证用户是否登录
	 * 
	 * @Methods Name validateUid
	 * @Create In 2013-9-12 By kongm
	 * @param uid
	 * @return boolean
	 */
	private boolean validateUid(String uid) {
		return (validateRequired(uid))
				&& (this.securityService.isUserLogin(uid));
	}

	private boolean validateRequired(String str) {
		return (str != null) && (!"".equals(str));
	}

}

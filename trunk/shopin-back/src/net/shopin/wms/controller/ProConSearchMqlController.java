/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.controllerProConSearchController.java
 * @Create By kongm
 * @Create In 2013-5-10 下午2:14:29
 * TODO
 */
package net.shopin.wms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.back.service.IProConSearchService;
import net.shopin.back.util.HttpUtil;
import net.shopin.back.util.RequestUtil;
import net.shopin.back.view.ProductKey;
import net.shopin.wms.service.IProBestDetailMqlService;
import net.shopin.wms.service.IProConSearchMqlService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.SystemConfig;
import com.framework.AbstractController;

/**
 * @Class Name ProConSearchController
 * @Author kongm
 * @Create In 2013-5-10
 */
@Controller
@RequestMapping(value = "/proConSearch")
public class ProConSearchMqlController extends AbstractController{

	protected final static Log logger = LogFactory.getLog(ProConSearchMqlController.class);
	
	@Autowired
	private IProConSearchMqlService proConSearchService;
	
	@Autowired
	private IProBestDetailMqlService proBestDetailService;
	/**
	 * @Example http://172.16.100.90:5080/ssdservice/bw/queryCategroys.html?node=1046
	 * @Methods Name getProClassTree
	 * @Create In 2013-5-22 By kongm
	 * @param m
	 * @param request
	 * @param response
	 * @param node
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = {"/proClassTree"},method = {RequestMethod.GET,RequestMethod.POST} )
	public String getProClassTree(Model m,HttpServletRequest request,HttpServletResponse response,String node){
		System.out.println(node);
		if(node == null || "".equals(node.trim()))return "{'success':false}";
		String json = "";
		try{
			Map paraMap = new HashMap();
			paraMap.put("node",node);
			json =  HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL, "bw/queryCategroys.html", paraMap);
		}catch (Exception e) {
			json = "{'success':false}";
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value = {"/queryPic"},method = {RequestMethod.GET,RequestMethod.POST} )
	public String queryPic(Model m,HttpServletRequest request,HttpServletResponse response,String productSid){
		System.out.println(productSid);
		if(productSid == null || "".equals(productSid.trim()))return "{'success':false}";
		String json = "";
		try{
			Map paraMap = new HashMap();
			paraMap.put("productSid",productSid);
			json =  HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL, "bw/queryPic.html", paraMap);
		}catch (Exception e) {
			json = "{'success':false}";
		}
		return json;
	}
	
	
	/**
	 * 
	 * @Methods Name saveProducts
	 * @Create In 2013-5-22 By kongm
	 * @param m
	 * @param request
	 * @param response
	 * @param pageLayoutSid
	 * @param productSids
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = {"/saveproducts"},method = {RequestMethod.GET,RequestMethod.POST} )
	public String saveProducts(Model m,HttpServletRequest request,HttpServletResponse response,String pageLayoutSid,String productSids){
		System.out.println(pageLayoutSid);
		System.out.println(productSids);
	    if(pageLayoutSid == null || productSids == null || "".equals(pageLayoutSid.trim()) || "".equals(productSids.trim())){
	    	return "{'success':'false'}";
	    }
		productSids = productSids.substring(0, productSids.length() - 1 );
		String[] productSidsArray =  productSids.split(",");
	    this.proBestDetailService.insertBatch(pageLayoutSid,productSidsArray);
		
		return "{'success':true}";
	}
	
	
	
	
	
	
	/**
	 * http://172.16.100.90:8080/ssdservice/bw/queryProducts.html?saleCode=1802765
	 * @Methods Name searchProduct
	 * @Create In 2013-5-16 By kongm
	 * @param productKey
	 * @param m
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = {"/search"},method = {RequestMethod.GET,RequestMethod.POST})
	public String searchProduct(@ModelAttribute ProductKey  productKey, Model m,HttpServletRequest request,HttpServletResponse response){
		System.out.println(productKey);
    	String resultJson = "";
		try {
//			productKey.setSaleCode(null);
//			this.proConSearchService.updateProConSearch(productKey);
			
			Map paraMap = RequestUtil.getRequestParaMap(productKey);
			resultJson =  HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL, "bw/queryProducts.html", paraMap);
		} catch (Exception e) {
			return "{success:false,result:[]}";
		}
		return "{success:true,result:" + resultJson + "}";
	}
	

}

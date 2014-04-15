/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controllerFlashProConSearch.java
 * @Create By Administrator
 * @Create In 2013-9-4 上午11:21:23
 * TODO
 */
package net.shopin.wms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import net.shopin.wms.service.IProBestDetailMqlService;
import net.shopin.wms.util.HttpUtil;
import net.shopin.wms.util.ProductKey;
import net.shopin.wms.util.RequestUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.SystemConfig;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * @Class Name FlashProConSearch
 * @Author Administrator
 * @Create In 2013-9-4
 */
@Controller
@RequestMapping(value = "/flashpcs")
public class FlashProConSearchController {
	@Autowired
	private IProBestDetailMqlService proBestDetailMqlService;
	
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
	    this.proBestDetailMqlService.insertBatch(pageLayoutSid,productSidsArray);
		
		return "{'success':true}";
	}
	
	@ResponseBody
	@RequestMapping(value = {"/search"},method = {RequestMethod.GET,RequestMethod.POST})
	public String searchProduct(@ModelAttribute ProductKey  productKey, Model m,HttpServletRequest request,HttpServletResponse response){
		System.out.println(productKey);
    	String resultJson = "";
		try {
			productKey.setSaleCode(null);
			//this.proConSearchService.updateProConSearch(productKey);
			
			Map paraMap = RequestUtil.getRequestParaMap(productKey);
			resultJson =  HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL, "bw/queryProducts.html", paraMap);
			
		} catch (Exception e) {
			return "{success:false,result:[]}";
		}
		//return "{'data':{'start':'0','limit':20,'pageSize':10,'currentPage':1,'totalRecords':0,'totalPages':0,'startRecords':0,'endRecords':0,'list':[]},'code':'SUCCESS','codeInfo':'操作成功!'}";
//		return "{'data':{'list':" + resultJson + "}}";
		return "{success:true,result:" + resultJson + "}";
	}
	
	@ResponseBody
	@RequestMapping(value = {"/searchBySkus"},method = {RequestMethod.GET,RequestMethod.POST})
	public String searchProductBySkus( String  proSku, Model m,HttpServletRequest request,HttpServletResponse response){
		//System.out.println(productKey);
    	String resultJson = "";
		try {
			//productKey.setSaleCode(null);
			//this.proConSearchService.updateProConSearch(productKey);
			
			Map paraMap = new HashMap();
			paraMap.put("param",proSku);
			resultJson =  HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL, "bw/productFlg.html", paraMap);
		} catch (Exception e) {
			return "{success:false,result:[]}";
		}
		//return "{'data':{'start':'0','limit':20,'pageSize':10,'currentPage':1,'totalRecords':0,'totalPages':0,'startRecords':0,'endRecords':0,'list':[]},'code':'SUCCESS','codeInfo':'操作成功!'}";
//		return "{'data':{'list':" + resultJson + "}}";
		return  resultJson ;
	}
	
	@ResponseBody
	@RequestMapping(value = {"/searchByFlashPlan"},method = {RequestMethod.GET,RequestMethod.POST})
	public String searchByFlashPlan( String  flashPlanSid, Model m,HttpServletRequest request,HttpServletResponse response){
    	String resultJson = "";
		try {
			Map paramMap = new HashMap();
			paramMap.put("PlanID", flashPlanSid);
			String parajson = new  GsonBuilder().create().toJson(paramMap);
			resultJson = HttpUtil.HttpPostForLogistics(SystemConfig.FLASH_PLAN, "SelectProByPlanId",parajson);
			resultJson=resultJson.replaceAll("\\\\","");
			resultJson=resultJson.replaceAll("context", "result");
			resultJson=resultJson.replaceAll("\"Sid\"", "\"sid\"");
			resultJson=resultJson.replaceAll("\"ProSku\"", "\"proSku\"");
			resultJson=resultJson.replaceAll("\"BrandName\"", "\"proBrand\"");
			resultJson=resultJson.replaceAll("\"ProName\"", "\"productName\"");
			resultJson=resultJson.replaceAll("\"CurrentOffValue\"", "\"offValue\"");
			resultJson=resultJson.replaceAll("\"ProSid\"", "\"proSid\"");
			resultJson=resultJson.substring(1,resultJson.length()-1);
			JsonParser parser = new JsonParser();
			JsonObject obj =  parser.parse(resultJson).getAsJsonObject();
			Gson gson = new GsonBuilder().create(); 
			resultJson=gson.toJson(obj);
			System.out.println(resultJson);
		} catch (Exception e) {
			return "{success:false,result:[]}";
		}
		return  resultJson ;
	}
	
	@ResponseBody
	@RequestMapping(value = {"/queryFlashPlan"},method = {RequestMethod.GET,RequestMethod.POST})
	public String queryFlashPlan(Model mode,HttpServletRequest request,HttpServletResponse response){
    	String resultJson = "";
		try {
			resultJson = HttpUtil.HttpPostForLogistics(SystemConfig.FLASH_PLAN, "GetUnexpirePlan", "");
			resultJson=resultJson.replaceAll("\\\\","");
			resultJson=resultJson.substring(1,resultJson.length()-1);
			JsonParser parser = new JsonParser();
			JsonObject obj =  parser.parse(resultJson).getAsJsonObject();
			Gson gson = new GsonBuilder().create(); 
			resultJson=gson.toJson(obj);
		} catch (Exception e) {
			return "{success:false,result:[]}";
		}
		return  resultJson ;
	}

}

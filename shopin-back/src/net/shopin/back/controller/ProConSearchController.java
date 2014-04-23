/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.controllerProConSearchController.java
 * @Create By kongm
 * @Create In 2013-5-10 下午2:14:29
 * TODO
 */
package net.shopin.back.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.back.entity.cond.ProConSearchCond;
import net.shopin.back.entity.vo.ProConSearchVO;
import net.shopin.back.service.IProBestDetailService;
import net.shopin.back.service.IProConSearchService;
import net.shopin.back.util.HttpUtil;
import net.shopin.back.util.RequestUtil;
import net.shopin.back.view.ProductKey;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.InfoConstants.CodeInfo;
import com.constants.SystemConfig;
import com.framework.AbstractController;
import com.framework.page.Paginator;
import com.framework.returnObj.Infos;

/**
 * @Class Name ProConSearchController
 * @Author kongm
 * @Create In 2013-5-10
 */
@Controller
@RequestMapping(value = "/pcs")
public class ProConSearchController extends AbstractController{

	protected final static Log logger = LogFactory.getLog(ProConSearchController.class);
	
	@Autowired
	private IProConSearchService proConSearchService;
	
	@Autowired
	private IProBestDetailService proBestDetailService;
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
			productKey.setSaleCode(null);
			this.proConSearchService.updateProConSearch(productKey);
			
			Map paraMap = RequestUtil.getRequestParaMap(productKey);
			resultJson =  HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL, "bw/queryProducts.html", paraMap);
		} catch (Exception e) {
			return "{success:false,result:[]}";
		}
		//return "{'data':{'start':'0','limit':20,'pageSize':10,'currentPage':1,'totalRecords':0,'totalPages':0,'startRecords':0,'endRecords':0,'list':[]},'code':'SUCCESS','codeInfo':'操作成功!'}";
//		return "{'data':{'list':" + resultJson + "}}";
		return "{success:true,result:" + resultJson + "}";
	}
	

	
	/**
	 * 
	 * @Methods Name selectProduct
	 * @Create In 2013-5-20 By kongm
	 * @param m
	 * @param request
	 * @param response
	 * @param totalJson
	 * @param selectSids
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = {"/selectproduct"},method = {RequestMethod.GET,RequestMethod.POST})
	public String selectProduct(Model m,HttpServletRequest request,HttpServletResponse response,String totalJson,String selectSids){
		System.out.println(totalJson);
		System.out.println(selectSids);
		
		return "";
	}
	
	
	
	
	
	
	
	/**
	 * 
	 * @Methods Name find
	 * @Create In 2013-5-10 By kongm
	 * @param sid
	 * @param m
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/{sid}",method = {RequestMethod.GET,RequestMethod.POST})
	public String find(@PathVariable Long sid,Model m,HttpServletRequest request,HttpServletResponse response){
		Infos infos = init(request, "sid=" + sid);
		Assert.notNull(this.proConSearchService);
		try {
			ProConSearchVO vo =  this.proConSearchService.findObjBySid(infos, sid);
			setReturnObj(infos, vo);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		}finally{
			return returnResultJson(infos);
		}
	}
	
	/**
	 * 
	 * @Methods Name query
	 * @Create In 2013-5-10 By kongm
	 * @param cond
	 * @param m
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = {"/query"},method = {RequestMethod.GET,RequestMethod.POST})
	public String query(@ModelAttribute("pcsCond") ProConSearchCond cond , Model m ,HttpServletRequest request,HttpServletResponse response){
		Infos infos = init(request, cond);
		Paginator page = null;
		try {
			page = this.proConSearchService.queryObjs(infos, cond);
			setReturnObj(infos, page);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		}finally{
			return  returnResultJson(infos);
		}
	}
	
	/**
	 * 
	 * @Methods Name insert
	 * @Create In 2013-5-10 By kongm
	 * @param cond
	 * @param m
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = {"/insert"},method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(@ModelAttribute("pcsCond")ProConSearchCond cond , Model m ,HttpServletRequest request,HttpServletResponse response){
		Infos infos = init(request, cond);
		try {
			this.proConSearchService.insert(infos, cond);
			setReturnObj(infos, true);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		}finally{
			return returnResultJson(infos);
		}
	}
	/**
	 * 
	 * @Methods Name update
	 * @Create In 2013-5-10 By kongm
	 * @param cond
	 * @param m
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = {"/update"},method = {RequestMethod.GET,RequestMethod.POST})
	public String update(@ModelAttribute("pcsCond")ProConSearchCond cond , Model m ,HttpServletRequest request,HttpServletResponse response){
		Infos infos = init(request, cond);
		try {
			this.proConSearchService.update(infos, cond);
			setReturnObj(infos, true);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		}finally{
			return returnResultJson(infos);
		}
	}
	/**
	 * 
	 * @Methods Name delete
	 * @Create In 2013-5-10 By kongm
	 * @param sid
	 * @param m
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = {"/delete/{sid}"},method = {RequestMethod.GET,RequestMethod.POST})
	public String delete(@PathVariable("sid")Long sid, Model m ,HttpServletRequest request,HttpServletResponse response){
		Infos infos = init(request, "sid=" + sid);
		try {
			this.proConSearchService.delete(infos, sid);
			setReturnObj(infos, true);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		}finally{
			return returnResultJson(infos);
		}
	}
	
	
	
	
}

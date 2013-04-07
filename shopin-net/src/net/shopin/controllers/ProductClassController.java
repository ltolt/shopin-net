package net.shopin.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.service.IProductClassService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import base.framework.util.PageModel;
import base.framework.util.json.JsonUtil;


/**
 * 网站商品品类管理
 * @author k
 *
 */
@Controller
public class ProductClassController {

	private final static Logger log = LoggerFactory.getLogger(ProductClassController.class);
	
	@Autowired
	private IProductClassService productClassService;
	
	
	@RequestMapping(value = {"/catemanage"},method = {RequestMethod.GET,RequestMethod.POST})
	public String welcome(Model m ,HttpServletRequest request,HttpServletResponse response){
		
		return "/manage/catemanage";
	}
	
	@ResponseBody
	@RequestMapping(value = {"/catetreeload"},method = {RequestMethod.GET,RequestMethod.POST})
	public void cateTreeJson(Model m,HttpServletRequest request,HttpServletResponse response,String node ){
		Assert.notNull(request.getParameter("node"));
		Assert.notNull(this.productClassService,"productClassService can not be null");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out = null;
		try {
			
			 String json = this.productClassService.getChildProductClassJson(Integer.valueOf(node==null?"1":node));
			 out = response.getWriter();
			 out.write(json);
//			 out.write("[{text:'男装',id:'22',leaf:'false'},{text:'女装',id:'23',leaf:true}]");
			 out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		return  "[{text:'男装',id:'22',leaf:'false'}]";
	}
	
	@RequestMapping(value = {"/listClass"},method = {RequestMethod.GET,RequestMethod.POST})
	public void listProductClass(Model m,HttpServletResponse response){
		String rows = this.productClassService.getListClassForGrid();
		log.info(rows);
		Map  map  = new LinkedHashMap();
		map.put("rows", rows);
		map.put("results", 10);
		String json = JsonUtil.Object2JsonFilter(map);
		try {
			Map logMap = new LinkedHashMap();
			logMap.put("action","listClass");
			logMap.put("response",map);
			log.info(JsonUtil.Object2JsonFilter(logMap));
			response.setContentType("text/json;charset=UTF-8");
			PrintWriter out =response.getWriter();
			out.write(json);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	

	
	
	
}



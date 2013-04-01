package net.shopin.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.entity.ProductList;
import net.shopin.service.IProductService;
import net.shopin.service.TestService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import base.framework.AbstractControllerSupport;
import base.framework.util.json.JsonUtil;

@Controller
public class DemoController extends AbstractControllerSupport {

	@Autowired
	private IProductService productService;
	
	@Autowired
	private TestService testService;
	
	@RequestMapping(value={"/train/{forward}"},method = {RequestMethod.GET,RequestMethod.POST})
	public String forward(Model m,HttpServletRequest request,HttpServletResponse response,@PathVariable String forward){
		Assert.notNull(forward);
		init(request,"democontroller", "forward", "");
		return "train/" + forward;
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = {"/demoh"},method = {RequestMethod.GET,RequestMethod.POST})
	public void  testHibernateSession(HttpServletRequest request,HttpServletResponse response){
		Assert.notNull(this.productService);
 		List list = productService.getAll();
// 		JSONArray json = new JSONArray();
// 		JSONObject object = null; 
// 		if(list != null && list.size()>0){
// 			for(int i = 0;i<list.size();i++){
// 				ProductList pro = (ProductList) list.get(i);
// 				object = new JSONObject();
// 				object.put("id", pro.getSid());
// 				json.add(object);
// 			}
// 		}
// 		return JsonUtil.Object2Json(list);

 		PrintWriter out = null;
 		try {
 			Map map = new LinkedHashMap();
 			map.put("success", true);
 			map.put("memo", "success");
 			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.write(JsonUtil.Object2JsonFilter(map));
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
	}
	
	
	/**
	 * 测试缓存
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = {"/demo.html"},method = {RequestMethod.GET,RequestMethod.POST})
	public String test(){
		testService.testSysCache();
		JSONObject json = new JSONObject();
		json.put("success", "true");
		return json.toString();
	}
	
	
}

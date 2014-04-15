/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.controllerShopinRuleController.java
 * @Create By shiying
 * @Create In 2013-6-19 下午1:53:24
 * TODO
 */
package net.shopin.back.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.back.service.ITRulesService;
import net.shopin.back.util.HttpUtil;
import net.shopin.back.util.RequestUtil;
import net.shopin.back.view.ChannelsVO;
import net.shopin.back.view.ProductKey;
import net.shopin.back.view.RulesVO;

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
 * @Class Name ShopinRuleController
 * @Author shiying
 * @Create In 2013-6-19
 */
@Controller
@RequestMapping(value = "/rules")
public class ShopinRuleController extends AbstractController{
	
	@Autowired
	private ITRulesService trulesService;
	@ResponseBody
	@RequestMapping(value = {"/queryRules"},method = {RequestMethod.GET,RequestMethod.POST})
	public String queryRules(String sid, Model m,HttpServletRequest request,HttpServletResponse response){
		//JSONArray resultJson = new JSONArray();
		String result="";
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			List<ChannelsVO> vo = this.trulesService.findRules();
			
			jsonMap.put("success", "true");
	        jsonMap.put("result", vo);
	        result = JSONObject.fromObject(jsonMap).toString();


		//	resultJson =JSONArray.fromObject(vo);
			
		
		} catch (Exception e) {
			e.printStackTrace();
			ChannelsVO vo= new ChannelsVO();
				jsonMap.put("success", "false");
		        jsonMap.put("result",vo);
				
		        result = JSONObject.fromObject(jsonMap).toString();
			
		}
		//return "{'data':{'start':'0','limit':20,'pageSize':10,'currentPage':1,'totalRecords':0,'totalPages':0,'startRecords':0,'endRecords':0,'list':[]},'code':'SUCCESS','codeInfo':'操作成功!'}";
//		return "{'data':{'list':" + resultJson + "}}";
		return result;
	}
	

}

/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controllerShopChannelsMqlController.java
 * @Create By Administrator
 * @Create In 2013-9-27 上午1:43:29
 * TODO
 */
package net.shopin.wms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.shopin.back.view.ChannelsVO;
import net.shopin.wms.service.ITRuelsMqlService;
import net.shopin.wms.util.ChannelsMqlVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Class Name ShopChannelsMqlController
 * @Author Administrator
 * @Create In 2013-9-27
 */
@Controller
@RequestMapping(value = "/mqlrules")
public class ShopRulesMqlController {

	
	@Autowired
	private ITRuelsMqlService rulesMqlService;
	@ResponseBody
	@RequestMapping(value = {"/queryRules"},method = {RequestMethod.GET,RequestMethod.POST})
	public String queryRules(String sid, Model m,HttpServletRequest request,HttpServletResponse response){
		//JSONArray resultJson = new JSONArray();
		String result="";
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			List<ChannelsMqlVO> vo = this.rulesMqlService.findRules();
			
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

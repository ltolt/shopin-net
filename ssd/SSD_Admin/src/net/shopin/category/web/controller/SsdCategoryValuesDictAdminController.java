package net.shopin.category.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.category.domain.entity.SsdCategory;
import net.shopin.category.domain.entity.SsdCategoryPropsDict;
import net.shopin.category.domain.entity.SsdCategoryValuesDict;
import net.shopin.category.domain.vo.SsdCategoryValuesDictVO;
import net.shopin.service.ISsdCategoryPropsDictService;
import net.shopin.service.ISsdCategoryService;
import net.shopin.service.ISsdCategoryValuesDictService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SsdCategoryValuesDictAdminController {

	@Autowired
	private ISsdCategoryValuesDictService ssdCategoryValuesDictService;
	
	@Autowired
	private ISsdCategoryPropsDictService ssdCategoryPropsDictService;
	
	@Autowired
	private ISsdCategoryService categoryService;
	
	@RequestMapping(value = "/valuesdict/init", method = RequestMethod.GET)
	public String init(Model m, HttpServletRequest request,
			HttpServletResponse response){
		return "/category/values_view";
	}
	
	@ResponseBody
	@RequestMapping(value = "/valuesdict/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String list(Model model,HttpServletRequest request,HttpServletResponse response,
			String page,String rows,String valuesName){
		
		SsdCategoryValuesDict scp = new SsdCategoryValuesDict();
		if (!(valuesName == null || "".equals(valuesName))) {
			scp.setValuesName(valuesName);
		}
		scp.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
		scp.setPageSize(Integer.valueOf(rows));
		int total = this.ssdCategoryValuesDictService.selectPageTotal(scp);
		
		List<SsdCategoryValuesDictVO> lists = this.ssdCategoryValuesDictService.selectPage(scp);
		Map<String, Object> jsonMap = new HashMap<String, Object>();  
        jsonMap.put("total", total);
        jsonMap.put("rows", lists);
        String result = JSONObject.fromObject(jsonMap).toString();
        return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/valuesdict/add", method = RequestMethod.POST)
	public String add(Model m, HttpServletRequest request,String sid,
			HttpServletResponse response,String id,String valuesName,
			String valuesDesc, String valuesCode,String status,String channelSid) {
		int flag;
		if (sid == null || "".equals(sid)) {
			SsdCategoryValuesDict scpd = new SsdCategoryValuesDict();
			scpd.setValuesName(valuesName);
			scpd.setValuesDesc(valuesDesc);
			scpd.setValuesCode(valuesCode);
			scpd.setStatus(Long.valueOf(status));
			Long sortOrder = this.ssdCategoryValuesDictService.getMaxSortOrder(Long.valueOf(channelSid),1L);
			scpd.setSortOrder(sortOrder+1);
			scpd.setChannelSid(Long.valueOf(channelSid));
			flag = this.ssdCategoryValuesDictService.save(scpd);
			scpd.setValuesSid(scpd.getSid());
			flag = this.ssdCategoryValuesDictService.update(scpd);
		} else {
			SsdCategoryValuesDict scpd = new SsdCategoryValuesDict();
			scpd.setValuesName(valuesName);
			scpd.setValuesDesc(valuesDesc);
			scpd.setValuesCode(valuesCode);
			scpd.setStatus(Long.valueOf(status));
			scpd.setChannelSid(Long.valueOf(channelSid));
			scpd.setSid(Long.valueOf(sid));
			flag = this.ssdCategoryValuesDictService.update(scpd);
		}
		String result = "";
		if (flag == 1) {
			result = JSONObject.fromObject("{success:true}").toString();
		} else {
			result = JSONObject.fromObject("{success:flase}").toString();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/valuesdict/edit", method = {RequestMethod.POST,RequestMethod.GET})
	public String edit(Model m, HttpServletRequest request,
			HttpServletResponse response,String id) {
		
		SsdCategoryValuesDict scpd = this.ssdCategoryValuesDictService.get(Long.valueOf(id));
		JSONObject json = new JSONObject();
		json.put("valuesName", scpd.getValuesName());
		json.put("valuesDesc", scpd.getValuesDesc());
		json.put("valuesCode", scpd.getValuesCode());
		json.put("status", scpd.getStatus());
		json.put("channelSid", scpd.getChannelSid());
		String data = json.toString();
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/valuesdict/del", method = RequestMethod.POST)
	public String del(Model m, HttpServletRequest request,
			HttpServletResponse response,String id) {
		int flag = this.ssdCategoryValuesDictService.delete(Long.valueOf(id));
		String result = "";
		if (flag == 1) {
			result = JSONObject.fromObject("{success:true}").toString();
		} else {
			String message = "该类目不能删除！！";
			result = JSONObject.fromObject("{success:false,errorMsg:'"+message+"'}").toString();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/valuescombox/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String comboxlist(Model model,HttpServletRequest request,HttpServletResponse response,String id){
		
		SsdCategory sc = this.categoryService.get(Long.valueOf(id));
		SsdCategoryValuesDict scp = new SsdCategoryValuesDict();
		scp.setChannelSid(sc.getChannelSid());
		List<SsdCategoryValuesDict> lists = this.ssdCategoryValuesDictService.selectList(scp);
		JSONArray jsons = new JSONArray();
		for (SsdCategoryValuesDict scvd : lists) {
			JSONObject json = JSONObject.fromObject(scvd);
			jsons.add(json);
		}
        String result = jsons.toString();
        return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/valuesbox/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String comboxvlist(Model model,HttpServletRequest request,HttpServletResponse response,String sid){
		
		SsdCategoryPropsDict scpd = this.ssdCategoryPropsDictService.get(Long.valueOf(sid));
		SsdCategoryValuesDict scp = new SsdCategoryValuesDict();
		scp.setChannelSid(scpd.getChannelSid());
		scp.setPropsSid(scpd.getPropsSid());
		List<SsdCategoryValuesDict> lists = this.ssdCategoryValuesDictService.selectList(scp);
		JSONArray jsons = new JSONArray();
		for (SsdCategoryValuesDict scvd : lists) {
			JSONObject json = JSONObject.fromObject(scvd);
			jsons.add(json);
		}
        String result = jsons.toString();
        return result;
	}
}

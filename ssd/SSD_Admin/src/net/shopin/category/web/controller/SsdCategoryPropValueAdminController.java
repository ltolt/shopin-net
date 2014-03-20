package net.shopin.category.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.category.domain.entity.SsdCategory;
import net.shopin.category.domain.entity.SsdCategoryPropValues;
import net.shopin.category.domain.entity.SsdCategoryPropsDict;
import net.shopin.category.domain.entity.SsdCategoryValuesDict;
import net.shopin.category.domain.entity.SsdChannel;
import net.shopin.service.ISsdCategoryPropValuesService;
import net.shopin.service.ISsdCategoryPropsDictService;
import net.shopin.service.ISsdCategoryService;
import net.shopin.service.ISsdCategoryValuesDictService;
import net.shopin.service.ISsdChannelService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.shopin.core.framework.base.vo.AjaxMessageVO;

@Controller
public class SsdCategoryPropValueAdminController {

	@Autowired
	private ISsdCategoryService categoryService;
	
	@Autowired
	private ISsdChannelService ssdChannelService;
	
	@Autowired
	private ISsdCategoryPropsDictService ssdCategoryPropsDictService;
	
	@Autowired
	private ISsdCategoryValuesDictService ssdCategoryValuesDictService;
	
	@Autowired
	private ISsdCategoryPropValuesService ssdCategoryPropValuesService;
	
	@ResponseBody
	@RequestMapping(value = "/props/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String list(Model model,HttpServletRequest request,HttpServletResponse response,
			String propsName,String cid,String page,String rows){
		
		SsdCategory sc = this.categoryService.get(Long.valueOf(cid));
		SsdCategoryPropValues scpv = new SsdCategoryPropValues();
		scpv.setCategorySid(sc.getCategorySid());
		if (!(propsName == null || "".equals(propsName))) {
			scpv.setPropsName(propsName);
		}
		scpv.setChannelSid(sc.getChannelSid());
		int total = this.ssdCategoryPropValuesService.selectPropsVOTotal(scpv);
		
		scpv.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
		scpv.setPageSize(Integer.valueOf(rows));
		List<SsdCategoryPropValues> lists = this.ssdCategoryPropValuesService.selectPropsVO(scpv);
		Map<String, Object> jsonMap = new HashMap<String, Object>();  
        jsonMap.put("total", total);
        jsonMap.put("rows", lists);
        String result = JSONObject.fromObject(jsonMap).toString();
        return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/values/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String list(Model model,HttpServletRequest request,HttpServletResponse response,
			String propsSid,String categorySid,String channelSid,String page,String rows){
		
		SsdCategoryPropValues scpv = new SsdCategoryPropValues();
		scpv.setCategorySid(Long.valueOf(categorySid));
		scpv.setChannelSid(Long.valueOf(channelSid));
		scpv.setPropsSid(Long.valueOf(propsSid));
		int total = this.ssdCategoryPropValuesService.selectPageTotal(scpv);
		
		scpv.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
		scpv.setPageSize(Integer.valueOf(rows));
		List<SsdCategoryPropValues> lists = this.ssdCategoryPropValuesService.selectPage(scpv);
		Map<String, Object> jsonMap = new HashMap<String, Object>();  
        jsonMap.put("total", total);
        jsonMap.put("rows", lists);
        String result = JSONObject.fromObject(jsonMap).toString();
        return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/provalues/add", method = {RequestMethod.POST,RequestMethod.GET})
	public String addPropsAndValues(Model model,HttpServletRequest request,HttpServletResponse response,
			String cid,String name,String propsid){
		
		int flag = -1;
		long start = System.currentTimeMillis();
		List<SsdCategoryPropValues> scpvlist = new ArrayList<SsdCategoryPropValues>();
		StringBuffer sb = new StringBuffer();
		SsdCategory sc = this.categoryService.get(Long.valueOf(cid));
		if (propsid != null && propsid.length() > 0) {
			String[] propid = propsid.split(",");
			for (String pid : propid) {
				SsdCategoryPropsDict scpd = this.ssdCategoryPropsDictService.get(Long.valueOf(pid));
				SsdCategoryValuesDict scvd = new SsdCategoryValuesDict();
				scvd.setPropsSid(scpd.getPropsSid());
				scvd.setStatus(1L);
				scvd.setChannelSid(scpd.getChannelSid());
				List<SsdCategoryValuesDict> scvds = this.ssdCategoryValuesDictService.selectList(scvd);
				if (scvds.size() > 0) {
					for (SsdCategoryValuesDict sd : scvds) {
						SsdCategoryPropValues scpv = new SsdCategoryPropValues();
						scpv.setCategoryName(name);
						scpv.setCategorySid(sc.getCategorySid());
						scpv.setChannelSid(scpd.getChannelSid());
						scpv.setPropsSid(scpd.getPropsSid());
						scpv.setPropsName(scpd.getPropsName());
						scpv.setValuesSid(sd.getValuesSid());
						scpv.setValuesName(sd.getValuesName());
						scpv.setOptDate(new Date());
						scpvlist.add(scpv);
					}
				} else {
					if (sb.length() == 0) {
						sb.append(scpd.getPropsName());
					} else {
						sb.append(","+scpd.getPropsName());
					}
				}
			}
		} else {
			this.ssdCategoryPropValuesService.deleteByProperties(sc.getCategorySid(), sc.getChannelSid());
			flag = 1;
		}
		if (sb.length() > 0) {
			flag = -2;
		}
		if (scpvlist.size() > 0 && flag != -2) {
			this.ssdCategoryPropValuesService.deleteByProperties(sc.getCategorySid(), sc.getChannelSid());
			for (SsdCategoryPropValues scpv : scpvlist) {
				flag = this.ssdCategoryPropValuesService.saveorupdate(scpv);
			}
//			flag = this.ssdCategoryPropValuesService.save(scpvlist);
		}
		AjaxMessageVO result=new AjaxMessageVO();
		if (flag >= 0) {
			result.setStatus("success");
			result.setMessage("操作成功");
		} else if (flag == -2) {
			result.setStatus("failure");
			String message = "你选择的["+sb.toString()+"]等属性没有有效的属性值!";
			result.setMessage(message);
		} else {
			result.setStatus("failure");
			result.setMessage("操作失败");
		}
		long end = System.currentTimeMillis();
		System.out.println("update propval time is :"+(end-start));
		Gson gson=new Gson();
		return gson.toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/propvals/edit", method = {RequestMethod.POST,RequestMethod.GET})
	public String update(Model m, HttpServletRequest request,
			HttpServletResponse response,String id) {
		
		SsdCategory sc = this.categoryService.get(Long.valueOf(id));
		SsdCategoryPropValues s= new SsdCategoryPropValues();
		s.setCategorySid(sc.getCategorySid());
		s.setChannelSid(sc.getChannelSid());
		List<SsdCategoryPropValues> scpvs = this.ssdCategoryPropValuesService.selectPropsVOList(s);
		List<Long> vids = new ArrayList<Long>();
		if (scpvs.size() > 0) {
			for (SsdCategoryPropValues ss : scpvs) {
				SsdCategoryPropsDict scpd = new SsdCategoryPropsDict();
				scpd.setChannelSid(sc.getChannelSid());
				scpd.setPropsSid(ss.getPropsSid());
				List<SsdCategoryPropsDict> list = this.ssdCategoryPropsDictService.selectList(scpd);
				vids.add(list.get(0).getSid());
			}
		}
		JSONObject json = new JSONObject();
		json.put("name", sc.getName());
		json.put("propsid", vids);
		String data = json.toString();
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/chancombox/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String comboxlist(Model model,HttpServletRequest request,HttpServletResponse response){
		
		SsdChannel sc = new SsdChannel();
		
		List<SsdChannel> lists = this.ssdChannelService.selectList(sc);
		JSONArray jsons = new JSONArray();
		for (SsdChannel s : lists) {
			JSONObject json = JSONObject.fromObject(s);
			jsons.add(json);
		}
        String result = jsons.toString();
        return result;
	}
}

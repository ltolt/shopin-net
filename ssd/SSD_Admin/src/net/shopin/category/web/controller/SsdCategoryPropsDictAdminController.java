package net.shopin.category.web.controller;

import java.io.UnsupportedEncodingException;
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
import net.shopin.category.domain.vo.SsdCategoryPropsDictVO;
import net.shopin.service.ISsdCategoryPropValuesService;
import net.shopin.service.ISsdCategoryPropsDictService;
import net.shopin.service.ISsdCategoryService;
import net.shopin.service.ISsdCategoryValuesDictService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.shopin.core.util.LoadProperties;

@Controller
public class SsdCategoryPropsDictAdminController {

	@Autowired
	private ISsdCategoryPropsDictService ssdCategoryPropsDictService;
	
	@Autowired
	private ISsdCategoryValuesDictService ssdCategoryValuesDictService;
	
	@Autowired
	private ISsdCategoryPropValuesService ssdCategoryPropValuesService;
	
	@Autowired
	private ISsdCategoryService categoryService;
	
	@RequestMapping(value = "/propsdict/init", method = RequestMethod.GET)
	public String init(Model m, HttpServletRequest request,
			HttpServletResponse response){
		return "/category/props_view";
	}
	
	@ResponseBody
	@RequestMapping(value = "/propsdict/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String list(Model model,HttpServletRequest request,HttpServletResponse response,
			String page,String rows,String propsName,String propsDesc){
		
		SsdCategoryPropsDict scp = new SsdCategoryPropsDict();
		if (!(propsName == null || "".equals(propsName))) {
			scp.setPropsName(propsName);
		}
		if (!(propsDesc == null || "".equals(propsDesc))) {
			scp.setPropsDesc(propsDesc);
		}
		
		String channelSid = LoadProperties.readValue("channel.WEB");
		scp.setChannelSid(Long.valueOf(channelSid));
		scp.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
		scp.setPageSize(Integer.valueOf(rows));
		int total = this.ssdCategoryPropsDictService.selectPageTotal(scp);
		
		List<SsdCategoryPropsDictVO> lists = this.ssdCategoryPropsDictService.selectPage(scp);
		Map<String, Object> jsonMap = new HashMap<String, Object>();  
        jsonMap.put("total", total);
        jsonMap.put("rows", lists);
        String result = JSONObject.fromObject(jsonMap).toString();
        return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/propsdict/add", method = RequestMethod.POST)
	public String add(Model m, HttpServletRequest request,String sid,
			HttpServletResponse response,String id,String propsName,String insert1,String update1,
			String propsDesc, String propsCode,String status,String delete1) throws UnsupportedEncodingException {
		int flag;
		Long propSid = 0L;
		String channelSid = LoadProperties.readValue("channel.WEB");
		if (sid == null || "".equals(sid)) {
			SsdCategoryPropsDict scpd = new SsdCategoryPropsDict();
			scpd.setPropsName(propsName);
			scpd.setPropsDesc(propsDesc);
			scpd.setPropsCode(propsCode);
			scpd.setStatus(Long.valueOf(status));
			scpd.setIsErpProp(0L);
			Long sortOrder = this.ssdCategoryPropsDictService.getMaxSortOrder(Long.valueOf(channelSid));
			scpd.setSortOrder(sortOrder+1);
			scpd.setChannelSid(Long.valueOf(channelSid));
			flag = this.ssdCategoryPropsDictService.save(scpd);
			propSid = scpd.getSid();
			scpd.setPropsSid(scpd.getSid());
			flag = this.ssdCategoryPropsDictService.update(scpd);
		} else {
			SsdCategoryPropsDict scpd = this.ssdCategoryPropsDictService.get(Long.valueOf(sid));
			propSid = scpd.getPropsSid();
			scpd.setPropsName(propsName);
			scpd.setPropsDesc(propsDesc);
			scpd.setPropsCode(propsCode);
			scpd.setStatus(Long.valueOf(status));
			scpd.setChannelSid(Long.valueOf(channelSid));
			flag = this.ssdCategoryPropsDictService.update(scpd);
			
			SsdCategoryPropValues scpv = new SsdCategoryPropValues();
			scpv.setPropsSid(propSid);
			scpv.setChannelSid(Long.valueOf(channelSid));
			List<SsdCategoryPropValues> list = this.ssdCategoryPropValuesService.selectList(scpv);
			if (list.size() > 0) {
				for (SsdCategoryPropValues ss : list) {
					ss.setPropsName(propsName);
					if ("1".equals(status)) {
						flag = this.ssdCategoryPropValuesService.update(ss);
					} else {
						flag = this.ssdCategoryPropValuesService.delete(ss.getSid());
					}
				}
			} 
		}
		if (!(insert1 == null || "".equals(insert1))) {
			System.out.println("SSD insert before:"+insert1);
			//String name = new String(insert1.getBytes("iso8859-1"),"utf-8"); //去掉这句Linux没有乱码,window会有乱码;加上这句window正常,Linux会有乱码
			String name = insert1;
			System.out.println("SSD insert after:"+name);
			List<SsdCategoryValuesDict> listInsert = JSON.parseArray(name, SsdCategoryValuesDict.class);
			for (SsdCategoryValuesDict scvd : listInsert) {
				scvd.setChannelSid(Long.valueOf(channelSid));
				Long sortOrder = this.ssdCategoryValuesDictService.getMaxSortOrder(Long.valueOf(channelSid),propSid);
				scvd.setSortOrder(sortOrder+1);
				//scvd.setStatus(1L);
				scvd.setIsErpValue(0L);
				scvd.setPropsSid(propSid);
				flag = this.ssdCategoryValuesDictService.save(scvd);
				scvd.setValuesSid(scvd.getSid());
				flag = this.ssdCategoryValuesDictService.update(scvd);
				
				SsdCategoryPropValues scpv = new SsdCategoryPropValues();
				scpv.setPropsSid(propSid);
				scpv.setChannelSid(Long.valueOf(channelSid));
				List<SsdCategoryPropValues> list = this.ssdCategoryPropValuesService.selectCateVO(scpv);
				if (list.size() > 0) {
					for (SsdCategoryPropValues ss : list) {
						SsdCategoryPropValues scpv1 = new SsdCategoryPropValues();
						scpv1.setCategorySid(ss.getCategorySid());
						scpv1.setCategoryName(ss.getCategoryName());
						scpv1.setPropsSid(propSid);
						scpv1.setPropsName(propsName);
						scpv1.setValuesName(scvd.getValuesName());
						scpv1.setValuesSid(scvd.getValuesSid());
						scpv1.setChannelSid(Long.valueOf(channelSid));
						scpv1.setOptDate(new Date());
						if (scvd.getStatus().equals(Long.valueOf(1)) && "1".equals(status)) {
							flag = this.ssdCategoryPropValuesService.saveorupdate(scpv1);
						}
					}
				}
			}
		}
		if (!(update1 == null || "".equals(update1))) {
			System.out.println("SSD update before:"+update1);
			//String name = new String(update1.getBytes("iso8859-1"),"utf-8");
			String name = update1;
			System.out.println("SSD update after:"+name);
			List<SsdCategoryValuesDict> listUpdate = JSON.parseArray(name, SsdCategoryValuesDict.class);
			for (SsdCategoryValuesDict scvd : listUpdate) {
				this.ssdCategoryValuesDictService.update(scvd);
				SsdCategoryPropValues scpv = new SsdCategoryPropValues();
				scpv.setPropsSid(propSid);
				scpv.setChannelSid(Long.valueOf(channelSid));
				List<SsdCategoryPropValues> list = this.ssdCategoryPropValuesService.selectList(scpv);
				if (list.size() > 0) {
					for (SsdCategoryPropValues ss : list) {
						SsdCategoryPropValues scpv1 = new SsdCategoryPropValues();
						scpv1.setCategorySid(ss.getCategorySid());
						scpv1.setCategoryName(ss.getCategoryName());
						scpv1.setPropsSid(propSid);
						scpv1.setPropsName(propsName);
						scpv1.setValuesName(scvd.getValuesName());
						scpv1.setValuesSid(scvd.getValuesSid());
						scpv1.setChannelSid(Long.valueOf(channelSid));
						scpv1.setOptDate(new Date());
						if (scvd.getStatus().equals(Long.valueOf(1)) && "1".equals(status)) {
							flag = this.ssdCategoryPropValuesService.saveorupdate(scpv1);
						} else {
							flag = this.ssdCategoryPropValuesService.deleteorupdate(scpv1);
						}
					}
				}
			}
		}
		if (!(delete1 == null || "".equals(delete1))) {
			System.out.println("SSD delete before:"+delete1);
			//String name = new String(delete1.getBytes("iso8859-1"),"utf-8");
			String name = delete1;
			System.out.println("SSD delete after:"+name);
			List<SsdCategoryValuesDict> listDelete = JSON.parseArray(name, SsdCategoryValuesDict.class);
			for (SsdCategoryValuesDict scvd : listDelete) {
				scvd.setStatus(0L);
				flag = this.ssdCategoryValuesDictService.update(scvd);

				flag = this.ssdCategoryPropValuesService.deleteByValueAndChan(scvd.getValuesSid(), Long.valueOf(channelSid));
			}
		}
		String result = "";
		if (flag >= 1) {
			result = JSONObject.fromObject("{success:true}").toString();
		} else {
			result = JSONObject.fromObject("{success:false}").toString();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/propsdict/edit", method = {RequestMethod.POST,RequestMethod.GET})
	public String edit(Model m, HttpServletRequest request,
			HttpServletResponse response,String id) {
		
		SsdCategoryPropsDict scpd = this.ssdCategoryPropsDictService.get(Long.valueOf(id));
		JSONObject json = new JSONObject();
		json.put("propsName", scpd.getPropsName());
		json.put("propsDesc", scpd.getPropsDesc());
		json.put("propsCode", scpd.getPropsCode());
		json.put("status", scpd.getStatus());
		json.put("channelSid", scpd.getChannelSid());
		String data = json.toString();
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/propsdict/del", method = RequestMethod.POST)
	public String del(Model m, HttpServletRequest request,
			HttpServletResponse response,String id) {
		SsdCategoryPropsDict scpd = this.ssdCategoryPropsDictService.get(Long.valueOf(id));
		scpd.setStatus(0L);
		Long propsSid = scpd.getPropsSid();
		int flag = this.ssdCategoryPropsDictService.update(scpd);
		String channelSid = LoadProperties.readValue("channel.WEB");
		this.ssdCategoryPropValuesService.deleteByPropAndChan(propsSid, Long.valueOf(channelSid));
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
	@RequestMapping(value = "/propscombox/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String comboxlist(Model model,HttpServletRequest request,HttpServletResponse response,String id){
		
		SsdCategory sc = this.categoryService.get(Long.valueOf(id));
		SsdCategoryPropsDict scp = new SsdCategoryPropsDict();
		scp.setChannelSid(sc.getChannelSid());
		scp.setStatus(1L);
		List<SsdCategoryPropsDict> lists = this.ssdCategoryPropsDictService.selectList(scp);
		JSONArray jsons = new JSONArray();
		for (SsdCategoryPropsDict scpd : lists) {
			JSONObject json = JSONObject.fromObject(scpd);
			jsons.add(json);
		}
        String result = jsons.toString();
        return result;
	}
	
}

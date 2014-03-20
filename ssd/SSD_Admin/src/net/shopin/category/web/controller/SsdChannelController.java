package net.shopin.category.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.category.domain.entity.SsdCategory;
import net.shopin.category.domain.entity.SsdChannel;
import net.shopin.service.ISsdCategoryService;
import net.shopin.service.ISsdChannelService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.shopin.core.framework.base.vo.AjaxMessageVO;

@Controller
public class SsdChannelController {

	@Autowired
	private ISsdChannelService channelService;
	
	@Autowired
	private ISsdCategoryService categoryService;
	
	@RequestMapping(value = "/channel/init", method = RequestMethod.GET)
	public String init(Model m, HttpServletRequest request,
			HttpServletResponse response){
		return "/category/channel_view";
	}
	
	@ResponseBody
	@RequestMapping(value = "/channel/list", method = RequestMethod.POST)
	public String channelList(Model m, HttpServletRequest request,
			HttpServletResponse response,String page,String rows,String channelName) {
		
		SsdChannel record= new SsdChannel();
		if(channelName==null||"".equals(channelName)){
			record.setChannelName(null);
		}else{
			record.setChannelName(channelName);
		}
		if(page==null||"".equals(page)){
			page="1";
		}
		if(rows==null||"".equals(rows)){
			rows="10";
		}
		record.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
		record.setPageSize(Integer.valueOf(rows));
		int total = this.channelService.selectPageTotal(record);
		
		List<SsdChannel> lists = this.channelService.selectPage(record);
		Map<String, Object> jsonMap = new HashMap<String, Object>();  
        jsonMap.put("total", total);
        jsonMap.put("rows", lists);
        Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        return gson.toJson(jsonMap);
	}
	

	@ResponseBody
	@RequestMapping(value = "/channel/save", method = RequestMethod.POST)
	public String save(Model m, HttpServletRequest request,
			HttpServletResponse response,String channelName,String status,String sid) {
		int flag;
		if(sid==null||"".equals(sid)){
			SsdChannel record=new SsdChannel();
			record.setChannelName(channelName);
			record.setStatus(Long.valueOf(status));
			record.setOptDate(new Date());
			flag=this.channelService.insert(record);
			SsdCategory sc = new SsdCategory();
			sc.setName(record.getChannelName()+"分类");
			sc.setChannelSid(record.getSid());
			sc.setIsParent(0L);
			sc.setLevel(0L);
			sc.setParentSid(1L);
			sc.setStatus(0L);
			sc.setRootSid(0L);
			sc.setCategorySid(1L);
			sc.setSortOrder(0L);
			sc.setCreateTime(new Date());
			flag = this.categoryService.insert(sc);
		}else{
			SsdChannel record=new SsdChannel();
			record.setSid(Long.valueOf(sid));
			record.setChannelName(channelName);
			record.setStatus(Long.valueOf(status));
			record.setOptDate(new Date());
			flag=this.channelService.update(record);
		}
		
		AjaxMessageVO result=new AjaxMessageVO();
		if (flag == 1) {
			result.setStatus("success");
			result.setMessage("操作成功");
		} else {
			result.setStatus("failure");
			result.setMessage("操作失败");
		}
		Gson gson=new Gson();
		return gson.toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/channel/initupdate", method = {RequestMethod.POST,RequestMethod.GET})
	public String initupdate(Model m, HttpServletRequest request,
			HttpServletResponse response,String sid) {
		SsdChannel  record=this.channelService.get(Long.valueOf(sid));
		Gson gson=new Gson();
		return gson.toJson(record);
	}
	
	

	@ResponseBody
	@RequestMapping(value = "/channel/del", method = RequestMethod.POST)
	public String del(Model m, HttpServletRequest request,
			HttpServletResponse response,String sid) {
		SsdChannel record=new SsdChannel();
		record.setSid(Long.valueOf(sid));
		record.setStatus(Long.valueOf(0));
		record.setOptDate(new Date());
		int flag = this.channelService.update(record);
		AjaxMessageVO result=new AjaxMessageVO();
		if (flag == 1) {
			result.setStatus("success");
			result.setMessage("删除成功");
		} else {
			result.setStatus("failure");
			result.setMessage("删除失败");
		}
		Gson gson=new Gson();
		return gson.toJson(result);
	}
	
}

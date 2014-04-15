package net.shopin.wms.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.wms.domain.entity.LimitResource;
import net.shopin.wms.domain.entity.NavSort;
import net.shopin.wms.domain.entity.NavSortItem;
import net.shopin.wms.service.INavSortService;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/navSort")
public class NavSortController {
	@Autowired
	INavSortService navSortService;

	//加载对应于shopChannelsSid的所有模板
	@ResponseBody
	@RequestMapping(value = "/queryModuleNames", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String queryModuleNames(Integer shopChannelsSid,HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("data", this.navSortService.queryList(shopChannelsSid));
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String json = gson.toJson(resultMap);
		return json;
	}
	
//	暂时没用到
//	@ResponseBody
//	@RequestMapping(value = "/selectNavSortBySid", method = { RequestMethod.GET,
//			RequestMethod.POST })
//	public String selectNavSortBySid(Integer navSortSid,HttpServletRequest request, HttpServletResponse response){
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("data", this.navSortService.selectByPrimaryKey(navSortSid));
//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//		String json = gson.toJson(resultMap);
//		return json;
//	}
	
	//添加NavSort资源
	@ResponseBody
	@RequestMapping(value = "/addSort", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String insertToNavSort(String shopChannelsSid,String moduleName ,HttpServletRequest request, HttpServletResponse response){
		String json = null;
		try {
			NavSort navSort = new NavSort();
			navSort.setShopChannelsSid(Integer.parseInt(shopChannelsSid));
			navSort.setModuleName(moduleName);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			navSort.setCreateTime(sdf.format(new Date()));
			navSort.setCreateUser(request.getSession().getAttribute("username").toString());
			navSort.setIsEnable(0);
			int result = navSortService.insert(navSort);
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}
	//修改NavSort资源
	@ResponseBody
	@RequestMapping(value = "/updateSort", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String updateNavSort(HttpServletRequest request, HttpServletResponse response){
		String json = null;
		try {
			NavSort navSort = new NavSort();
			navSort.setShopChannelsSid(Integer.parseInt(request.getParameter("shopChannelsSid")));
			navSort.setSid(Integer.parseInt(request.getParameter("sid")));
			navSort.setModuleName(request.getParameter("sortName"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			navSort.setUpdateTime(sdf.format(new Date()));
			navSort.setUpdateUser(request.getSession().getAttribute("username").toString());
			int result = navSortService.updateByPrimaryKeySelective(navSort);
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}
	
	//启用模板
	@ResponseBody
	@RequestMapping(value = "/enableSort", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String enableSort(Integer sid,String shopChannelsSid,HttpServletRequest request, HttpServletResponse response){
		String json = null;
		try {
			NavSort navSort = new NavSort();
			navSort.setSid(sid);
			navSort.setShopChannelsSid(Integer.parseInt(shopChannelsSid));
			
//			启用是否需要更新updateUser？？？？
//			navSort.setUpdateUser(request.getSession().getAttribute("username").toString());
//			SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			navSort.setUpdateTime(sdf.format(new Date()));
//			navSortService.updateByPrimaryKeySelective(navSort);
			
			
			int result = navSortService.enableSort(navSort);
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}
	
}

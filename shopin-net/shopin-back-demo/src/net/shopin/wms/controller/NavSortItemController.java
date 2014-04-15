package net.shopin.wms.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.wms.domain.entity.Channel;
import net.shopin.wms.domain.entity.LimitRole;
import net.shopin.wms.domain.entity.NavSort;
import net.shopin.wms.domain.entity.NavSortItem;
import net.shopin.wms.service.IChannelService;
import net.shopin.wms.service.INavSortItemService;
import net.shopin.wms.service.INavSortService;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/navSortItem")
public class NavSortItemController {
	@Autowired
	INavSortItemService navSortItemService;
	@Autowired
	INavSortService navSortService;
	@Autowired
	IChannelService channelService;
	
	//获取相对于NavSortSid下的所有资源
	@ResponseBody
	@RequestMapping(value = "/getAllNavSortItem", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getAllNavSortItem(String sortSid,HttpServletRequest request, HttpServletResponse response){
		Integer parentId = Integer.parseInt(request.getParameter("node"));
		Integer navSortSid = Integer.parseInt(sortSid);
		JSONObject obj = new JSONObject();
		JSONArray jsonarry = new JSONArray();
		List<NavSortItem>result = new ArrayList();
		try {
			//得到所有资源
			if(parentId==navSortSid){
				result = navSortItemService.queryList(navSortSid);
			}else{
				NavSortItem item = new NavSortItem();
				item.setParentId(parentId);
				item.setNavSortSid(navSortSid);
				result = navSortItemService.queryItemList(item);
			}
				
			
			//将根节点list转换为树所需要的,优先添加推荐。
			for(NavSortItem r : result){
				obj.put("id", r.getSid());
				obj.put("className", r.getClassName());
				obj.put("url",r.getUrl());
				obj.put("orderBy",r.getOrderBy());
				obj.put("isTop",r.getIsTop());
				if(r.getParentId()!=null){
					obj.put("leaf",true );
					obj.put("parentId",r.getParentId());
				}else{
					obj.put("leaf",false );
					obj.put("parentId","");
				}
				if(r.getIsTop()==1){
					obj.put("text","<font color=red>"+r.getClassName()+"</font>");
					jsonarry.add(obj);
				}
			}
			//添加非推荐
			for(NavSortItem r : result){
				obj.put("id", r.getSid());
				obj.put("className", r.getClassName());
				obj.put("url",r.getUrl());
				obj.put("orderBy",r.getOrderBy());
				obj.put("isTop",r.getIsTop());
				if(r.getParentId()!=null){
					obj.put("leaf",true );
				}else{
					obj.put("leaf",false );
				}
				if(r.getIsTop()!=1){
					obj.put("text", r.getClassName());
					jsonarry.add(obj);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jsonarry.toString();
	}
	
	//增加一条NavSortItem 记录
	@ResponseBody
	@RequestMapping(value = "/insertItem", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertItem(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		NavSortItem item = toItem(request);
		if(item.getSid()==item.getNavSortSid()){
			item.setParentId(null);
		}else{
			item.setParentId(item.getSid());
		}
		item.setSid(null);
		try {
			NavSort sort = new NavSort();
			sort.setSid(item.getNavSortSid());
			sort.setUpdateUser(request.getSession().getAttribute("username").toString());
			SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			sort.setUpdateTime(sdf.format(new Date()));
			navSortService.updateByPrimaryKeySelective(sort);
			Integer result = navSortItemService.insertSelective(item);
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	
	//修改一条NavSortItem记录
	@ResponseBody
	@RequestMapping(value = "/updateItem", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateItem(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		Integer result = null;
		try {
			NavSortItem item = toItem(request);
			//item.setSid(Integer.parseInt(request.getParameter("sid")));
//			if(item.getNavSortSid()==item.getSid()){
//				NavSort sort = new NavSort();
//				sort.setSid(item.getNavSortSid());
//				sort.setModuleName(item.getClassName());
//				sort.setUpdateUser(request.getSession().getAttribute("username").toString());
//				SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
//				sort.setUpdateTime(sdf.format(new Date()));
//				result = navSortService.updateByPrimaryKeySelective(sort);
//			}else{
				NavSort sort = new NavSort();
				sort.setSid(item.getNavSortSid());
				sort.setUpdateUser(request.getSession().getAttribute("username").toString());
				SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				sort.setUpdateTime(sdf.format(new Date()));
				navSortService.updateByPrimaryKeySelective(sort);
				result = navSortItemService.updateByPrimaryKeySelective(item);
//			}
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	
public NavSortItem toItem(HttpServletRequest request){
		Integer sid = Integer.parseInt(request.getParameter("sid"));
		Integer navSortSid = Integer.parseInt(request.getParameter("navSortSid"));
		String className = request.getParameter("className");
		String url = request.getParameter("url");
		String orderBy = request.getParameter("orderBy");
		String isTop = request.getParameter("isTop");
		String parentId = request.getParameter("parentId");
		
		NavSortItem item = new NavSortItem();
		if(sid!=null){
			item.setSid(sid);
		}
		item.setNavSortSid(navSortSid);
		item.setClassName(className);
		
		if(url != null && url.length()>0){
			item.setUrl(url);
		}
		if(orderBy != null && orderBy.length() >0){
			item.setOrderBy(Integer.parseInt(orderBy));
		}
		if(isTop != null && isTop.length()>0){
			item.setIsTop(Integer.parseInt(isTop));
		}else{
			item.setIsTop(0);
		}
		if(parentId != null && parentId.length()>0&&Integer.parseInt(parentId)!=navSortSid){
			item.setParentId(Integer.parseInt(parentId));
		}
		
		return item;
	}

}

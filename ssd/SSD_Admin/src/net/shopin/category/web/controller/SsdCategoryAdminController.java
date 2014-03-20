package net.shopin.category.web.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.category.domain.entity.SsdCategory;
import net.shopin.category.domain.entity.SsdProductCategory;
import net.shopin.category.domain.vo.JsonCate;
import net.shopin.service.ISsdCategoryService;
import net.shopin.service.ISsdProductCategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.shopin.core.framework.base.vo.AjaxMessageVO;
import com.shopin.core.util.LoadProperties;

/**
 * 维护品类信息的控制器
 * @author xuxf 
 */
@Controller
public class SsdCategoryAdminController {

	@Autowired
	private ISsdCategoryService categoryService;
	
	@Autowired
	private ISsdProductCategoryService productCategoryService;
	
	/**
	 * 控制品类维护界面的加载
	 * @param m
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/category/init", method = RequestMethod.GET)
	public String init(Model m, HttpServletRequest request,
			HttpServletResponse response){
		return "/category/category_view";
	}
	
	/**
	 * 控制品类信息的展示
	 * @param m
	 * @param request
	 * @param response
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/category/list", method = RequestMethod.POST)
	public String catList(Model m, HttpServletRequest request,
			HttpServletResponse response,String id) {
		JSONArray jsons = new JSONArray();
		List<SsdCategory> list = null;
		if (id == null || "".equals(id)) {
			String channelSid = LoadProperties.readValue("channel.WEB");
			list = this.categoryService.getByParentSidAndChannelSid(0L,Long.valueOf(channelSid));
		} else {
			SsdCategory s = this.categoryService.get(Long.valueOf(id));
			list = this.categoryService.getByParentSidAndChannelSid(s.getCategorySid(), s.getChannelSid());
		}
		for (SsdCategory cat : list) {
			JSONObject json = new JSONObject();
			json.put("id", cat.getSid());
			json.put("text", cat.getName());
			if (cat.getIsParent() == 1) {
				json.put("state", "closed");
			} else {
				json.put("state", "open");
			}
			jsons.add(json);
		}
		return jsons.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/category/liste", method = RequestMethod.POST)
	public String procatList(Model m, HttpServletRequest request,
			HttpServletResponse response,String productSid,String id) {
		SsdProductCategory spc = new SsdProductCategory();
		spc.setProductSid(Long.valueOf(productSid));
		String channelSid = LoadProperties.readValue("channel.WEB");
		List<SsdProductCategory> spcs = this.productCategoryService.selectList(spc);
		if (spcs.size() > 0 && (id == null || "".equals(id))) {
			Map<Long, JsonCate> arr = this.categoryService.getCateJSON(Long.valueOf(productSid));
			JsonCate jc = arr.get(Long.valueOf(channelSid));
			return JSONArray.fromObject(jc).toString();
		} else {
			JSONArray jsons = new JSONArray();
			List<SsdCategory> list = null;
			if (id == null || "".equals(id)) {
				list = this.categoryService.getByParentSidAndChannelSid(0L, Long.valueOf(channelSid));
			} else {
				SsdCategory s = this.categoryService.get(Long.valueOf(id));
				list = this.categoryService.getByParentSidAndChannelSid(s.getCategorySid(), Long.valueOf(channelSid));
			}
			for (SsdCategory cat : list) {
				JSONObject json = new JSONObject();
				json.put("id", cat.getSid());
				json.put("text", cat.getName());
				if (cat.getIsParent() == 1) {
					json.put("state", "closed");
				} else {
					json.put("state", "open");
				}
				boolean isHave = false;
				for (SsdProductCategory sp : spcs) {
					if (cat.getSid().equals(sp.getCategorySid())) {
						isHave = true;
						break;
					}
				}
				if (isHave) {
					json.put("checked", true);
				} else {
					json.put("checked", false);
				}
				jsons.add(json);
			}
			return jsons.toString();
		}
	}
	
	/**
	 * 控制品类的添加
	 * @param m
	 * @param request
	 * @param sid 当sid为空时,添加新的品类;当sid不为空时,更新品类信息
	 * @param response
	 * @param id
	 * @param name
	 * @param status
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/category/add", method = RequestMethod.POST)
	public String add(Model m, HttpServletRequest request,String sid,String channelSid,
			HttpServletResponse response,String id,String name,String status,String isDisplay) {
		int flag = 0;
		if (sid == null || "".equals(sid)) {
			SsdCategory s = this.categoryService.get(Long.valueOf(id));
			SsdCategory category = new SsdCategory();
			category.setName(name);
			category.setChannelSid(s.getChannelSid());
			category.setStatus(Long.valueOf(status));
			category.setIsDisplay(Long.valueOf(isDisplay));
			category.setIsSelfBuilt(1L);
			category.setParentSid(s.getCategorySid());
			category.setIsParent(0L);
			Long max = this.categoryService.getMaxSortOrder(s.getCategorySid(),s.getChannelSid());
			category.setSortOrder(max+1);
			SsdCategory parentCate = this.categoryService.getByCategorySidAndChannelSid(s.getCategorySid(), s.getChannelSid());
			Long palevel = parentCate.getLevel();
			category.setLevel(palevel+1);
			if (palevel == 0) {
				category.setRootSid(0L);
			} else if(palevel == 1) {
				category.setRootSid(parentCate.getCategorySid());
			} else {
				category.setRootSid(parentCate.getRootSid());
			}
			category.setCreateTime(new Date());
			flag = this.categoryService.insert(category);
			Long categorySid = category.getSid();
			category.setCategorySid(categorySid);
			if (parentCate.getIsParent() == 0) {
				parentCate.setIsParent(1L);
				flag = this.categoryService.update(parentCate);
			}
			if (palevel == 0) {
				category.setSearchPath(categorySid+"");
			} else {
				String searchPath = parentCate.getSearchPath();
				category.setSearchPath(searchPath+"_"+categorySid);
			}
			flag = this.categoryService.update(category);
		} else {
			SsdCategory category = this.categoryService.get(Long.valueOf(sid));
			category.setName(name);
			category.setStatus(Long.valueOf(status));
			category.setIsDisplay(Long.valueOf(isDisplay));
			Long level = category.getLevel();
			if (level == 1) {
				category.setSearchPath(category.getCategorySid()+"");
			} else {
				SsdCategory parentCate = this.categoryService.getByCategorySidAndChannelSid(category.getParentSid(), category.getChannelSid());
				String searchPath = parentCate.getSearchPath();
				category.setSearchPath(searchPath+"_"+category.getCategorySid());
			}
			flag = this.categoryService.update(category);
		}
		AjaxMessageVO result=new AjaxMessageVO();
		if (flag == 1) {
			result.setStatus("true");
			result.setMessage("操作成功");
		} else {
			result.setStatus("false");
			result.setMessage("操作失败");
		}
		Gson gson=new Gson();
		return gson.toJson(result);
	}
	
	/**
	 * 控制品类的更新时,用于品类的信息加载
	 * @param m
	 * @param request
	 * @param response
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/category/edit", method = {RequestMethod.POST,RequestMethod.GET})
	public String update(Model m, HttpServletRequest request,
			HttpServletResponse response,String id) {
		
		SsdCategory category = this.categoryService.get(Long.valueOf(id));
		JSONObject json = new JSONObject();
		json.put("name", category.getName());
		json.put("status", category.getStatus());
		json.put("isDisplay", category.getIsDisplay());
		String data = json.toString();
		return data;
	}
	
	/**
	 * 控制品类的删除,当品类下有子品类时,该品类不能删除
	 * @param m
	 * @param request
	 * @param response
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/category/del", method = RequestMethod.POST)
	public String del(Model m, HttpServletRequest request,
			HttpServletResponse response,String id) {
		List<SsdCategory> list = this.categoryService.getByParentSid(Long.valueOf(id));
		int flag;
		boolean isHave = false;
		if (list.size() > 0) {
			for (SsdCategory s : list) {
				if (s.getStatus() == 1) {
					isHave = true;
					break;
				}
			}
		}
		if (list.size() == 0 || !isHave) {
			SsdCategory cat = this.categoryService.get(Long.valueOf(id));
			cat.setStatus(0L);
			flag = this.categoryService.update(cat);
		} else if(isHave) {
			flag = -1;
		} else {
			flag = 0;
		}
		
		AjaxMessageVO result=new AjaxMessageVO();
		if (flag == 1) {
			result.setStatus("success");
			result.setMessage("操作成功");
		} else if(flag == -1){
			result.setStatus("failure");
			result.setMessage("操作非法");
		} else {
			result.setStatus("failure");
			result.setMessage("操作失败");
		}
		Gson gson=new Gson();
		return gson.toJson(result);
	}
	
}

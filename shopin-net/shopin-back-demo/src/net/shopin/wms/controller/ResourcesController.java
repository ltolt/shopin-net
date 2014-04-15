/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controllerResourcesController.java
 * @Create By shiying
 * @Create In 2013-7-5 下午4:31:35
 * TODO
 */
package net.shopin.wms.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.wms.domain.entity.Resources;
import net.shopin.wms.domain.entity.RoleResource;
import net.shopin.wms.domain.view.RoleResourceVO;
import net.shopin.wms.service.IResourcesService;
import net.shopin.wms.service.IRoleResourceService;
import net.shopin.wms.util.ResultUtil;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Class Name ResourcesController
 * @Author shiying
 * @Create In 2013-7-5
 */
@Controller
@RequestMapping(value = "/resources")
public class ResourcesController {
	
	@Autowired
	private IResourcesService resourcesService;
	
	@Autowired
	private IRoleResourceService roleResourceService; 
	
	@ResponseBody
	@RequestMapping(value = "/queryResources", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectByPrimaryKey(HttpServletRequest request, HttpServletResponse response,String resourceName){
		String json = "";
		//String sid = request.getParameter("sid");
		Resources record = new Resources();
		List resouces;
		try {
		         if(resourceName!=null&&!"".equals(resourceName)){
			              record.setResourceName(resourceName);
		                  resouces  = this.resourcesService.selectResourceByName(record);
		          } else{
                          resouces = this.resourcesService.selectAllResources();
		                 }
			json = ResultUtil.createSuccessResult(resouces);
			System.out.println(json);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectResources", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectResourceByPrimaryKey(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		String sid = request.getParameter("sid");
		System.out.println("sid="+sid);
	//	List roleResource = new ArrayList();
		try {
		List<RoleResource> roleResource = this.roleResourceService.selectByRoleSid(Long.valueOf(sid));
			
			List list = new ArrayList();
			for(int i=0 ; i < roleResource.size() ; i++){
			   Resources resources = this.resourcesService.selectByPrimaryKey(roleResource.get(i).getResourcesSid());
			   list.add(resources);
			}
			json = ResultUtil.createSuccessResult(list);
		
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/selectOthers", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectOthersByPrimaryKey(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		String sid = request.getParameter("sid");
		System.out.println("sid="+sid);
		List record = null;
		
		
 		try {
 			if(sid != null && !"".equals(sid)){
				List<RoleResource> roleResource = this.roleResourceService.selectByRoleSid(Long.valueOf(sid));
				List<Long> listLong = new ArrayList<Long>();
				if(roleResource !=null && !"".equals(roleResource)){
					for(int i = 0; i < roleResource.size() ; i++){
						Long sids = roleResource.get(i).getResourcesSid();
						listLong.add(sids);
					}
					record = this.resourcesService.selectOthersByPrimaryKey(listLong);
				}else{
					Resources resources = new Resources();
					record = this.resourcesService.selectList(resources);
				}
 			}else{
 				record = this.resourcesService.selectAllResources();
 			}
			json = ResultUtil.createSuccessResult(record);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveResources", method = {RequestMethod.GET, RequestMethod.POST})
	public String saveResources(HttpServletRequest request, HttpServletResponse response,String resourcesName,String url){
		String json = "";
		System.out.println(resourcesName+"---"+url);
		Resources re=new Resources();
		re.setResourceName(resourcesName);
		re.setUrl(url);
		
		try {
			this.resourcesService.insert(re);
			json = "{'success':true}";
			System.out.println(json);
		} catch (Exception e) {
			json = "{'success':false}";
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteResources", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteResources(HttpServletRequest request, HttpServletResponse response,String sid){
		String json = "";
		
		
		try {
			this.resourcesService.deleteByPrimaryKey(Long.valueOf(sid));
			json = "{'success':true}";
			System.out.println(json);
		} catch (Exception e) {
			json = "{'success':false}";
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateResources", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateResources(HttpServletRequest request, HttpServletResponse response,String resourcesName,String url,String sid){
		String json = "";
		System.out.println(resourcesName+"---"+url);
		Resources re=new Resources();
		re.setResourceName(resourcesName);
		re.setUrl(url);
		re.setSid(Long.valueOf(sid));
		
		try {
			this.resourcesService.updateByPrimaryKey(re);
			json = "{'success':true}";
			System.out.println(json);
		} catch (Exception e) {
			json = "{'success':false}";
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value = "/queryResource", method = {RequestMethod.GET, RequestMethod.POST})
	public String queryResources(HttpServletRequest request, HttpServletResponse response,String resourceName){
		String json = "";
		Resources record = new Resources();
		record.setResourceName(resourceName);
		
		try {
			List names = this.resourcesService.selectResourceByName(record);
			json = ResultUtil.createSuccessResult(names);
			System.out.println(json);
		} catch (Exception e) {
			json = ResultUtil.createSuccessResult(e);
		}
		return json;
	}


}

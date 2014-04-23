package net.shopin.wms.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.wms.domain.entity.LimitResource;
import net.shopin.wms.service.ILimitResourcesService;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 资源控制管理
 * @Class Name LimitResourceController
 * @Author Administrator
 * @Create In 2013-8-9
 */
@Controller
@RequestMapping("/limitResource")
public class LimitResourceController {
	
	@Autowired
	private ILimitResourcesService resourcesService;
	/**
	 * 得到所有的根节点资源
	 * @Methods Name getAllResources
	 * @Create In 2013-8-9 By chenqb
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/getAllLimitResources", method = {RequestMethod.GET, RequestMethod.POST})
	public String getAllResources(HttpServletRequest request, HttpServletResponse response){
		String parentSid = request.getParameter("node");
		JSONObject obj = new JSONObject();
		JSONArray jsonarry = new JSONArray();
		List<LimitResource> result = new ArrayList();
		try {
			//得到所有资源
			if(!"0".equals(parentSid) && parentSid != null){
				LimitResource resource = new LimitResource();
				resource.setParentSid(Long.valueOf(parentSid));
				result = resourcesService.getByParam(resource);
			}else{
				List<LimitResource> list1 = resourcesService.getAll();
				
				//遍历得到所有跟节点
				for(int i = 0;i<list1.size();i++){
					LimitResource r = new LimitResource();
					r = list1.get(i);
					if(r.getParentSid()==null ||r.getParentSid()==0){
						result.add(r);
					}
				}
			}
			
			//将跟节点list转换为树所需要的。
			for(LimitResource r : result){
				obj.put("id", r.getSid());
				obj.put("text", r.getRsName());
				//obj.put("icons", "");
				obj.put("linkBrand", null);
				obj.put("leaf", r.getIsLeaf());
				jsonarry.add(obj);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonarry.toString();
	}
	/**
	 * 根据条件进行查找资源
	 * @Methods Name getLimitResourceByParam
	 * @Create In 2013-8-9 By chenqb
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/getLimitResourceByParam", method = {RequestMethod.GET, RequestMethod.POST})
	public String getLimitResourceByParam(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		LimitResource limitResource = toResource(request);
		try {
			List result = resourcesService.getByParam(limitResource);
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	/**
	 * 保存资源
	 * @Methods Name saveLimitResources
	 * @Create In 2013-8-9 By chenqb
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/saveLimitResources", method = {RequestMethod.GET, RequestMethod.POST})
	public String saveLimitResources(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		LimitResource limitResource = toResource(request);
		limitResource.setCreateTime(new Date());
		try {
			String result = resourcesService.saveLimitResource(limitResource).toString();
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	/**
	 * 修改资源
	 * @Methods Name updateLimitResources
	 * @Create In 2013-8-9 By chenqb
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/updateLimitResources", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateLimitResources(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		LimitResource limitResource = toResource(request);
		limitResource.setUpdateTime(new Date());
		try {
			String result = resourcesService.updateLimitResource(limitResource).toString();
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	/**
	 * 删除资源
	 * @Methods Name deleteLimitResources
	 * @Create In 2013-8-9 By chenqb
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteLimitResources", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteLimitResources(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		LimitResource limitResource = toResource(request);
	
		try {
				String result = resourcesService.deleteLimitResource(limitResource).toString();
				json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	/**
	 * 禁用资源
	 * @Methods Name proLmitResources
	 * @Create In 2013-8-10 By chenqb
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/proLmitResources", method = {RequestMethod.GET, RequestMethod.POST})
	public String proLmitResources(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		LimitResource limitResource = toResource(request);
		limitResource.setDelFlag(1);
		try {
			String result = resourcesService.updateLimitResource(limitResource).toString();
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	/**
	 * 有请求参数转换为对象
	 * @Methods Name toResource
	 * @Create In 2013-8-9 By Administrator
	 * @param request
	 * @return LimitResource
	 */
	public LimitResource toResource(HttpServletRequest request){
		
		String sid = request.getParameter("sid");
		String rsName = request.getParameter("rsName");
		String rsCode = request.getParameter("rsCode");
		String delFlag = request.getParameter("delFlag");
		String parentSid = request.getParameter("parentSid");
		String isLeaf = request.getParameter("isLeaf");
		
		LimitResource resource = new LimitResource();
		
		if(sid != null && sid.length()>0){
			resource.setSid(Long.valueOf(sid));
		}
		if(rsName != null && rsName.length()>0){
			resource.setRsName(rsName);
		}
		if(rsCode != null && rsCode.length()>0){
			resource.setRsCode(rsCode);
		}
		if(delFlag != null && delFlag.length()>0){
			resource.setDelFlag(Integer.valueOf(delFlag));
		}
		if(parentSid != null && parentSid.length()>0){
			resource.setParentSid(Long.valueOf(parentSid));
		}
		if(isLeaf != null && isLeaf.length()>0){
			resource.setIsLeaf(Integer.valueOf(isLeaf));
		}
		return resource;
	}

}

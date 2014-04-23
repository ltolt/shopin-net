package net.shopin.wms.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.wms.domain.entity.LimitResource;
import net.shopin.wms.domain.entity.LimitRoleResources;
import net.shopin.wms.service.ILimitResourcesService;
import net.shopin.wms.service.ILimitRoleResourceService;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/limitRoleResource")
public class LimitRoleResourceController {
	
	@Autowired
	private ILimitResourcesService resourcesService;
	
	@Autowired
	private ILimitRoleResourceService rolersService;
	/**
	 * 得到所有的根节点资源
	 * @Methods Name getAllResources
	 * @Create In 2013-8-9 By chenqb
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/getLimitResources", method = {RequestMethod.GET, RequestMethod.POST})
	public String getAllResources(HttpServletRequest request, HttpServletResponse response){
		String parentSid = request.getParameter("node");
		//得到角色的id
		String orleSid = request.getParameter("orleSid");
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
					if(r.getParentSid()==null || r.getParentSid()==0){
						result.add(r);
					}
				}
			}
			//在此result 中的资源是树中所需要的资源我们在这根据角色用户表中的对应关系来进行操作
			//1根据角色id来从角色资源映射表中提取资源id
			List<LimitRoleResources> roleResources = new ArrayList();
			LimitRoleResources limitroleresource = new LimitRoleResources();
			limitroleresource.setRoleSid(Long.valueOf(orleSid));
			roleResources = rolersService.getByParam(limitroleresource);
			//2遍历角色资源映射
			for(LimitRoleResources rore: roleResources){
				Long id = rore.getRsSid();
				for(LimitResource r:result){
					//3把角色资源映射表中存在的资源的checked置为true 否则为false
					if(id.equals(r.getSid())){
						r.setChecked(true);
					}
				}
			}
			
			//将跟节点list转换为树所需要的。
			for(LimitResource r : result){
				obj.put("id", r.getSid());
				obj.put("text", r.getRsName());
				obj.put("checked", r.isChecked());
				obj.put("expanded", true);
				obj.put("leaf", false);
				jsonarry.add(obj);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonarry.toString();
	}
	/**
	 * 保存权限
	 * @Methods Name savaRoleResource
	 * @Create In 2013-8-10 By chenqb
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/savaLimitRoleResource", method = {RequestMethod.GET, RequestMethod.POST})
	public String savaRoleResource(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		String roleSid = request.getParameter("orleSid");
		String resourceSids = request.getParameter("resourceSid");
		String result = "";
		try {

			//1清空数据库中的与角色相关的资源权限
			LimitRoleResources roleResource = new LimitRoleResources();
			roleResource.setRoleSid(Long.valueOf(roleSid));
			result = rolersService.deleteRoleResources(roleResource).toString();
			//2将ResourceSids进行处理遍历。
			String []rsSids = resourceSids.trim().split(",");
			for(String s : rsSids){
				
				if(!s.equals("0")){
					roleResource.setRsSid(Long.valueOf(s));
					//3保存角色的权限
					result = rolersService.saveRoleResources(roleResource).toString();
				}
			}
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
}

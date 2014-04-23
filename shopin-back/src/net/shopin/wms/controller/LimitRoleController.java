package net.shopin.wms.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.wms.domain.entity.LimitRole;
import net.shopin.wms.service.ILimitRoleService;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 角色控制管理
 * @Class Name LimitRoleController
 * @Author chenqb
 * @Create In 2013-8-9
 */
@Controller
@RequestMapping("/LimitRole")
public class LimitRoleController {
	
	@Autowired
	private ILimitRoleService limitRoleService;
	
	/**
	 * 得到所有角色
	 * @Methods Name getAllRole
	 * @Create In 2013-8-9 By chenqb
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/getAllLimitRole", method = {RequestMethod.GET, RequestMethod.POST})
	public String getAllRole(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		String name = request.getParameter("name");
		try {
			List result;
			if(name !=null && name.length()>0){
				LimitRole role = new LimitRole();
				role.setRoleName(name);
				result = limitRoleService.getByParam(role);
				json = ResultUtil.createSuccessResult(result);
			}else{
				result = limitRoleService.getAll();
				json = ResultUtil.createSuccessResult(result);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	@ResponseBody
	@RequestMapping(value = "/getLimitRoleByParam", method = {RequestMethod.GET, RequestMethod.POST})
	public String getRoleByParam(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		LimitRole limitRole = toRole(request);
		
		try {
			List result = limitRoleService.getByParam(limitRole);
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	/**
	 * 保存角色
	 * @Methods Name saveRole
	 * @Create In 2013-8-9 By chenqb
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/saveLimitRole", method = {RequestMethod.GET, RequestMethod.POST})
	public String saveRole(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		LimitRole limitRole = toRole(request);
		limitRole.setDelFlag(0);
		limitRole.setCreatedTime(new Date());
		try {
			String result = limitRoleService.saveLimitRole(limitRole).toString();
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	/**
	 * 修改角色
	 * @Methods Name updateRole
	 * @Create In 2013-8-9 By chenqb
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/updateLimitRole", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateRole(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		LimitRole limitRole = toRole(request);
		limitRole.setUpdateTime(new Date());
		try {
			String result = limitRoleService.updateLimitRole(limitRole).toString();
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteRole", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteRole(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		LimitRole limitRole = toRole(request);
		limitRole.setUpdateTime(new Date());
		limitRole.setDelFlag(1);
		try {
			String result = limitRoleService.updateLimitRole(limitRole).toString();
			json = ResultUtil.createSuccessResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json = ResultUtil.createFailureResult(e);
		}
		
		return json;
	}
	
	public LimitRole toRole(HttpServletRequest request){
		
		String sid = request.getParameter("sid");
		String roleName = request.getParameter("roleName");
		String roleCode = request.getParameter("roleCode");
		String delFlag = request.getParameter("delFlag");
		
		LimitRole limitRole = new LimitRole();
		
		if(sid != null && sid.length()>0){
			limitRole.setSid(Long.valueOf(sid));
		}
		if(roleName != null && roleName.length()>0){
			limitRole.setRoleName(roleName);
		}
		if(roleCode != null && roleCode.length() >0){
			limitRole.setRoleCode(roleCode);
		}
		if(delFlag != null && delFlag.length()>0){
			limitRole.setDelFlag(Integer.valueOf(delFlag));
		}
		
		return limitRole;
	}
	
}

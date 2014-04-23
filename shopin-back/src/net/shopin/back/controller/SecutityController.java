/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.controllerSecutityController.java
 * @Create By kongm
 * @Create In 2013-5-10 下午4:17:58
 * TODO
 */
package net.shopin.back.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.back.view.LdapUser;
import net.shopin.ldap.ws.client.Role;
import net.shopin.ldap.ws.client.SystemWSImpl;
import net.shopin.ldap.ws.client.SystemWSImplService;
import net.shopin.ldap.ws.client.User;
import net.shopin.order.utils.HttpUtil;
import net.shopin.wms.domain.entity.LimitResource;
import net.shopin.wms.domain.entity.LimitRole;
import net.shopin.wms.domain.entity.LimitRoleResources;
import net.shopin.wms.service.ILimitResourcesService;
import net.shopin.wms.service.ILimitRoleResourceService;
import net.shopin.wms.service.ILimitRoleService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.SystemConfig;
import com.framework.AbstractController;
import com.framework.returnObj.Infos;
import com.utils.JsonUtil;

/**
 * @Class Name SecutityController
 * @Author kongm
 * @Create In 2013-5-10
 */
@Controller
@RequestMapping(value = "/security")
public class SecutityController extends AbstractController {

	protected final Log logger = LogFactory.getLog(SecutityController.class);

	@Autowired
	private ILimitRoleService limitRoleService;

	@Autowired
	private ILimitResourcesService resourcesService;

	@Autowired
	private ILimitRoleResourceService rolersourceService;

	@RequestMapping(value = { "/login" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String login(Model m, HttpServletRequest request,
			HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String resources = null;

		Infos infos = init(request, "uesrname = " + username + ",password = "
				+ password);
		Assert.notNull(SystemConfig.WSCLIENT_URL, "ldap url can not be null");
		SystemWSImpl port = SystemWSImplService
				.getPort(SystemConfig.WSCLIENT_URL);
		User u = port.getUserDetailByUid(username);
		StringBuffer stringBuffer = new StringBuffer();
		if (u != null) {
			logger.info(u.getPassword());
			if (!u.getPassword().equals(password)) {
				request.getSession().setAttribute("error", "密码不正确,请联系信息-运维");
				return "forward:/login.jsp";
			}
			String uid = u.getUid();
			List roleList = port.findRolesByUserId(username);

			for (Iterator iter = roleList.iterator(); iter.hasNext();) {
				Role r = (Role) iter.next();
				System.out.println(r.getCn() + "-" + r.getDisplayName() + "-"
						+ r.getDn() + "sssss" + r.getRoleOccupant()+"ssss"+r.getRoleOccupant());
				
				if (SystemConfig.SYSTEM_ROLE.equals(r.getCn())
						|| SystemConfig.SUPER_ADMIN.equals(r.getCn())
						|| SystemConfig.ROLE_WMS_ADMIN.equals(r.getCn())) {
					
					// LdapUser user = new LdapUser();
					// user.setUsername(username);
					// user.setPassword(password);
					Map paramMap = new LinkedHashMap();
					paramMap.put("username", username);
					paramMap.put("password", password);
					paramMap.put("methodCall", "validateuser");
					List<String> systemList = new ArrayList<String>();
					systemList.add(0,"SYSTEM_OMS_BACK");
					systemList.add(1,"SYSTEM_WMS");
					String stringRole = HttpUtil.HttpPost(
							SystemConfig.UAC_URL, "validate", paramMap);

					JSONArray ary = new JSONArray();
					JSONObject json = JSONObject.fromObject(stringRole);
					JSONArray joa = json.getJSONObject("result").getJSONArray(
					"accessSystems");
					
					for(String s:systemList){
						if(joa.size()>0){
							for (int i = 0; i < joa.size(); i++) {
								JSONObject obj = joa.getJSONObject(i);
								if (obj.getString("systenName").equals(
										s)) {
									ary = obj.getJSONArray("roleName");
								}
							}
						}
						
						if (ary.size() > 0) {
							System.out.println(ary);
							for (int i = 0; i < ary.size(); i++) {
								String roleCode = ary.getString(i);
								try {
									// 通过角色名称得到角色id (在此 r的displayName是否与
									// role中的roleName一致)
									// System.out.println(r.getDisplayName()+"displayName");
									LimitRole limitRole = new LimitRole();
									// limitRole.setRoleName(r.getDisplayName().split("shopin-back")[1]);
									System.out.println(r.getCn());
									limitRole.setRoleCode(roleCode);
									List<LimitRole> limitRoles = limitRoleService
											.getByParam(limitRole);
									// 通过角色id找到相关权限。
							//		System.out.println(limitRoles.get(0).getSid()
							//				+ "limitRoles");
									LimitRoleResources limitRoleResource = new LimitRoleResources();
									if (limitRoles.size() > 0) {
										limitRoleResource.setRoleSid(limitRoles
												.get(0).getSid());
										List<LimitRoleResources> limitRoleResources = rolersourceService
												.getByParam(limitRoleResource);
										// 通过角色权限关系得到资源名称
										if (limitRoleResources.size() > 0) {
											for (LimitRoleResources rr : limitRoleResources) {
												LimitResource limitResource = new LimitResource();
												limitResource.setSid(rr.getRsSid());
												List<LimitResource> limitResources = resourcesService
														.getByParam(limitResource);
												stringBuffer.append(limitResources
														.get(0).getRsCode()
														+ ",");
											}
										}
//										int j = stringBuffer.lastIndexOf(",");
//										stringBuffer.deleteCharAt(j);
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						}
						if(stringBuffer.length()>0){
							break;
						}
					}
					
						
						

					System.out.println(stringBuffer.toString());

					resources = stringBuffer.toString();
					
					request.getSession().setAttribute("username", username);
					request.getSession().setAttribute("password", password);
					request.getSession().setAttribute("resources", resources);
					return "redirect:/index.jsp";
				}
			}
			request.getSession().setAttribute("error", "权限不够");
			return "forward:/login.jsp";

		}
		request.getSession().setAttribute("error", "用户名不正确");
		return "forward:/login.jsp";
	}

}

package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.LimitRole;
/**
 * 角色信息接口
 * @Class Name ILimitRoleService
 * @Author chenqb
 * @Create In 2013-8-9
 */
public interface ILimitRoleService {
	
	public List getAll()throws Exception;
	
	public List getByParam(LimitRole role)throws Exception;
	
	public Integer saveLimitRole(LimitRole role)throws Exception;
	
	public Integer updateLimitRole(LimitRole role)throws Exception;
	
	public Integer deleteLimitRole(LimitRole role)throws Exception;
}

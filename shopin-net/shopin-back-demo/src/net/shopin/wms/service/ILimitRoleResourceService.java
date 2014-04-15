package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.LimitRoleResources;
/**
 * 角色资源关系接口
 * @Class Name ILimitRoleResourceService
 * @Author chenqb
 * @Create In 2013-8-9
 */
public interface ILimitRoleResourceService {
	
	public List<LimitRoleResources> getAll()throws Exception;
	
	public List<LimitRoleResources> getByParam(LimitRoleResources roleresource)throws Exception;
	
	public Integer saveRoleResources(LimitRoleResources roleresources)throws Exception;
	
	public Integer updateRoleResources(LimitRoleResources roleresources)throws Exception;
	
	public Integer deleteRoleResources(LimitRoleResources roleresources)throws Exception;
}

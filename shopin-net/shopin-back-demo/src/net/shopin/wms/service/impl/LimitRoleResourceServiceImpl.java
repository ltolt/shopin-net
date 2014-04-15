package net.shopin.wms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.wms.domain.entity.LimitRoleResources;
import net.shopin.wms.persistence.LimitRoleResourcesMapper;
import net.shopin.wms.persistence.RolesMapper;
import net.shopin.wms.service.ILimitRoleResourceService;

/**
 * 角色资源关系表接口实现
 * @Class Name LimitRoleResourceServiceImpl
 * @Author chenqb
 * @Create In 2013-8-9
 */
@Component("limitRoleResourceService")
@Scope("prototype")
@Transactional
public class LimitRoleResourceServiceImpl implements ILimitRoleResourceService{
	
	
	@Autowired
	private LimitRoleResourcesMapper roleResourcesMapper ;
	
	@Override
	public Integer deleteRoleResources(LimitRoleResources roleresources) {
		// TODO Auto-generated method stub
		return roleResourcesMapper.delete(roleresources);
	}

	@Override
	public List<LimitRoleResources> getAll() {
		// TODO Auto-generated method stub
		return roleResourcesMapper.getAllLimitRoleResources();
	}

	@Override
	public List<LimitRoleResources> getByParam(LimitRoleResources roleresource) {
		// TODO Auto-generated method stub
		return roleResourcesMapper.getLimitRoleResourcesByParam(roleresource);
	}

	@Override
	public Integer saveRoleResources(LimitRoleResources roleresources) {
		// TODO Auto-generated method stub
		return roleResourcesMapper.insert(roleresources);
	}

	@Override
	public Integer updateRoleResources(LimitRoleResources roleresources) {
		// TODO Auto-generated method stub
		return roleResourcesMapper.update(roleresources);
	}

}

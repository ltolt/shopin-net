package net.shopin.wms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.wms.domain.entity.LimitRole;
import net.shopin.wms.persistence.LimitRoleMapper;
import net.shopin.wms.service.ILimitRoleService;
/**
 * 角色管理接口实现
 * @Class Name LimitRoleServiceImpl
 * @Author chenqb
 * @Create In 2013-8-9
 */
@Component("limitRoleService")
@Scope("prototype")
@Transactional
public class LimitRoleServiceImpl implements ILimitRoleService {
	
	@Autowired
	private LimitRoleMapper roleMapper;
	
	@Override
	public Integer deleteLimitRole(LimitRole role) {
		// TODO Auto-generated method stub
		return roleMapper.delete(role);
	}

	@Override
	public List getAll() {
		// TODO Auto-generated method stub
		List l = roleMapper.getAllLimitRole();
		return l;
		
	}

	@Override
	public List getByParam(LimitRole role) {
		// TODO Auto-generated method stub
		return roleMapper.getLimitRoleByParam(role);
	}

	@Override
	public Integer saveLimitRole(LimitRole role) {
		// TODO Auto-generated method stub
		return roleMapper.insert(role);
	}

	@Override
	public Integer updateLimitRole(LimitRole role) {
		// TODO Auto-generated method stub
		return roleMapper.update(role);
	}

}

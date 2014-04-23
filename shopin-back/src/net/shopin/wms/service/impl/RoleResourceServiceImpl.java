/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.impl.RoleResourceServiceImpl.java
 * @Create By wangdg
 * @Create In 2013-7-8 下午2:27:40
 * TODO
 */
package net.shopin.wms.service.impl;

import java.util.List;

import net.shopin.wms.domain.entity.RoleResource;
import net.shopin.wms.domain.view.RoleResourceVO;
import net.shopin.wms.persistence.RoleResourceMapper;
import net.shopin.wms.service.IRoleResourceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name RoleResourceServiceImpl
 * @Author wangdg
 * @Create In 2013-7-8
 */
@Component("roleResourceService")
@Scope("prototype")
@Transactional
public class RoleResourceServiceImpl implements IRoleResourceService {

	@Autowired
	RoleResourceMapper roleResourceMapper;
	
	
	@Override
	public int insert(RoleResource record) {
		return this.roleResourceMapper.insert(record);
	}

	@Override
	public int insertSelective(RoleResource record) {
		return this.roleResourceMapper.insertSelective(record);
	}

	@Override
	public List<RoleResourceVO> selectByRoleSid(Long sid) {
		return this.roleResourceMapper.selectByRoleSid(sid);
	}

	@Override
	public void deleteByRoleSid(Long sid) {
		this.roleResourceMapper.deleteByRoleSid(sid);
	}

}

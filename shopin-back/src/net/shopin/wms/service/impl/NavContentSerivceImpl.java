/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.impl.NavContentSerivceImpl.java
 * @Create By wangdg
 * @Create In 2013-7-22 上午11:34:59
 * TODO
 */
package net.shopin.wms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.wms.domain.entity.NavContent;
import net.shopin.wms.persistence.NavContentMapper;
import net.shopin.wms.service.INavContentSerivce;

/**
 * @Class Name NavContentSerivceImpl
 * @Author wangdg
 * @Create In 2013-7-22
 */
@Component("navContentSerivce")
@Scope("prototype")
@Transactional
public class NavContentSerivceImpl implements INavContentSerivce {

	@Autowired
	NavContentMapper navContentMapper;
	
	@Override
	public int deleteByPrimaryKey(Long sid) {
		return this.navContentMapper.deleteByPrimaryKey(sid);
	}

	@Override
	public int insert(NavContent record) {
		return this.navContentMapper.insert(record);
	}

	@Override
	public int insertSelective(NavContent record) {
		return this.navContentMapper.insertSelective(record);
	}

	@Override
	public NavContent selectByPrimaryKey(Long sid) {
		return this.navContentMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int updateByPrimaryKeySelective(NavContent record) {
		return this.navContentMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(NavContent record) {
		return this.navContentMapper.updateByPrimaryKey(record);
	}

}

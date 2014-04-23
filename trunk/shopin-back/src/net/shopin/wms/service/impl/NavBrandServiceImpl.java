/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.impl.NavBrandServiceImpl.java
 * @Create By wangdg
 * @Create In 2013-7-22 上午11:39:13
 * TODO
 */
package net.shopin.wms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.wms.domain.entity.NavBrand;
import net.shopin.wms.persistence.NavBrandMapper;
import net.shopin.wms.service.INavBrandService;

/**
 * @Class Name NavBrandServiceImpl
 * @Author wangdg
 * @Create In 2013-7-22
 */
@Component("navBrandService")
@Scope("prototype")
@Transactional
public class NavBrandServiceImpl implements INavBrandService {

	@Autowired
	NavBrandMapper navBrandMapper;

	@Override
	public int deleteByPrimaryKey(Long sid) {
		return this.navBrandMapper.deleteByPrimaryKey(sid);
	}

	@Override
	public int insert(NavBrand record) {
		return this.navBrandMapper.insert(record);
	}

	@Override
	public int insertSelective(NavBrand record) {
		return this.navBrandMapper.insertSelective(record);
	}

	@Override
	public NavBrand selectByPrimaryKey(Long sid) {
		return this.navBrandMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int updateByPrimaryKeySelective(NavBrand record) {
		return this.navBrandMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(NavBrand record) {
		return this.navBrandMapper.updateByPrimaryKey(record);
	}

	@Override
	public List selectNavBrandByNavSid(NavBrand record) {
		
		return this.navBrandMapper.selectNavBrandByNavSid(record);
	}

	@Override
	public int countNavBrandRecord(NavBrand record) {
		
		return this.navBrandMapper.countNavBrandRecord(record);
	}

}

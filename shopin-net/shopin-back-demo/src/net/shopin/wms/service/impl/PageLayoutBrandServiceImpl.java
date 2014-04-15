/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.implPageLayoutBrandServiceImpl.java
 * @Create By jingpeng
 * @Create In 2013-8-29 下午6:57:00
 * TODO
 */
package net.shopin.wms.service.impl;

import net.shopin.wms.domain.entity.PageLayoutBrand;
import net.shopin.wms.persistence.PageLayoutBrandMapper;
import net.shopin.wms.service.IPageLayoutBrandService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name PageLayoutBrandServiceImpl
 * @Author jingpeng
 * @Create In 2013-8-29
 */
@Component("pageLayoutBrandService")
@Scope("prototype")
@Transactional
public class PageLayoutBrandServiceImpl implements IPageLayoutBrandService {

	@Autowired
	PageLayoutBrandMapper pageLayoutBrandMapper;
	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutBrandService#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.pageLayoutBrandMapper.deleteByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutBrandService#insert(net.shopin.wms.domain.entity.PageLayoutBrand)
	 */
	@Override
	public int insert(PageLayoutBrand record) {
		// TODO Auto-generated method stub
		return this.pageLayoutBrandMapper.insert(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutBrandService#insertSelective(net.shopin.wms.domain.entity.PageLayoutBrand)
	 */
	@Override
	public int insertSelective(PageLayoutBrand record) {
		// TODO Auto-generated method stub
		return this.pageLayoutBrandMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutBrandService#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public PageLayoutBrand selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.pageLayoutBrandMapper.selectByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutBrandService#updateByPrimaryKeySelective(net.shopin.wms.domain.entity.PageLayoutBrand)
	 */
	@Override
	public int updateByPrimaryKeySelective(PageLayoutBrand record) {
		// TODO Auto-generated method stub
		return this.pageLayoutBrandMapper.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutBrandService#updateByPrimaryKey(net.shopin.wms.domain.entity.PageLayoutBrand)
	 */
	@Override
	public int updateByPrimaryKey(PageLayoutBrand record) {
		// TODO Auto-generated method stub
		return this.pageLayoutBrandMapper.updateByPrimaryKey(record);
	}

}

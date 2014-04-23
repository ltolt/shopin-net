/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.implPageLayoutContentServiceImpl.java
 * @Create By jingpeng
 * @Create In 2013-8-29 下午6:57:45
 * TODO
 */
package net.shopin.wms.service.impl;

import net.shopin.wms.domain.entity.PageLayoutContent;
import net.shopin.wms.persistence.PageLayoutContentMapper;
import net.shopin.wms.service.IPageLayoutContentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name PageLayoutContentServiceImpl
 * @Author jingpeng
 * @Create In 2013-8-29
 */
@Component("pageLayoutContentService")
@Scope("prototype")
@Transactional
public class PageLayoutContentServiceImpl implements IPageLayoutContentService {

	@Autowired
	PageLayoutContentMapper pageLayoutContentMapper;
	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutContentService#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.pageLayoutContentMapper.deleteByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutContentService#insert(net.shopin.wms.domain.entity.PageLayoutContent)
	 */
	@Override
	public int insert(PageLayoutContent record) {
		// TODO Auto-generated method stub
		return this.pageLayoutContentMapper.insert(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutContentService#insertSelective(net.shopin.wms.domain.entity.PageLayoutContent)
	 */
	@Override
	public int insertSelective(PageLayoutContent record) {
		// TODO Auto-generated method stub
		return this.pageLayoutContentMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutContentService#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public PageLayoutContent selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.pageLayoutContentMapper.selectByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutContentService#updateByPrimaryKeySelective(net.shopin.wms.domain.entity.PageLayoutContent)
	 */
	@Override
	public int updateByPrimaryKeySelective(PageLayoutContent record) {
		// TODO Auto-generated method stub
		return this.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutContentService#updateByPrimaryKey(net.shopin.wms.domain.entity.PageLayoutContent)
	 */
	@Override
	public int updateByPrimaryKey(PageLayoutContent record) {
		// TODO Auto-generated method stub
		return this.updateByPrimaryKey(record);
	}

}

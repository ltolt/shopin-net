/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.implPageTemplateServiceImpl.java
 * @Create By jingpeng
 * @Create In 2013-8-29 下午6:59:54
 * TODO
 */
package net.shopin.wms.service.impl;

import java.util.List;

import net.shopin.wms.domain.entity.PageTemplate;
import net.shopin.wms.persistence.PageTemplateMapper;
import net.shopin.wms.service.IPageTemplateService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name PageTemplateServiceImpl
 * @Author jingpeng
 * @Create In 2013-8-29
 */
@Component("pageTemplateService")
@Scope("prototype")
@Transactional
public class PageTemplateServiceImpl implements IPageTemplateService {

	@Autowired
	PageTemplateMapper pageTemplateMapper;
	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageTemplateService#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.pageTemplateMapper.deleteByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageTemplateService#insert(net.shopin.wms.domain.entity.PageTemplate)
	 */
	@Override
	public int insert(PageTemplate record) {
		// TODO Auto-generated method stub
		return this.pageTemplateMapper.insert(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageTemplateService#insertSelective(net.shopin.wms.domain.entity.PageTemplate)
	 */
	@Override
	public int insertSelective(PageTemplate record) {
		// TODO Auto-generated method stub
		return this.pageTemplateMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageTemplateService#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public PageTemplate selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.pageTemplateMapper.selectByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageTemplateService#updateByPrimaryKeySelective(net.shopin.wms.domain.entity.PageTemplate)
	 */
	@Override
	public int updateByPrimaryKeySelective(PageTemplate record) {
		// TODO Auto-generated method stub
		return this.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageTemplateService#updateByPrimaryKey(net.shopin.wms.domain.entity.PageTemplate)
	 */
	@Override
	public int updateByPrimaryKey(PageTemplate record) {
		// TODO Auto-generated method stub
		return this.updateByPrimaryKey(record);
	}

	@Override
	public List queryBySelective(PageTemplate record) {
		// TODO Auto-generated method stub
		return this.pageTemplateMapper.queryBySelective(record);
	}

}

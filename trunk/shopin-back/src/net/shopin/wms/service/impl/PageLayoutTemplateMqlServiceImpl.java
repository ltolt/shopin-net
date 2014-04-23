/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.implPageLayoutTemplateMqlServiceImpl.java
 * @Create By jingpeng
 * @Create In 2013-8-29 下午6:59:22
 * TODO
 */
package net.shopin.wms.service.impl;

import java.util.List;

import net.shopin.wms.domain.entity.PageLayoutTemplateMql;
import net.shopin.wms.persistence.PageLayoutTemplateMqlMapper;
import net.shopin.wms.service.IPageLayoutTemplateMqlService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name PageLayoutTemplateMqlServiceImpl
 * @Author jingpeng
 * @Create In 2013-8-29
 */
@Component("pageLayoutTemplateMqlService")
@Scope("prototype")
@Transactional
public class PageLayoutTemplateMqlServiceImpl implements
		IPageLayoutTemplateMqlService {

	@Autowired
	PageLayoutTemplateMqlMapper pageLayoutTemplateMqlMapper;
	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutTemplateMqlService#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.pageLayoutTemplateMqlMapper.deleteByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutTemplateMqlService#insert(net.shopin.wms.domain.entity.PageLayoutTemplateMql)
	 */
	@Override
	public int insert(PageLayoutTemplateMql record) {
		// TODO Auto-generated method stub
		return this.pageLayoutTemplateMqlMapper.insert(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutTemplateMqlService#insertSelective(net.shopin.wms.domain.entity.PageLayoutTemplateMql)
	 */
	@Override
	public int insertSelective(PageLayoutTemplateMql record) {
		// TODO Auto-generated method stub
		return this.pageLayoutTemplateMqlMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutTemplateMqlService#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public PageLayoutTemplateMql selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.pageLayoutTemplateMqlMapper.selectByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutTemplateMqlService#updateByPrimaryKeySelective(net.shopin.wms.domain.entity.PageLayoutTemplateMql)
	 */
	@Override
	public int updateByPrimaryKeySelective(PageLayoutTemplateMql record) {
		// TODO Auto-generated method stub
		return this.pageLayoutTemplateMqlMapper.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutTemplateMqlService#updateByPrimaryKeyWithBLOBs(net.shopin.wms.domain.entity.PageLayoutTemplateMql)
	 */
	@Override
	public int updateByPrimaryKeyWithBLOBs(PageLayoutTemplateMql record) {
		// TODO Auto-generated method stub
		return 0;
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPageLayoutTemplateMqlService#updateByPrimaryKey(net.shopin.wms.domain.entity.PageLayoutTemplateMql)
	 */
	@Override
	public int updateByPrimaryKey(PageLayoutTemplateMql record) {
		// TODO Auto-generated method stub
		return this.pageLayoutTemplateMqlMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<PageLayoutTemplateMql> queryAllTemplates() {
		// TODO Auto-generated method stub
		return this.pageLayoutTemplateMqlMapper.queryAllTemplates();
	}

}

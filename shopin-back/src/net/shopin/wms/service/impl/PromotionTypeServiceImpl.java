/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.implPromotionTypeServiceImpl.java
 * @Create By jingpeng
 * @Create In 2013-8-29 下午7:01:12
 * TODO
 */
package net.shopin.wms.service.impl;

import java.util.List;

import net.shopin.wms.domain.entity.PromotionType;
import net.shopin.wms.persistence.PromotionTypeMapper;
import net.shopin.wms.service.IPromotionTypeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name PromotionTypeServiceImpl
 * @Author jingpeng
 * @Create In 2013-8-29
 */
@Component("promotionTypeService")
@Scope("prototype")
@Transactional
public class PromotionTypeServiceImpl implements IPromotionTypeService {

	@Autowired
	PromotionTypeMapper promotionTypeMapper;
	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPromotionTypeService#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.promotionTypeMapper.deleteByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPromotionTypeService#insert(net.shopin.wms.domain.entity.PromotionType)
	 */
	@Override
	public int insert(PromotionType record) {
		// TODO Auto-generated method stub
		return this.promotionTypeMapper.insert(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPromotionTypeService#insertSelective(net.shopin.wms.domain.entity.PromotionType)
	 */
	@Override
	public int insertSelective(PromotionType record) {
		// TODO Auto-generated method stub
		return this.promotionTypeMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPromotionTypeService#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public PromotionType selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.promotionTypeMapper.selectByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPromotionTypeService#updateByPrimaryKeySelective(net.shopin.wms.domain.entity.PromotionType)
	 */
	@Override
	public int updateByPrimaryKeySelective(PromotionType record) {
		// TODO Auto-generated method stub
		return this.promotionTypeMapper.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IPromotionTypeService#updateByPrimaryKey(net.shopin.wms.domain.entity.PromotionType)
	 */
	@Override
	public int updateByPrimaryKey(PromotionType record) {
		// TODO Auto-generated method stub
		return this.promotionTypeMapper.updateByPrimaryKey(record);
	}

	@Override
	public List queryBySelective(PromotionType record) {
		// TODO Auto-generated method stub
		return this.promotionTypeMapper.queryBySelective(record);
	}

}

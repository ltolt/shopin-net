/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.impl.PromotionServiceImpl.java
 * @Create By wangdg
 * @Create In 2013-7-22 上午11:37:48
 * TODO
 */
package net.shopin.wms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.wms.domain.entity.Promotions;
import net.shopin.wms.domain.view.PromotionsVO;
import net.shopin.wms.persistence.PromotionsMapper;
import net.shopin.wms.service.IPromotionService;

/**
 * @Class Name PromotionServiceImpl
 * @Author wangdg
 * @Create In 2013-7-22
 */
@Component("promotionService")
@Scope("prototype")
@Transactional
public class PromotionServiceImpl implements IPromotionService {

	@Autowired
	PromotionsMapper promotionsMapper;

	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.promotionsMapper.deleteByPrimaryKey(sid);
	}

	@Override
	public int insert(Promotions record) {
		// TODO Auto-generated method stub
		return this.promotionsMapper.insert(record);
	}

	@Override
	public int insertSelective(Promotions record) {
		// TODO Auto-generated method stub
		return this.promotionsMapper.insertSelective(record);
	}

	@Override
	public Promotions selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.promotionsMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int updateByPrimaryKeySelective(Promotions record) {
		// TODO Auto-generated method stub
		return this.promotionsMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Promotions record) {
		// TODO Auto-generated method stub
		return this.promotionsMapper.updateByPrimaryKey(record);
	}

	@Override
	public List selectAllPromotions() {
		// TODO Auto-generated method stub
		return this.promotionsMapper.selectAllPromotions();
	}

	@Override
	public List selectByTitle(Promotions record) {
		// TODO Auto-generated method stub
		return this.promotionsMapper.selectByTitle(record);
	}

	@Override
	public int queryMaxSid() {
		// TODO Auto-generated method stub
		return this.promotionsMapper.queryMaxSid();
	}

	@Override
	public List<Promotions> selectByPrams(PromotionsVO record) {
		// TODO Auto-generated method stub
		return this.promotionsMapper.selectByPrams(record);
	}

	@Override
	public Integer selectCountByParms(PromotionsVO record) {
		// TODO Auto-generated method stub
		return this.promotionsMapper.selectCountByParms(record);
	}

}

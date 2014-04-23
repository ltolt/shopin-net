/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.impl.NavPromotionServiceImpl.java
 * @Create By wangdg
 * @Create In 2013-7-22 上午11:36:59
 * TODO
 */
package net.shopin.wms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.wms.domain.entity.NavPromotion;
import net.shopin.wms.persistence.NavPromotionMapper;
import net.shopin.wms.service.INavPromotionService;

/**
 * @Class Name NavPromotionServiceImpl
 * @Author wangdg
 * @Create In 2013-7-22
 */
@Component("navPromotionService")
@Scope("prototype")
@Transactional
public class NavPromotionServiceImpl implements INavPromotionService {

	@Autowired
	NavPromotionMapper navPromotionMapper;
	
	@Override
	public int insert(NavPromotion record) {
		// TODO Auto-generated method stub
		return this.navPromotionMapper.insert(record);
	}

	@Override
	public int insertSelective(NavPromotion record) {
		// TODO Auto-generated method stub
		return this.navPromotionMapper.insertSelective(record);
	}

	

	@Override
	public List<NavPromotion> selectByNavSid(NavPromotion record) {
		// TODO Auto-generated method stub
		return this.navPromotionMapper.selectByNavSid(record);
	}

	@Override
	public int deleteByNavPro(NavPromotion record) {
		// TODO Auto-generated method stub
		return this.navPromotionMapper.deleteByNavPro(record);
	}

	@Override
	public int countNavPromotionRecord(NavPromotion record) {
		// TODO Auto-generated method stub
		return this.navPromotionMapper.countNavPromotionRecord(record);
	}

	

	

}

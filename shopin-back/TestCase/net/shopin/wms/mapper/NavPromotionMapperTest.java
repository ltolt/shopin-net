/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.mapperResourceMapperTest.java
 * @Create By Administrator
 * @Create In 2013-7-5 下午2:59:56
 * TODO
 */
package net.shopin.wms.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.NavBrand;
import net.shopin.wms.domain.entity.NavPromotion;
import net.shopin.wms.domain.entity.Resources;
import net.shopin.wms.persistence.NavBrandMapper;
import net.shopin.wms.persistence.NavPromotionMapper;
import net.shopin.wms.persistence.ResourcesMapper;

/**
 * @Class Name ResourceMapperTest
 * @Author Administrator
 * @Create In 2013-7-5
 */
public class NavPromotionMapperTest extends BaseTestContext{
	
	@Autowired
	private NavPromotionMapper navPromotionMapper;
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect(){
		Assert.notNull(this.navPromotionMapper);
		NavPromotion nav= new NavPromotion();
		nav.setNavSid(1l);
		List<NavPromotion> record = this.navPromotionMapper.selectByNavSid(nav);
		System.out.println(record.get(0).getPromotionSid());
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		Assert.notNull(this.navPromotionMapper);
		NavPromotion nav= new NavPromotion();
		Integer promotionSid = 43;
		Long navSid = 1l;
		nav.setNavSid(navSid);
		nav.setPromotionSid(promotionSid);
		
		 this.navPromotionMapper.deleteByNavPro(nav);
		System.out.println();
	}
	
	
	@Test
	@Transactional
	@Rollback(false)
	public void testCountPromotion(){
		Assert.notNull(this.navPromotionMapper);
		NavPromotion nav= new NavPromotion();
		Integer promotionSid = 43;
		Long navSid = 1l;
		nav.setNavSid(navSid);
		nav.setPromotionSid(promotionSid);
		
		 Integer number = this.navPromotionMapper.countNavPromotionRecord(nav);
		System.out.println(number);
	}


}

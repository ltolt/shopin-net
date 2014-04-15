package net.shopin.service;

import java.util.List;

import net.shopin.api.IPromotionService;
import net.shopin.base.BaseTestContext;
import net.shopin.view.PromotionVO;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 
 * @Class Name PromotionServiceImplTest
 * @Author kongm
 * @Create In 2013-10-16
 */
public class PromotionServiceImplTest extends BaseTestContext{
	
	
	@Autowired
	private IPromotionService promotionService;
	
	@Test
	public void testFindVipPromotion(){
		Assert.assertNotNull(this.promotionService);
		List list =  this.promotionService.findPromotion("165");
		System.out.println(list);
	}
	
}

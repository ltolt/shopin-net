/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.PromotionServiceTest.java
 * @Create By wangdg
 * @Create In 2013-9-10 上午10:21:26
 * TODO
 */
package net.shopin.wms.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.Promotions;

/**
 * @Class Name PromotionServiceTest
 * @Author wangdg
 * @Create In 2013-9-10
 */
public class PromotionServiceTest extends BaseTestContext {
	
	@Autowired
	IPromotionService promotionService;
	
	@Test
	public void testPromotionUpdate(){
		Promotions pro = new Promotions();
		pro.setSid(120);
		this.promotionService.updateByPrimaryKeySelective(pro);
	}

}

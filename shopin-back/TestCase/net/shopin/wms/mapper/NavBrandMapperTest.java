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
import net.shopin.wms.domain.entity.Resources;
import net.shopin.wms.persistence.NavBrandMapper;
import net.shopin.wms.persistence.ResourcesMapper;

/**
 * @Class Name ResourceMapperTest
 * @Author Administrator
 * @Create In 2013-7-5
 */
public class NavBrandMapperTest extends BaseTestContext{
	
	@Autowired
	private NavBrandMapper navBrandMapper;
	
//	@Test
//	@Transactional
//	@Rollback(false)
//	public void testSelect(){
//		Assert.notNull(this.navBrandMapper);
//		NavBrand nav= new NavBrand();
//		nav.setNavSid(1l);
//		List record = this.navBrandMapper.selectNavBrandByNavSid(nav);
//		System.out.println(record);
//	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testCountNavBrand(){
		Assert.notNull(this.navBrandMapper);
		NavBrand nav= new NavBrand();
		nav.setNavSid(1l);
		nav.setBrandSid(1l);
		Integer number = this.navBrandMapper.countNavBrandRecord(nav);
		System.out.println(number);
	}


}

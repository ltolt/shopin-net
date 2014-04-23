/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceResourcesServiceTest.java
 * @Create By shiying
 * @Create In 2013-7-5 下午4:21:50
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.NavBrand;
import net.shopin.wms.domain.entity.Resources;
import net.shopin.wms.domain.entity.Roles;

/**
 * @Class Name ResourcesServiceTest
 * @Author shiying
 * @Create In 2013-7-5
 */
public class NavBrandServiceTest extends BaseTestContext{
	
	@Autowired
	private INavBrandService navBrandService;
	
	
	
	@Test
	public void testSelect(){
		Assert.notNull(this.navBrandService);
		NavBrand nav = new NavBrand();
		nav.setNavSid(1l);
		List record =  this.navBrandService.selectNavBrandByNavSid(nav);
		System.out.println(record);
	}
	
	
}

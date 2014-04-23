/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.RoleResourceTest.java
 * @Create By wangdg
 * @Create In 2013-7-8 下午2:30:35
 * TODO
 */
package net.shopin.wms.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.RoleResource;

/**
 * @Class Name RoleResourceTest
 * @Author wangdg
 * @Create In 2013-7-8
 */
public class RoleResourceTest extends BaseTestContext {

	@Autowired
	IRoleResourceService roleResourceService;
	
	@Test
	public void TestSelectByRoleSid(){
		System.out.println(this.roleResourceService.selectByRoleSid(1041L));;
	}
	
}

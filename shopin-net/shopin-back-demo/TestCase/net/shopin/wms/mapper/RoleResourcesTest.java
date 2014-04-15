/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.mapper.RoleResourcesTest.java
 * @Create By wangdg
 * @Create In 2013-7-10 下午1:58:54
 * TODO
 */
package net.shopin.wms.mapper;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.RoleChannel;
import net.shopin.wms.domain.entity.RoleResource;
import net.shopin.wms.persistence.RoleResourceMapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name RoleResourcesTest
 * @Author wangdg
 * @Create In 2013-7-10
 */
public class RoleResourcesTest extends BaseTestContext {

	
	@Autowired
	RoleResourceMapper roleResourceMapper;
	
	@Test
	@Transactional
	@Rollback(false)
	public void testInsert() {
		RoleResource roleResource = new RoleResource();
		roleResource.setRolesSid(11111L);
		roleResource.setResourcesSid(3L);
		
		this.roleResourceMapper.insert(roleResource);
	}
	
	
}

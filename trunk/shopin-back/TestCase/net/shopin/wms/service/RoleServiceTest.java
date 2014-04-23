/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceRoleServiceTest1.java
 * @Create By lenovo
 * @Create In 2013-7-5 下午3:01:29
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.Roles;

/**
 * @Class Name RoleServiceTest1
 * @Author lenovo
 * @Create In 2013-7-5
 */
public class RoleServiceTest extends BaseTestContext {

	@Autowired
	private IRolesService roleService;
	
	
	@Test
	public void testSelect(){
		Assert.notNull(this.roleService);
		Roles record =  this.roleService.selectByPrimaryKey(1l);
		System.out.println(record);
	}
	
	@Test
	public void testInset(){
		Roles roles = new Roles();
		roles.setMemo("测试1");
		roles.setRoleName("测试1");
		
		this.roleService.insert(roles);
	}
	
	@Test
	public void testInsetSelective(){
		Roles roles = new Roles();
		roles.setMemo("测试2");
		roles.setRoleName("测试2");
		
		this.roleService.insertSelective(roles);
	}
	
	@Test
	public void testSelectByPrimaryKey(){
		
		System.out.println(this.roleService.selectByPrimaryKey(1L));
	}
	
	@Test
	public void testUpdateByPrimaryKey(){
		Roles roles = new Roles();
		roles.setSid(1030L);
		roles.setMemo("更改测试");
		
		this.roleService.updateByPrimaryKey(roles);
		System.out.println(roles.getMemo());
	}
	
	@Test
	public void testUpdateByPrimaryKeySelective(){
		Roles roles = new Roles();
		roles.setSid(1031L);
		roles.setMemo("更改测试2");
		
		int a= this.roleService.updateByPrimaryKey(roles);
		System.out.println(a);
	}
	
	@Test
	public void testSelectList(){
		Roles roles = new Roles();
		roles.setMemo("拍拍");
		
		List list =this.roleService.selectList(roles);
		System.out.println(list.size());
	}

	@Test
	public void testSelectAllRoles(){
		List list = this.roleService.selectAllRoles();
		System.out.println(list.size());
	}
	
	@Test
	public void testQueryMaxRoleSid(){
		System.out.println(this.roleService.queryMaxRoleSid());
	}
}

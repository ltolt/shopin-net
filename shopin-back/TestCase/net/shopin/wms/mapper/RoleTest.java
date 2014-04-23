/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.mapperRoleTest1.java
 * @Create By wangdg
 * @Create In 2013-7-5 下午3:00:09
 * TODO
 */
package net.shopin.wms.mapper;

import java.util.List;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.Roles;
import net.shopin.wms.persistence.RolesMapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

/**
 * @Class Name RoleTest1
 * @Author wangdg
 * @Create In 2013-7-5
 */
public class RoleTest extends BaseTestContext {

	@Autowired
	private RolesMapper rolesMapper;
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect(){
		Assert.notNull(this.rolesMapper);
		Roles record = this.rolesMapper.selectByPrimaryKey(1l);
		System.out.println(record);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		Roles roles = new Roles();
		roles.setRoleName("测试角色");
		roles.setMemo("测试");
		
		this.rolesMapper.insert(roles);
		
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsertSelective() {
		Roles roles = new Roles();
		roles.setTotal(30);
		roles.setPageSize(6);
		roles.setStart(3);
		roles.setOrderby("sid");
		roles.setRoleName("测试角色2");
		roles.setMemo("测试2");
		this.rolesMapper.insertSelective(roles);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdateByPrimaryKeySelective(){
		Roles roles = new Roles();
		roles.setSid(1039l);
		roles.setRoleName("更改测试");
		roles.setMemo("测试更改");
		this.rolesMapper.updateByPrimaryKey(roles);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdateByPrimaryKey(){
		Roles roles = new Roles();
		roles.setSid(1039l);
		roles.setRoleName("更改测试");
		roles.setMemo("测试更改");
		this.rolesMapper.updateByPrimaryKey(roles);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDeleteByPrimaryKey(){
		int a = this.rolesMapper.deleteByPrimaryKey(1040l);
		System.out.println(a);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testSelectList() {
		Roles record = new Roles();
		record.setRoleName("超级管理员");
		record.setPageSize(6);
		record.setOrderby("sid desc");
		record.setStart(10);
		record.setTotal(20);
		List list = this.rolesMapper.selectList(record);
		System.out.println(list.size());
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testSelectAllRoles(){
		List list = this.rolesMapper.selectAllRoles();
		System.out.println(list.size());
	}
}

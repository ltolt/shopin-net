/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceRoleChannelServiceTest.java
 * @Create By jingpeng
 * @Create In 2013-7-8 下午4:47:20
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;
import java.util.Map;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.RoleChannel;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

/**
 * @Class Name RoleChannelServiceTest
 * @Author jingpeng
 * @Create In 2013-7-8
 */
public class RoleChannelServiceTest extends BaseTestContext{
	
	@Autowired
	private IRoleChannelService roleChannelService;
	
	@Test
	public void testInsert() {
		Assert.notNull(roleChannelService);
		RoleChannel roleChannel = new RoleChannel();
		roleChannel.setChannelSid(3);
		roleChannel.setRolesSid(1041l);
		
		this.roleChannelService.insert(roleChannel);
	}

//	@Test
	public void testInsertSelective() {
		RoleChannel roleChannel = new RoleChannel();
		roleChannel.setChannelSid(4);
		roleChannel.setRolesSid(2l);
		
		this.roleChannelService.insert(roleChannel);
	}
	
	@Test
	public void testSelectList() {
		RoleChannel record = new RoleChannel();
		record.setRolesSid(2l);
		record.setChannelSid(3);
		List list = this.roleChannelService.selectList(record);
		RoleChannel roleChannel = (RoleChannel)list.get(0);
		System.out.println(roleChannel.getChannelSid() + ":" + roleChannel.getRolesSid());
		System.out.println(list.size());
	}
	
//	@Test
	public void testSelectAllRoleChannel() {
		List list = this.roleChannelService.selectAllRoleChannel();
		System.out.println(list.size());
	}
	
//	@Test
	public void testDeleteByParamter() {
		RoleChannel record = new RoleChannel();
		record.setChannelSid(1);
		record.setRolesSid(2l);
		int a = this.roleChannelService.deleteByParamter(record);
		System.out.println(a);
	}
}

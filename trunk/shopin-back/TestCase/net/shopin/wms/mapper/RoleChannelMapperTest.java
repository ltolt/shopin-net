/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.mapperRoleChannelMapperTest.java
 * @Create By jingpeng
 * @Create In 2013-7-8 下午3:24:20
 * TODO
 */
package net.shopin.wms.mapper;

import java.util.List;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.RoleChannel;
import net.shopin.wms.persistence.RoleChannelMapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name RoleChannelMapperTest
 * @Author jingpeng
 * @Create In 2013-7-8
 */
public class RoleChannelMapperTest extends BaseTestContext{
	
	@Autowired
	private RoleChannelMapper roleChannelMapper;
	
	@Test
	@Transactional
	@Rollback(false)
	public void testInsert() {
		RoleChannel roleChannel = new RoleChannel();
		roleChannel.setChannelSid(20);
		roleChannel.setRolesSid(3L);
		
		this.roleChannelMapper.insert(roleChannel);
	}

//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsertSelective() {
		RoleChannel roleChannel = new RoleChannel();
		roleChannel.setChannelSid(4);
		roleChannel.setRolesSid(2l);
		
		this.roleChannelMapper.insert(roleChannel);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelectList() {
		RoleChannel record = new RoleChannel();
		record.setRolesSid(2l);
		record.setChannelSid(3);
		List list = this.roleChannelMapper.selectList(record);
		RoleChannel roleChannel = (RoleChannel)list.get(0);
		System.out.println(roleChannel.getChannelSid() + ":" + roleChannel.getRolesSid());
		System.out.println(list.size());
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelectAllRoleChannel() {
		List list = this.roleChannelMapper.selectAllRoleChannel();
		System.out.println(list.size());
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testDeleteByParamter() {
		RoleChannel record = new RoleChannel();
		record.setChannelSid(1);
		record.setRolesSid(2l);
		int a = this.roleChannelMapper.deleteByParamter(record);
		System.out.println(a);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testUpdateByParamter() {
		
	}
}

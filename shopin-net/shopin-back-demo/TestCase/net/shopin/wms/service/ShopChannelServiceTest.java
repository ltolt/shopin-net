/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.ShopChannelServiceTest.java
 * @Create By wangdg
 * @Create In 2013-7-5 下午4:11:21
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.Channel;
import net.shopin.wms.domain.entity.Roles;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

/**
 * @Class Name ShopChannelServiceTest
 * @Author wangdg
 * @Create In 2013-7-5
 */
public class ShopChannelServiceTest extends BaseTestContext {
	
	@Autowired
	private IChannelService channelService;
	
//	@Test
	public void testSelect() {
		Assert.notNull(this.channelService);
		Channel channel = this.channelService.selectByPrimaryKey(1);
		System.out.println(channel);
	}
	
//	@Test
	public void testInset() {
		Channel channel = new Channel();
		channel.setPageLayoutSid(1);
		channel.setPageTemplateSid(1);
		channel.setChannelDesc("这是测试");
		channel.setChannelUrl("www.hao123.com");
		channel.setDisplayName("测试频道");
		channel.setFlag(1);
		channel.setIsShow(1);
		channel.setName("测试名字");
		channel.setSeq("1");
		this.channelService.insert(channel);
	}
	
//	@Test
	public void testInsetSelective() {
		Channel channel = new Channel();
		channel.setPageLayoutSid(1);
		channel.setPageTemplateSid(1);
		channel.setChannelDesc("这是测试2");
		channel.setChannelUrl("www.hao123.com2");
		channel.setDisplayName("测试频道2");
		channel.setFlag(2);
		channel.setIsShow(2);
		channel.setName("测试名字2");
		channel.setSeq("2");
		
		this.channelService.insertSelective(channel);
	}
	
//	@Test
	public void testSelectByPrimaryKey() {
		
		System.out.println(this.channelService.selectByPrimaryKey(1));
	}
//	
//	@Test
	public void testUpdateByPrimaryKey() {
		Channel channel = new Channel();
		channel.setSid(136);
		channel.setName("更改测试");

		this.channelService.updateByPrimaryKey(channel);
		System.out.println(channel.getChannelUrl());
	}
//	
//	@Test
	public void testUpdateByPrimaryKeySelective() {
		Channel channel = new Channel();
		channel.setSid(137);
		channel.setName("更改测试2");
		int a = this.channelService.updateByPrimaryKeySelective(channel);
		System.out.println(a);
	}
	
//	@Test
	public void testDeleteByPrimaryKey() {
		int a = this.channelService.deleteByPrimaryKey(137);
		System.out.println(a);
	}
	
	@Test
	public void testSelectAllChannels()	{
		List list = this.channelService.selectAllChannles();
		System.out.print(list.size());
	}
}

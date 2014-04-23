/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.mapper.ShopChannelTest.java
 * @Create By wangdg
 * @Create In 2013-7-5 下午4:01:14
 * TODO
 */
package net.shopin.wms.mapper;
import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.Channel;
import net.shopin.wms.persistence.ChannelMapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

/**
 * @Class Name ShopChannelTest
 * @Author wangdg
 * @Create In 2013-7-5
 */
public class ShopChannelMapperTest extends BaseTestContext{
	
	@Autowired
	private ChannelMapper channelMapper;
	
	@Test
	@Transactional
	@Rollback(false)
	public void testSelect(){
		Assert.notNull(this.channelMapper);
		Channel channel = this.channelMapper.selectByPrimaryKey(1);
		System.out.println(channel);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testInsert(){
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
		this.channelMapper.insert(channel);
		
	}
}

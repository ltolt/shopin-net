/**
 * @Probject Name: business
 * @Path: net.shopin.service.ChannelServiceImpl.java
 * @Create By jingpeng
 * @Create In 2013-7-11 上午11:20:29
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.List;

import net.shopin.api.IChannelService;
import net.shopin.view.AdvertisementVO;
import net.shopin.view.ChannelVO;
import net.shopin.view.SecondaryChannelVO;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.Assert;
/**
 * @Class Name ChannelServiceImpl
 * @Author jingpeng
 * @Create In 2013-7-11
 */
public class ChannelServiceImplTest {
	 private static AbstractApplicationContext context;
	 private IChannelService channelService;
	 
     @Before
     public void setUp() throws Exception {
        context = new ClassPathXmlApplicationContext("spring.xml");
        channelService = (IChannelService) context.getBean("channelService");
     }
     
     @Test
     public void testFindAllChannels()throws Exception {
    	 List<ChannelVO> listVo = new ArrayList<ChannelVO>();
    	 listVo = channelService.findAllChannels();
    	 for(ChannelVO vo : listVo) {
    		 System.out.println(vo.getDisplayName()+":"+".........");
    	 }
     }
     
     //@Test
     public void testGetChannelByName()throws Exception {
    	 ChannelVO vo = channelService.getChannelByName("man");
    	 Assert.notNull(vo);
    	 System.out.println(vo.getDisplayName() + ":" + vo.getName() );
     }
     
     //@Test
     public void testFindSubChannelsInChannel() throws Exception {
    	 List<SecondaryChannelVO> listVo = channelService.findSubChannelsInChannel("2");
    	 Assert.notNull(listVo);
    	 for(SecondaryChannelVO vo : listVo) {
    		 System.out.println(vo.getName());
    	 }
     }
     
    @Test
     public void testFindAdsInChannel() throws Exception {
    	 List<AdvertisementVO> listVo = channelService.findAdsInChannel("2");
    	 Assert.notNull(listVo);
    	 for(AdvertisementVO vo : listVo) {
    		 System.out.println(vo.getPositioname());
    	 }
     }
}

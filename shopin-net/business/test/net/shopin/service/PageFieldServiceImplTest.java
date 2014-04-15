/**
 * @Probject Name: business
 * @Path: net.shopin.servicePageFieldServiceImplTest.java
 * @Create By shiying
 * @Create In 2013-7-11 下午4:57:56
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.List;

import net.shopin.api.IPageFieldService;
import net.shopin.exception.TemplateException;
import net.shopin.view.PageColumnVO;
import net.shopin.view.PageFieldVO;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @Class Name PageFieldServiceImplTest
 * @Author shiying
 * @Create In 2013-7-11
 */
public class PageFieldServiceImplTest {
	
	 private static AbstractApplicationContext context;
	 private IPageFieldService pageFieldService; 
	 
	 @Before
	 public void setUp() throws Exception {
	        context = new ClassPathXmlApplicationContext("spring.xml");
	        pageFieldService = (IPageFieldService) context.getBean("pageFieldService");	        
       }
	 @Test
	 public void testfindColumnsByPromotion() {
		 String promotionId = "391";
		 List<PageColumnVO> vos = new ArrayList<PageColumnVO>();
		 try {
			vos = this.pageFieldService.findColumnsByPromotion(promotionId);
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		 for(int i = 0; i< vos.size(); i ++) {
			 PageColumnVO vo = vos.get(i);
			 System.out.println("第" + (i+1) +"个模版信息" + vo.getTemplate());
		}
		 
	 }
//	 @Test
	 public void testfindFieldsByPageLayoutSid() {
		 String sid = "70051";
		 List<PageFieldVO> buildPageFieldVOList= pageFieldService.findFieldsByPageLayoutSid(sid);
		 System.out.println(buildPageFieldVOList.toString());
	 }
	 
	@Test
	 public void testfindFieldsByChannel() {
		 String channelId = "150";
		 List<PageFieldVO> buildPageFieldVOList= pageFieldService.findFieldsByChannel(channelId);
		 System.out.println(buildPageFieldVOList);
	 }
	@Test
	 public void testfindColumnsByChannel() throws TemplateException {
		
//		ChannelVO channelVO = this.channelService.getChannelByName("index");
//	    System.out.print(channelVO.toString());
//		
//		 String channelId = channelVO.getSid();
		 List<PageColumnVO> buildPageFieldVOList= pageFieldService.findColumnsByChannel("165");
		 
			 System.out.println("第一个模版的信息="+buildPageFieldVOList.get(0).getTemplate());
			 System.out.println("第二个模版的信息="+buildPageFieldVOList.get(1).getTemplate());
		 
		 
    		 
	 }
}
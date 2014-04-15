/**
 * @Probject Name: business
 * @Path: net.shopin.service.NavigationServiceImplTest.java
 * @Create By jingpeng
 * @Create In 2013-10-8 上午11:13:07
 * TODO
 */
package net.shopin.service;

import java.util.List;

import net.shopin.api.INavigationService;
import net.shopin.view.NavigationVO;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @Class Name NavigationServiceImplTest
 * @Author jingpeng
 * @Create In 2013-10-8
 */
public class NavigationServiceImplTest {
	private static AbstractApplicationContext context;
	INavigationService navigationService;
	
	@Before
    public void setUp() throws Exception {
        context = new ClassPathXmlApplicationContext("spring.xml");
        navigationService = (INavigationService) context.getBean("navigationService");
    }
	@Test
	public void getNavigationsByChannelTest() {
		Integer channelSid = 165;
		List<NavigationVO> navContentVOs = this.navigationService.getNavigationsByChannel(channelSid);
		System.out.println(navContentVOs);
		for(NavigationVO vo : navContentVOs) {
			System.out.println(vo.getName());
		}
		
	}
}

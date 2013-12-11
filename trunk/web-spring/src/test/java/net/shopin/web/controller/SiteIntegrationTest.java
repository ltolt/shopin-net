/**
 * @Probject Name: web-spring
 * @Path: net.shopin.web.controller.SiteIntegrationTest.java
 * @Create By kongm
 * @Create In 2013-12-11 上午10:57:55
 * TODO
 */
package net.shopin.web.controller;

import net.shopin.core.services.MenuService;
import net.shopin.events.menu.RequestAllMenuItemsEvent;
import net.shopin.web.controller.fixture.WebDataFixture;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Matchers;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

/**
 * @Class Name SiteIntegrationTest
 * @Author kongm
 * @Create In 2013-12-11
 */
public class SiteIntegrationTest {
	
	private static final String RESPONSE_BODY = "Yummy Noodles,Special Yummy Noodles,Low cal Yummy Noodles";

	MockMvc mockMvc;
	
	@InjectMocks
	SiteController controller;
	
	@Mock
	MenuService menuService;
	
	@Before
	public void setup(){
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
		Mockito.when(menuService.requestAllMenuItems(Matchers.any(RequestAllMenuItemsEvent.class)))
		.thenReturn(WebDataFixture.allMenuItems());
		
	}
	
	@Test
	public void thatTextReturned()throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.get("/"))
		.andDo(MockMvcResultHandlers.print());
	}
	
	
	
	
}

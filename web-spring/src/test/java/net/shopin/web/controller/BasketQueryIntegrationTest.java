/**
 * @Probject Name: web-spring
 * @Path: net.shopin.web.controller.BasketQueryIntegrationTest.java
 * @Create By kongm
 * @Create In 2013-12-11 下午3:50:33
 * TODO
 */
package net.shopin.web.controller;

import net.shopin.web.domain.Basket;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * @Class Name BasketQueryIntegrationTest
 * @Author kongm
 * @Create In 2013-12-11
 */
public class BasketQueryIntegrationTest {

	private static final String VIEW_NAME = "/showBasket";
	private static final String FORWARD_URL = "/WEB-INF/views/showBasket.html";
	
	MockMvc mockMvc;
	
	@InjectMocks
	BasketQueryController controller;
	
	@Mock
	Basket basket;
	
	@Before
	public void setup(){
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(controller)
				 .setViewResolvers(viewResolver())
				.build();
	}
	
	private InternalResourceViewResolver viewResolver(){
		InternalResourceViewResolver viewResolver = 
				new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views");
		viewResolver.setSuffix(".html");
		return viewResolver;
	}
	
	@Test
	public void thatViewBasket()throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.get("/showBasket"))
		.andDo(MockMvcResultHandlers.print())
		.andExpect(MockMvcResultMatchers.status().isOk())
		.andExpect(MockMvcResultMatchers.model().attributeExists("basket"))
		;
	}
	
}

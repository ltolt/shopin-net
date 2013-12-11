/**
 * @Probject Name: web-spring
 * @Path: net.shopin.web.controller.BasketCommandIntegrationTest.java
 * @Create By kongm
 * @Create In 2013-12-11 下午4:01:52
 * TODO
 */
package net.shopin.web.controller;

import net.shopin.web.domain.Basket;
import net.shopin.web.domain.MenuItem;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * @Class Name BasketCommandIntegrationTest
 * @Author kongm
 * @Create In 2013-12-11
 */
public class BasketCommandIntegrationTest {
	
	private static final String MENU_ID = "LOOK_FOR_ME_IN_THE_LOG";
    private static final String ADD_REDIRECTED_URL = "/";
    private static final String ADD_VIEW = "redirect:/";
    private static final String REMOVE_REDIRECTED_URL = "/showBasket";
    private static final String REMOVE_VIEW = "redirect:/showBasket";
    
MockMvc mockMvc;
	
	@InjectMocks
	BasketCommandController controller;
	
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
    public void thatAddToBasketCollaborates()throws Exception{
    	mockMvc.perform(MockMvcRequestBuilders.get("/addToBasket"))
    	.andDo(MockMvcResultHandlers.print());
//    	Mockito.verify(basket).add(Mockito.any(MenuItem.class));
    	
    }

}

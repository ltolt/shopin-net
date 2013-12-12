/**
 * @Probject Name: web-spring
 * @Path: net.shopin.web.controller.CheckoutIntegrationTest.java
 * @Create By kongm
 * @Create In 2013-12-13 上午2:42:12
 * TODO
 */
package net.shopin.web.controller;

import net.shopin.core.services.OrderService;
import net.shopin.web.domain.Basket;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * @Class Name CheckoutIntegrationTest
 * @Author kongm
 * @Create In 2013-12-13
 */
public class CheckoutIntegrationTest {
	
	 private static final String POST_CODE = "90210";

	    private static final String ADDRESS1 = "Where they live";

	    private static final String CUSTOMER_NAME = "Customer Name";

	    private static final String CHECKOUT_VIEW = "/WEB-INF/views/checkout.html";
	    
	    MockMvc mockMvc;
	    
	    @InjectMocks
	    CheckoutController controller;
	
	    @Mock
	    OrderService orderService;
	    
	    @Before
	    public void setup(){
	    	MockitoAnnotations.initMocks(this);
	    	controller.setBasket(new Basket());
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
	    public void thatBasketIsPopulated()throws Exception{
	    	mockMvc.perform(MockMvcRequestBuilders.get("/checkout"))
	    	.andExpect(MockMvcResultMatchers.model().attributeExists("basket"));
	    }
	    
}

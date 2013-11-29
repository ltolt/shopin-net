/**
 * @Probject Name: spring
 * @Path: net.shopin.web.rest.ViewOrderIntegrationTest.java
 * @Create By kongm
 * @Create In 2013-11-29 下午3:37:25
 * TODO
 */
package net.shopin.web.rest;

import java.util.UUID;

import net.shopin.events.orders.RequestOrderDetailsEvent;
import net.shopin.services.OrderService;
import net.shopin.web.rest.fixture.RestDataFixture;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

//import static begin
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;
import static net.shopin.web.rest.fixture.RestEventFixtures.*;
//import static end
/**
 * @Class Name ViewOrderIntegrationTest
 * @Author kongm
 * @Create In 2013-11-29
 */
public class ViewOrderIntegrationTest {
	
	MockMvc mockMvc;
	
	@InjectMocks
	OrderQueriesController controller;
	
	@Mock
	OrderService orderService;
	
	UUID key = UUID.fromString("f3512d26-72f6-4290-9265-63ad69eccc13");
	
	@Before
	public void setup(){
		MockitoAnnotations.initMocks(this);
		this.mockMvc = standaloneSetup(controller)
				.setMessageConverters(new MappingJackson2HttpMessageConverter()).build();
	}
	
	@Test
	public void thatViewOrderRendersCorrectly() throws Exception{
		Mockito.when(orderService.requestOrderDetails(Mockito.any(RequestOrderDetailsEvent.class)))
			.thenReturn(orderDetailsEvent(key));
		this.mockMvc.perform(
				MockMvcRequestBuilders.get("/orders/{id}", key.toString())
				.accept(MediaType.APPLICATION_JSON))
				.andExpect(MockMvcResultMatchers.jsonPath("$.items['" + RestDataFixture.YUMMY_ITEM + "']").value(12))
				.andExpect(MockMvcResultMatchers.jsonPath("$.key").value(key.toString()));
	}
	
	

}

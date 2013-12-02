/**
 * @Probject Name: spring
 * @Path: net.shopin.web.rest.CreateNewOrderIntegrationTest.java
 * @Create By kongm
 * @Create In 2013-12-2 上午10:08:18
 * TODO
 */
package net.shopin.web.rest;

import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

import java.util.UUID;

import net.shopin.events.orders.CreateOrderEvent;
import net.shopin.services.OrderService;
import net.shopin.web.rest.fixture.RestDataFixture;
import net.shopin.web.rest.fixture.RestEventFixtures;

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
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

/**
 * @Class Name CreateNewOrderIntegrationTest
 * @Author kongm
 * @Create In 2013-12-2
 */
public class CreateNewOrderIntegrationTest {
	
	MockMvc mockMvc;
	
	@InjectMocks
	OrderCommandsController controller;
	
	@Mock
	OrderService orderService;
	
	@Before
	public void setup(){
		MockitoAnnotations.initMocks(this);
		this.mockMvc = standaloneSetup(controller)
				.setMessageConverters(new MappingJackson2HttpMessageConverter()).build();
		Mockito.when(orderService.createOrder(Mockito.any(CreateOrderEvent.class)))
		 .thenReturn(RestEventFixtures.orderCreated(UUID.fromString("f3512d26-72f6-4290-9265-63ad69eccc13")));
	}
	
	@Test
	public void thatCreateOrderUsesHttpCreated()throws Exception{
		this.mockMvc.perform(
				MockMvcRequestBuilders.post("/orders")
				.content(RestDataFixture.standardOrderJSON())
				.contentType(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON)
				).andDo(MockMvcResultHandlers.print())
				.andExpect(MockMvcResultMatchers.status().isCreated())
				;
	}
	
	
	

}

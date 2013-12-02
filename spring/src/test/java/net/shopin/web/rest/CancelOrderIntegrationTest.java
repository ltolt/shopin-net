/**
 * @Probject Name: spring
 * @Path: net.shopin.web.rest.CancelOrderIntegrationTest.java
 * @Create By kongm
 * @Create In 2013-11-29 下午5:43:10
 * TODO
 *//*
package net.shopin.web.rest;

import java.util.UUID;

import net.shopin.events.orders.DeleteOrderEvent;
import net.shopin.services.OrderService;
import net.shopin.web.rest.fixture.RestEventFixtures;

import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.Mockito.*;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

*//**
 * @Class Name CancelOrderIntegrationTest
 * @Author kongm
 * @Create In 2013-11-29
 *//*
public class CancelOrderIntegrationTest {

	MockMvc mockMvc;

	@InjectMocks
	OrderCommandsController controller;

	@Mock
	OrderService orderService;

	UUID key = UUID.fromString("f3512d26-72f6-4290-9265-63ad69eccc13");

	@Before
	public void setup() {
		MockitoAnnotations.initMocks(this);

		this.mockMvc = standaloneSetup(controller).setMessageConverters(
				new MappingJackson2HttpMessageConverter()).build();

	}
	
	// {!begin thatDeleteOrderUsesHttpOkOnSuccess}
	@Test
	public void thatDeleteOrderUsesHttpOkOnSuccess() throws Exception{
		when(orderService.deleteOrder(any(DeleteOrderEvent.class)))
		.thenReturn(RestEventFixtures.orderDeleted(key));
		this.mockMvc.perform(
				delete("/orders/${id}", key.toString())
				.accept(MediaType.APPLICATION_JSON))
				.andDo(print())
				.andExpect(status().isOk());
	}
	

}
*/
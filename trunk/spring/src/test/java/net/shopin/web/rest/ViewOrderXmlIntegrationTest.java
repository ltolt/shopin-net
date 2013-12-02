/**
 * @Probject Name: spring
 * @Path: net.shopin.web.rest.ViewOrderXmlIntegrationTest.java
 * @Create By kongm
 * @Create In 2013-12-2 上午11:26:55
 * TODO
 */
package net.shopin.web.rest;

import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

import java.util.UUID;

import net.shopin.events.orders.RequestOrderDetailsEvent;
import net.shopin.services.OrderService;
import net.shopin.web.rest.fixture.RestEventFixtures;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.converter.xml.Jaxb2RootElementHttpMessageConverter;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

/**
 * @Class Name ViewOrderXmlIntegrationTest
 * @Author kongm
 * @Create In 2013-12-2
 */
public class ViewOrderXmlIntegrationTest {
	
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
				.setMessageConverters(new MappingJackson2HttpMessageConverter(),
						 new Jaxb2RootElementHttpMessageConverter()).build();
	}

	@Test
	public void thatViewOrderRendersXMLCorrectly()throws Exception{
		Mockito.when(orderService.requestOrderDetails(Mockito.any(RequestOrderDetailsEvent.class)))
		   .thenReturn(RestEventFixtures.orderDetailsEvent(key));
		this.mockMvc.perform(
				MockMvcRequestBuilders.get("/orders/{id}",key.toString())
				.accept(MediaType.TEXT_XML)
				).andDo(MockMvcResultHandlers.print())
				.andExpect(MockMvcResultMatchers.content().contentType(MediaType.TEXT_XML));
				;
	}
	

}

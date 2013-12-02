/**
 * @Probject Name: spring
 * @Path: net.shopin.config.RestDomainIntegrationTest.java
 * @Create By kongm
 * @Create In 2013-12-2 下午3:57:44
 * TODO
 */
package net.shopin.config;

import net.shopin.web.rest.fixture.RestDataFixture;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Matchers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/**
 * @Class Name RestDomainIntegrationTest
 * @Author kongm
 * @Create In 2013-12-2
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {CoreConfig.class,MVCConfig.class})
public class RestDomainIntegrationTest {

	@Autowired
	WebApplicationContext webApplicationContext;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup(){
		this.mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext)
				.build();
	}
	
	@Test
	public void addANewOrderToTheSystem()throws Exception{
		this.mockMvc.perform(
				MockMvcRequestBuilders.post("/orders")
				.content(RestDataFixture.standardOrderJSON())
				.contentType(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON)
				).andDo(MockMvcResultHandlers.print())
				.andExpect(MockMvcResultMatchers.status().isCreated())
				;
		this.mockMvc.perform(
				MockMvcRequestBuilders.get("/orders")
				.accept(MediaType.APPLICATION_JSON)
				).andDo(MockMvcResultHandlers.print())
				.andExpect(MockMvcResultMatchers.status().isOk())
				.andExpect(MockMvcResultMatchers.jsonPath("$[0].items['"+ RestDataFixture.YUMMY_ITEM +"']").value(1))
				;
		
	}
	

}

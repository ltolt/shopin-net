/**
 * @Probject Name: web-spring
 * @Path: net.shopin.config.WebDomainIntegrationTest.java
 * @Create By kongm
 * @Create In 2013-12-11 上午11:57:36
 * TODO
 */
package net.shopin.config;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/**
 * @Class Name WebDomainIntegrationTest
 * @Author kongm
 * @Create In 2013-12-11
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {PersistenceConfig.class,CoreConfig.class,WebConfig.class})
public class WebDomainIntegrationTest {
	private static final String STANDARD = "Yummy Noodles";
    private static final String CHEF_SPECIAL = "Special Yummy Noodles";
    private static final String LOW_CAL = "Low cal Yummy Noodles";
    
    private MockMvc mockMvc;
    
    @Autowired
    WebApplicationContext webApplicationContext;
    
    @Before
    public void setup(){
    	mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }
	
    @Test
    public void thatTextReturned()throws Exception{
    	mockMvc.perform(MockMvcRequestBuilders.get("/"))
    	.andDo(MockMvcResultHandlers.print());
    	
    }
    

}

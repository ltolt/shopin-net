/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.integration.OrderStatusMappingIntegrationTests.java
 * @Create By kongm
 * @Create In 2013-12-6 下午3:48:18
 * TODO
 */
package net.shopin.persistence.integration;

import java.util.UUID;

import javax.annotation.Resource;

import net.shopin.config.GemfireConfiguration;
import net.shopin.persistence.domain.OrderStatus;
import net.shopin.persistence.domain.fixture.PersistenceFixture;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.data.gemfire.GemfireCallback;
import org.springframework.data.gemfire.GemfireOperations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gemstone.gemfire.GemFireCheckedException;
import com.gemstone.gemfire.GemFireException;
import com.gemstone.gemfire.cache.Region;

/**
 * @Class Name OrderStatusMappingIntegrationTests
 * @Author kongm
 * @Create In 2013-12-6
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {GemfireConfiguration.class})
public class OrderStatusMappingIntegrationTests {

	@Resource(name = "yummyTemplate")
	GemfireOperations yummyTemplate;
	
	@Before
	public void setup(){
		clear();
	}
	
	@Before
	public void teardown(){
		clear();
	}
	
	public void clear(){
		yummyTemplate.execute(new GemfireCallback<Object>() {

			@Override
			public Object doInGemfire(Region<?, ?> region)
					throws GemFireCheckedException, GemFireException {
				region.clear();
				return "completed";
			}
			
		});
	}
	
	
	@Test
	public void thatItemCustomMappingWorks()throws Exception{
		OrderStatus status = PersistenceFixture.startedCooking(UUID.randomUUID());
		yummyTemplate.put(4, status);
		OrderStatus results = yummyTemplate.findUnique("SELECT * from /YummyNoodleOrder");
		System.out.println("Found " + results.getId());
		
	}
	
	
	
}

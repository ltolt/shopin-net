/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.integration.OrderStatusRepositoryIntegrationTests.java
 * @Create By kongm
 * @Create In 2013-12-6 下午5:08:51
 * TODO
 */
package net.shopin.persistence.integration;

import java.util.UUID;

import net.shopin.config.GemfireConfiguration;
import net.shopin.persistence.domain.OrderStatus;
import net.shopin.persistence.domain.fixture.PersistenceFixture;
import net.shopin.persistence.repository.OrderStatusRepository;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Class Name OrderStatusRepositoryIntegrationTests
 * @Author kongm
 * @Create In 2013-12-6
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {GemfireConfiguration.class})
public class OrderStatusRepositoryIntegrationTests {
	
	@Autowired
	OrderStatusRepository orderStatusRepository;
	
	@Before
	public void setup(){
		orderStatusRepository.deleteAll();
	}
	
	@After
	public void teardown(){
		orderStatusRepository.deleteAll();
	}

	@Test
	public void thatItemIsInsertedIntoRepoWorks()throws Exception{
		UUID key = UUID.randomUUID();
		OrderStatus status = PersistenceFixture.startedCooking(key);
		status.setId(key);
		orderStatusRepository.save(status);
		OrderStatus retrieveOrderStatus = orderStatusRepository.findOne(key);
		System.out.println(retrieveOrderStatus);
	}
	
	
	@Test
	public void thatGetHistoryWorks()throws Exception{
		UUID orderId = UUID.randomUUID();
		
	}
	
	
	
	
	
	
	
}

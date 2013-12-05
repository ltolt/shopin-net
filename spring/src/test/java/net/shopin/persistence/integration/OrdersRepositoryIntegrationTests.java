/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.integration.OrdersRepositoryIntegrationTests.java
 * @Create By kongm
 * @Create In 2013-12-5 下午1:37:54
 * TODO
 */
package net.shopin.persistence.integration;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import junit.framework.TestCase;

import net.shopin.config.JPAConfiguration;
import net.shopin.persistence.domain.JPAOrder;
import net.shopin.persistence.repository.OrdersRepository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name OrdersRepositoryIntegrationTests
 * @Author kongm
 * @Create In 2013-12-5
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {JPAConfiguration.class})
@Transactional
@TransactionConfiguration(defaultRollback = true)
public class OrdersRepositoryIntegrationTests {
	
	@Autowired
	OrdersRepository ordersRepository;
	
	@Test
	public void thatItemIsInsertedIntoRepoWorks()throws Exception{
		String key = UUID.randomUUID().toString();
		JPAOrder order = new JPAOrder();
		order.setDateTimeOfSubmission(new Date());
		order.setId(key);
		Map<String, Integer> items = new HashMap<String, Integer>();
		items.put("yummy1", 15);
		items.put("yummy3", 12);
		items.put("yummy5", 7);
		order.setOrderItems(items);
		ordersRepository.save(order);
		JPAOrder retrieveOrder = ordersRepository.findById(key);
		TestCase.assertNotNull(retrieveOrder);
		TestCase.assertEquals(key, retrieveOrder.getId());
		TestCase.assertEquals(items.get("yummy1"), retrieveOrder.getOrderItems().get("yummy1"));
		
	}

}

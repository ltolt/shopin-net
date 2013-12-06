/**
 * @Path: net.shopin.persistence.integration.OrdersRepositoryFindOrdersContainingTests.java
 * @Probject Name: spring
 * @Create By kongm
 * @Create In 2013-12-6 上午10:20:28
 * TODO
 */
package net.shopin.persistence.integration;

import java.util.List;

import javax.persistence.EntityManager;

import junit.framework.TestCase;

import net.shopin.config.JPAConfiguration;
import net.shopin.persistence.domain.JPAOrder;
import net.shopin.persistence.domain.fixture.PersistenceFixture;
import net.shopin.persistence.repository.OrdersRepository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name OrdersRepositoryFindOrdersContainingTests
 * @Author kongm
 * @Create In 2013-12-6
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {JPAConfiguration.class})
@Transactional
@TransactionConfiguration(defaultRollback = true)
public class OrdersRepositoryFindOrdersContainingTests {
	
	@Autowired
	OrdersRepository ordersRepository;
	
	@Autowired
	EntityManager entityManager;
	
	@Test
	public void thatSearchingForOrdersContainingWorks()throws Exception{
		ordersRepository.save(PersistenceFixture.standardOrder());
		ordersRepository.save(PersistenceFixture.standardOrder());
		ordersRepository.save(PersistenceFixture.yummy16Order());
		ordersRepository.save(PersistenceFixture.yummy16Order());
		
		List<JPAOrder> retrieveOrders = ordersRepository.findOrdersContaining("yummy16");
		System.out.println(retrieveOrders);
		TestCase.assertNotNull(retrieveOrders);
		TestCase.assertEquals(2, retrieveOrders.size());
		
	}

}

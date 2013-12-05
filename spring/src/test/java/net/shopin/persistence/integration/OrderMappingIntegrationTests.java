/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.integration.OrderMappingIntegrationTests.java
 * @Create By kongm
 * @Create In 2013-12-5 上午10:43:14
 * TODO
 */
package net.shopin.persistence.integration;

import javax.persistence.EntityManager;

import net.shopin.config.JPAConfiguration;
import net.shopin.persistence.domain.fixture.JPAAssertions;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name OrderMappingIntegrationTests
 * @Author kongm
 * @Create In 2013-12-5
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {JPAConfiguration.class})
@Transactional
@TransactionConfiguration(defaultRollback = true)
public class OrderMappingIntegrationTests {
	
	@Autowired
	EntityManager manager;

	@Test
	public void thatItemCustomMappingWorks()throws Exception{
		JPAAssertions.assertTableExists(manager, "NOODLE_ORDERS");
		JPAAssertions.assertTableExists(manager, "ORDER_ORDER_ITEMS");
		JPAAssertions.assertTableHasColumn(manager, "NOODLE_ORDERS", "ORDER_ID");
//		JPAAssertions.assertTableHasColumn(manager, "NOODLE_ORDERS", "s");
	}
}

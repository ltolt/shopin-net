/**
 * @Probject Name: spring
 * @Path: net.shopin.config.CoreDomainIntegrationTest.java
 * @Create By kongm
 * @Create In 2013-12-2 下午3:14:52
 * TODO
 */
package net.shopin.config;

import junit.framework.TestCase;
import net.shopin.events.orders.AllOrdersEvent;
import net.shopin.events.orders.CreateOrderEvent;
import net.shopin.events.orders.OrderDetails;
import net.shopin.events.orders.RequestAllOrdersEvent;
import net.shopin.services.OrderService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Class Name CoreDomainIntegrationTest
 * @Author kongm
 * @Create In 2013-12-2
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CoreConfig.class})
public class CoreDomainIntegrationTest {
	
	@Autowired
	OrderService orderService;
	
	@Test
	public void addANewOrderToTheSystem(){
		CreateOrderEvent ev = new CreateOrderEvent(new OrderDetails());
		orderService.createOrder(ev);
		AllOrdersEvent allOrders = orderService.requestAllOrders(new RequestAllOrdersEvent());
		TestCase.assertEquals(1, allOrders.getOrdersDetails().size());
	}
	
	
	
	
	

}

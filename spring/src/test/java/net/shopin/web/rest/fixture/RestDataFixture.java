/**
 * @Probject Name: spring
 * @Path: net.shopin.web.rest.fixture.OrderStatusDetails.java
 * @Create By kongm
 * @Create In 2013-11-29 下午2:27:15
 * TODO
 */
package net.shopin.web.rest.fixture;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import net.shopin.events.orders.AllOrdersEvent;
import net.shopin.events.orders.OrderDetails;
import net.shopin.web.rest.domain.Order;

/**
 * @Class Name OrderStatusDetails
 * @Author kongm
 * @Create In 2013-11-29
 */

// TODOCUMENT. Use of test data fixture classes is considered good practice.
/*
 * The majority of tests aren't testing data edge cases, they are testing
 * logical flows and what happens to a generic set of data. For these, use a
 * small, standardised set of fixtures.
 * 
 * For anything more esoteric, create a new fixture in the test class.
 */
public class RestDataFixture {

	public static final String YUMMY_ITEM = "yummy1";

	public static AllOrdersEvent addOrders() {
		List<OrderDetails> orders = new ArrayList<OrderDetails>();
		orders.add(standardOrderDetails());
		orders.add(standardOrderDetails());
		orders.add(standardOrderDetails());
		return new AllOrdersEvent(orders);
	}

	public static OrderDetails standardOrderDetails() {
		return customKeyOrderDetails(UUID.randomUUID());
	}

	public static OrderDetails customKeyOrderDetails(UUID key) {
		OrderDetails orderDetails = new OrderDetails(key);
		orderDetails.setOrderItems(Collections.singletonMap(YUMMY_ITEM, 12));
		return orderDetails;
	}

	public static Order standardOrder() {
		Order order = new Order();

		order.setItems(Collections.singletonMap(YUMMY_ITEM, 12));

		return order;
	}

	public static String standardOrderJSON(){
		return "{\"items\":{\"yummy1\":12,\"yummy15\":42}}";
	}
	
	
}

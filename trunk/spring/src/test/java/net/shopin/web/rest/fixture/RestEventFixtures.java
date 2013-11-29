/**
 * @Probject Name: spring
 * @Path: net.shopin.web.rest.fixture.RestEventFixtures.java
 * @Create By kongm
 * @Create In 2013-11-29 下午2:19:32
 * TODO
 */
package net.shopin.web.rest.fixture;

import java.util.Date;
import java.util.UUID;

import net.shopin.events.orders.OrderDeletedEvent;
import net.shopin.events.orders.OrderDetailsEvent;
import net.shopin.events.orders.OrderStatusDetails;
import net.shopin.events.orders.OrderStatusEvent;
import static net.shopin.web.rest.fixture.RestDataFixture.*;

/**
 * @Class Name RestEventFixtures
 * @Author kongm
 * @Create In 2013-11-29
 */
public class RestEventFixtures {

	public static OrderStatusEvent orderStatusNotFound(UUID key) {
		return OrderStatusEvent.notFound(key);
	}

	public static OrderStatusEvent orderStatus(UUID key, String status) {
		return new OrderStatusEvent(key, new OrderStatusDetails(new Date(),
				status));
	}

	public static OrderDetailsEvent orderDetailsEvent(UUID key) {
		return new OrderDetailsEvent(key, customKeyOrderDetails(key));
	}
	
	 public static OrderDeletedEvent orderDeleted(UUID key) {
		    return new OrderDeletedEvent(key, standardOrderDetails());
		  }

}

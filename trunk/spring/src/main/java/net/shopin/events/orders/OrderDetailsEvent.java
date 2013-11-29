/**
 * @Probject Name: spring
 * @Path: net.shopin.events.orders.OrderDetailsEvent.java
 * @Create By kongm
 * @Create In 2013-11-29 下午3:58:56
 * TODO
 */
package net.shopin.events.orders;

import java.util.UUID;

import net.shopin.events.ReadEvent;

/**
 * @Class Name OrderDetailsEvent
 * @Author kongm
 * @Create In 2013-11-29
 */
public class OrderDetailsEvent extends ReadEvent {

	private UUID key;
	private OrderDetails orderDetails;

	private OrderDetailsEvent(UUID key) {
		this.key = key;
	}

	public OrderDetailsEvent(UUID key, OrderDetails orderDetails) {
		this.key = key;
		this.orderDetails = orderDetails;
	}

	public UUID getKey() {
		return key;
	}

	public OrderDetails getOrderDetails() {
		return orderDetails;
	}

	public static OrderDetailsEvent notFound(UUID key) {
		OrderDetailsEvent ev = new OrderDetailsEvent(key);
		ev.entityFound = false;
		return ev;
	}

}

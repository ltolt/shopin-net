/**
 * @Probject Name: spring
 * @Path: net.shopin.events.orders.OrderStatusEvent.java
 * @Create By kongm
 * @Create In 2013-11-29 下午2:20:18
 * TODO
 */
package net.shopin.events.orders;

import java.util.UUID;

import net.shopin.events.ReadEvent;

/**
 * @Class Name OrderStatusEvent
 * @Author kongm
 * @Create In 2013-11-29
 */
public class OrderStatusEvent extends ReadEvent {

	private UUID key;
	private OrderStatusDetails orderStatus;

	private OrderStatusEvent(UUID key) {
		this.key = key;
	}

	public OrderStatusEvent(UUID key, OrderStatusDetails orderStatus) {
		this.key = key;
		this.orderStatus = orderStatus;
	}

	public UUID getKey() {
		return key;
	}

	public OrderStatusDetails getOrderStatus() {
		return orderStatus;
	}

	public static OrderStatusEvent notFound(UUID key) {
		OrderStatusEvent ev = new OrderStatusEvent(key);
		ev.entityFound = false;
		return ev;
	}

}

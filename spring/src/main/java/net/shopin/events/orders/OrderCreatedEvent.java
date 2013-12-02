/**
 * @Probject Name: spring
 * @Path: net.shopin.events.orders.OrderCreatedEvent.java
 * @Create By kongm
 * @Create In 2013-12-2 上午10:14:16
 * TODO
 */
package net.shopin.events.orders;

import java.util.UUID;

import net.shopin.events.CreatedEvent;

/**
 * @Class Name OrderCreatedEvent
 * @Author kongm
 * @Create In 2013-12-2
 */
public class OrderCreatedEvent extends CreatedEvent {
	
	private final UUID newOrderKey;
	
	private final OrderDetails details;

	public OrderCreatedEvent(final UUID newOrderKey,final OrderDetails details) {
		this.newOrderKey = newOrderKey;
		this.details = details;
	}
	
	public OrderDetails getDetails(){
		return details;
	}
	
	public UUID getNewOrderKey(){
		return newOrderKey;
	}

}

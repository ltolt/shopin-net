/**
 * @Probject Name: spring
 * @Path: net.shopin.events.orders.CreateOrderEvent.java
 * @Create By kongm
 * @Create In 2013-11-29 上午10:06:27
 * TODO
 */
package net.shopin.events.orders;

import net.shopin.events.CreateEvent;

/**
 * @Class Name CreateOrderEvent
 * @Author kongm
 * @Create In 2013-11-29
 */
public class CreateOrderEvent extends CreateEvent {

	private OrderDetails details;
	
	public CreateOrderEvent(OrderDetails details){
		this.details = details;
	}
	
	public OrderDetails getDetails(){
		return details;
	}
	
}

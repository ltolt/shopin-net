/**
 * @Probject Name: spring
 * @Path: net.shopin.events.orders.AllOrdersEvent.java
 * @Create By kongm
 * @Create In 2013-11-29 下午2:30:51
 * TODO
 */
package net.shopin.events.orders;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import net.shopin.events.ReadEvent;

/**
 * @Class Name AllOrdersEvent
 * @Author kongm
 * @Create In 2013-11-29
 */
public class AllOrdersEvent extends ReadEvent {

	private final List<OrderDetails> orderDetails;

	public AllOrdersEvent(List<OrderDetails> orders) {
		this.orderDetails = Collections.unmodifiableList(orders);
	}

	public Collection<OrderDetails> getOrdersDetails() {
		return this.orderDetails;
	}

}

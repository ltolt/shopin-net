/**
 * @Probject Name: spring
 * @Path: net.shopin.events.orders.RequestOrderDetailsEvent.java
 * @Create By kongm
 * @Create In 2013-11-29 下午4:06:46
 * TODO
 */
package net.shopin.events.orders;

import java.util.UUID;

import net.shopin.events.RequestReadEvent;

/**
 * @Class Name RequestOrderDetailsEvent
 * @Author kongm
 * @Create In 2013-11-29
 */
public class RequestOrderDetailsEvent extends RequestReadEvent {

	private UUID key;

	public RequestOrderDetailsEvent(UUID key) {
		this.key = key;
	}

	public UUID getKey() {
		return key;
	}
}

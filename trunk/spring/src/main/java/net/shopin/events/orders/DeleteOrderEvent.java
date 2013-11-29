/**
 * @Probject Name: spring
 * @Path: net.shopin.events.orders.DeleteOrderEvent.java
 * @Create By kongm
 * @Create In 2013-11-29 上午10:08:04
 * TODO
 */
package net.shopin.events.orders;

import java.util.UUID;

import net.shopin.events.DeleteEvent;

/**
 * @Class Name DeleteOrderEvent
 * @Author kongm
 * @Create In 2013-11-29
 */
public class DeleteOrderEvent extends DeleteEvent{
	
	private final UUID key;

	public DeleteOrderEvent(final UUID key) {
		this.key = key;
	}
	
	public UUID getKey(){
		return key;
	}
	

}

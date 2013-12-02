/**
 * @Probject Name: spring
 * @Path: net.shopin.services.OrderService.java
 * @Create By kongm
 * @Create In 2013-11-29 下午2:55:15
 * TODO
 */
package net.shopin.services;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import net.shopin.events.orders.AllOrdersEvent;
import net.shopin.events.orders.CreateOrderEvent;
import net.shopin.events.orders.DeleteOrderEvent;
import net.shopin.events.orders.OrderCreatedEvent;
import net.shopin.events.orders.OrderDeletedEvent;
import net.shopin.events.orders.OrderDetailsEvent;
import net.shopin.events.orders.RequestAllOrdersEvent;
import net.shopin.events.orders.RequestOrderDetailsEvent;

/**
 * @Class Name OrderService
 * @Author kongm
 * @Create In 2013-11-29
 */
//TODOCUMENT THis is an event driven service.
//Used to interact with the core domain.
//All methods are guaranteed to return something, null will never be returned.
public interface OrderService {

	public AllOrdersEvent requestAllOrders
		(RequestAllOrdersEvent requestAllCurrentOrdersEvent);
	
	public OrderDetailsEvent requestOrderDetails
		(RequestOrderDetailsEvent requestOrderDetailsEvent);
	
	public OrderDeletedEvent deleteOrder
		(DeleteOrderEvent deleteOrderEvent);
	
	public OrderCreatedEvent createOrder(CreateOrderEvent event);
}

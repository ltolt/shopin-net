/**
 * @Probject Name: web-spring
 * @Path: net.shopin.core.services.OrderService.java
 * @Create By kongm
 * @Create In 2013-12-13 上午1:20:32
 * TODO
 */
package net.shopin.core.services;

import net.shopin.events.orders.AllOrdersEvent;
import net.shopin.events.orders.CreateOrderEvent;
import net.shopin.events.orders.DeleteOrderEvent;
import net.shopin.events.orders.OrderCreatedEvent;
import net.shopin.events.orders.OrderDeletedEvent;
import net.shopin.events.orders.OrderDetailsEvent;
import net.shopin.events.orders.OrderStatusEvent;
import net.shopin.events.orders.OrderUpdatedEvent;
import net.shopin.events.orders.RequestAllOrdersEvent;
import net.shopin.events.orders.RequestOrderDetailsEvent;
import net.shopin.events.orders.RequestOrderStatusEvent;
import net.shopin.events.orders.SetOrderPaymentEvent;

/**
 * @Class Name OrderService
 * @Author kongm
 * @Create In 2013-12-13
 */
//TODOCUMENT THis is an event driven service.
//Used to interact with the core domain.
//All methods are guaranteed to return something, null will never be returned.
public interface OrderService {
	
	public AllOrdersEvent requestAllOrders(RequestAllOrdersEvent requestAllOrdersEvent);
	
	public OrderDetailsEvent requestOrderDetails(RequestOrderDetailsEvent requestOrderDetailsEvent);
	
	public OrderStatusEvent requestOrderStatus(RequestOrderStatusEvent requestOrderStatusEvent);

	public OrderCreatedEvent createOrder(CreateOrderEvent event);
	
	public OrderUpdatedEvent setOrderPayment(SetOrderPaymentEvent setOrderPaymentEvent);
	
	public OrderDeletedEvent deleteOrder(DeleteOrderEvent deleteOrderEvent);
}

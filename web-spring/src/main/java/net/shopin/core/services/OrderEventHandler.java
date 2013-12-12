/**
 * @Probject Name: web-spring
 * @Path: net.shopin.core.services.OrderEventHandler.java
 * @Create By kongm
 * @Create In 2013-12-13 上午1:25:07
 * TODO
 */
package net.shopin.core.services;

import java.util.Date;
import java.util.UUID;

import net.shopin.core.domain.Order;
import net.shopin.events.orders.AllOrdersEvent;
import net.shopin.events.orders.CreateOrderEvent;
import net.shopin.events.orders.DeleteOrderEvent;
import net.shopin.events.orders.OrderCreatedEvent;
import net.shopin.events.orders.OrderDeletedEvent;
import net.shopin.events.orders.OrderDetailsEvent;
import net.shopin.events.orders.OrderStatusDetails;
import net.shopin.events.orders.OrderStatusEvent;
import net.shopin.events.orders.OrderUpdatedEvent;
import net.shopin.events.orders.RequestAllOrdersEvent;
import net.shopin.events.orders.RequestOrderDetailsEvent;
import net.shopin.events.orders.RequestOrderStatusEvent;
import net.shopin.events.orders.SetOrderPaymentEvent;
import net.shopin.events.orders.SetOrderStatusEvent;
import net.shopin.persistence.services.OrderPersistenceService;

/**
 * @Class Name OrderEventHandler
 * @Author kongm
 * @Create In 2013-12-13
 */
public class OrderEventHandler implements OrderService {

	private final OrderPersistenceService orderPersistenceService;
	
	
	
	public OrderEventHandler(final OrderPersistenceService orderPersistenceService) {
		this.orderPersistenceService = orderPersistenceService;
	}

	/* (non-Javadoc)
	 * @see net.shopin.core.services.OrderService#requestAllOrders(net.shopin.events.orders.RequestAllOrdersEvent)
	 */
	public AllOrdersEvent requestAllOrders(
			RequestAllOrdersEvent requestAllOrdersEvent) {
		return orderPersistenceService.requestAllOrders(requestAllOrdersEvent);
	}

	/* (non-Javadoc)
	 * @see net.shopin.core.services.OrderService#requestOrderDetails(net.shopin.events.orders.RequestOrderDetailsEvent)
	 */
	public OrderDetailsEvent requestOrderDetails(
			RequestOrderDetailsEvent requestOrderDetailsEvent) {
		return orderPersistenceService.requestOrderDetails(requestOrderDetailsEvent);
	}

	/* (non-Javadoc)
	 * @see net.shopin.core.services.OrderService#requestOrderStatus(net.shopin.events.orders.RequestOrderStatusEvent)
	 */
	public OrderStatusEvent requestOrderStatus(
			RequestOrderStatusEvent requestOrderStatusEvent) {
		return orderPersistenceService.requestOrderStatus(requestOrderStatusEvent);
	}

	/* (non-Javadoc)
	 * @see net.shopin.core.services.OrderService#createOrder(net.shopin.events.orders.CreateOrderEvent)
	 */
	public OrderCreatedEvent createOrder(CreateOrderEvent createvent) {
		 //TODO, add validation of menu items
	    //TODO, add order total calculation
	    //TODO, add order time estimate calculation
		//TODO  Think transaction boundary. Order and OrderStatus should be atomic
		OrderCreatedEvent event = orderPersistenceService.createOrder(createvent);
		//TODO, where should this go?
		OrderStatusEvent orderStatusEvent = orderPersistenceService
				.setOrderStatus(new SetOrderStatusEvent(event.getNewOrderKey(), new OrderStatusDetails(event.getNewOrderKey(),UUID.randomUUID(),new Date(),"Order Created")));
		return event;
	}

	/* (non-Javadoc)
	 * @see net.shopin.core.services.OrderService#setOrderPayment(net.shopin.events.orders.SetOrderPaymentEvent)
	 */
	public OrderUpdatedEvent setOrderPayment(
			SetOrderPaymentEvent setOrderPaymentEvent) {
		return orderPersistenceService.setOrderPayment(setOrderPaymentEvent);
	}

	/* (non-Javadoc)
	 * @see net.shopin.core.services.OrderService#deleteOrder(net.shopin.events.orders.DeleteOrderEvent)
	 */
	public OrderDeletedEvent deleteOrder(DeleteOrderEvent deleteOrderEvent) {
		OrderDetailsEvent orderDetailsEvent = 
				orderPersistenceService.requestOrderDetails(new RequestOrderDetailsEvent(deleteOrderEvent.getKey()));
		if(!orderDetailsEvent.isEntityFound()){
			return OrderDeletedEvent.notFound(deleteOrderEvent.getKey());
		}
		Order order = Order.fromOrderDetails(orderDetailsEvent.getOrderDetails());
		if(!order.canBeDeleted()){
			return OrderDeletedEvent.deletionForbidden(deleteOrderEvent.getKey(),order.toOrderDetails());
		}
		orderPersistenceService.deleteOrder(deleteOrderEvent);
		return new OrderDeletedEvent(deleteOrderEvent.getKey(), order.toOrderDetails());
	}

}

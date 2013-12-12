package net.shopin.persistence.services;

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
import net.shopin.events.orders.SetOrderStatusEvent;


public interface OrderPersistenceService {

  public AllOrdersEvent requestAllOrders(RequestAllOrdersEvent requestAllCurrentOrdersEvent);

  public OrderDetailsEvent requestOrderDetails(RequestOrderDetailsEvent requestOrderDetailsEvent);

  public OrderStatusEvent requestOrderStatus(RequestOrderStatusEvent requestOrderStatusEvent);

  public OrderCreatedEvent createOrder(CreateOrderEvent event);

  public OrderStatusEvent setOrderStatus(SetOrderStatusEvent event);

  public OrderUpdatedEvent setOrderPayment(SetOrderPaymentEvent setOrderPaymentEvent);

  public OrderDeletedEvent deleteOrder(DeleteOrderEvent deleteOrderEvent);

}

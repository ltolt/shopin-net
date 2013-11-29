/**
 * @Probject Name: spring
 * @Path: net.shopin.services.OrderEventHandler.java
 * @Create By kongm
 * @Create In 2013-11-29 下午2:59:46
 * TODO
 */
package net.shopin.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import net.shopin.domain.Order;
import net.shopin.events.orders.AllOrdersEvent;
import net.shopin.events.orders.DeleteOrderEvent;
import net.shopin.events.orders.OrderDeletedEvent;
import net.shopin.events.orders.OrderDetails;
import net.shopin.events.orders.OrderDetailsEvent;
import net.shopin.events.orders.RequestAllOrdersEvent;
import net.shopin.events.orders.RequestOrderDetailsEvent;
import net.shopin.repository.OrdersRepository;

/**
 * @Class Name OrderEventHandler
 * @Author kongm
 * @Create In 2013-11-29
 */
@Component("orderService")
@Scope("prototype")
public class OrderEventHandler implements OrderService {
	
	
	
	

	@Autowired
	private  OrdersRepository ordersRepository;

	public OrderEventHandler() {
	}

	
	public OrderEventHandler(final OrdersRepository ordersRepository) {
		this.ordersRepository = ordersRepository;
	}

	

	/* (non-Javadoc)
	 * @see net.shopin.services.OrderService#requestAllOrders(net.shopin.events.orders.RequestAllOrdersEvent)
	 */
	public AllOrdersEvent requestAllOrders(
			RequestAllOrdersEvent requestAllCurrentOrdersEvent) {
		List<OrderDetails> generatedDetails = new ArrayList<OrderDetails>();
		for(Order order : ordersRepository.findAll()){
			generatedDetails.add(order.toOrderDetails());
		}
		return new AllOrdersEvent(generatedDetails);
	}

	/**
	 * 
	 */
	public OrderDetailsEvent requestOrderDetails(
			RequestOrderDetailsEvent requestOrderDetailsEvent) {
		Order order = ordersRepository.findById(requestOrderDetailsEvent.getKey());
		if(order == null){
			return OrderDetailsEvent.notFound(requestOrderDetailsEvent.getKey());
		}
		return new OrderDetailsEvent(requestOrderDetailsEvent.getKey(), order.toOrderDetails());
	}


	public OrderDeletedEvent deleteOrder(DeleteOrderEvent deleteOrderEvent) {
		Order order = ordersRepository.findById(deleteOrderEvent.getKey());
		if(order == null){
			return OrderDeletedEvent.notFound(deleteOrderEvent.getKey());
		}
		OrderDetails details = order.toOrderDetails();
		//TODOCUMENT This contains some specific domain logic, not exposed to the outside world, and not part of the
	    //persistence rules.
		if(!order.canBeDeleted()){
			return OrderDeletedEvent.deletionForbidden(deleteOrderEvent.getKey(), details);
		}
		return new OrderDeletedEvent(deleteOrderEvent.getKey(), details);
	}

}

/**
 * @Probject Name: spring
 * @Path: net.shopin.web.rest.OrderCommandsController.java
 * @Create By kongm
 * @Create In 2013-11-29 下午2:13:30
 * TODO
 */
package net.shopin.web.rest;

import java.util.UUID;

import net.shopin.events.orders.CreateOrderEvent;
import net.shopin.events.orders.DeleteOrderEvent;
import net.shopin.events.orders.OrderCreatedEvent;
import net.shopin.events.orders.OrderDeletedEvent;
import net.shopin.services.OrderService;
import net.shopin.web.rest.domain.Order;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

/**
 * @Class Name OrderCommandsController
 * @Author kongm
 * @Create In 2013-11-29
 */
//{!begin boot}
@Controller
@RequestMapping("/orders")
public class OrderCommandsController {
//{!end boot}
	
	private static Logger LOG = 
			LoggerFactory.getLogger(OrderCommandsController.class);
	
	@Autowired
	private OrderService orderService;
	
	//{!begin createOrder}
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Order> createOrder(@RequestBody Order order , UriComponentsBuilder builder){
		OrderCreatedEvent orderCreated = orderService.createOrder(new CreateOrderEvent(order.toOrderDetails()));
		Order newOrder = Order.fromOrderDetails(orderCreated.getDetails());
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(builder.path("/orders/{id}").buildAndExpand(orderCreated.getNewOrderKey().toString()).toUri());
		return new ResponseEntity<Order>(newOrder,headers,HttpStatus.CREATED);
	}
	//{!end createOrder}
	
	// {!begin cancelOrder}
	@RequestMapping(method = RequestMethod.DELETE,value = "/{id}")
	public ResponseEntity<Order> cancelOrder(@PathVariable String id){
		OrderDeletedEvent orderDeletedEvent = this.orderService
				.deleteOrder(new DeleteOrderEvent(UUID.randomUUID()));
		if(!orderDeletedEvent.isEntityFound()){
			return new ResponseEntity<Order>(HttpStatus.NOT_FOUND);
		}
		Order order = Order.fromOrderDetails(orderDeletedEvent.getDetails());
		if(orderDeletedEvent.isDeletionCompleted()){
			return new ResponseEntity<Order>(order,HttpStatus.OK);
		}
		return new ResponseEntity<Order>(order,HttpStatus.FORBIDDEN);
	}
	// {!end cancelOrder}
	
}

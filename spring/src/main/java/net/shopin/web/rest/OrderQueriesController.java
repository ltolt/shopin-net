/**
 * @Probject Name: spring
 * @Path: net.shopin.web.rest.OrderQueriesController.java
 * @Create By kongm
 * @Create In 2013-11-29 下午2:15:36
 * TODO
 */
package net.shopin.web.rest;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import net.shopin.events.orders.OrderDetails;
import net.shopin.events.orders.OrderDetailsEvent;
import net.shopin.events.orders.RequestAllOrdersEvent;
import net.shopin.events.orders.RequestOrderDetailsEvent;
import net.shopin.services.OrderService;
import net.shopin.web.rest.domain.Order;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;


/**
 * @Class Name OrderQueriesController
 * @Author kongm
 * @Create In 2013-11-29
 */
//{!begin boot}
@Controller
@RequestMapping("/orders")
public class OrderQueriesController {
	
	private static Logger LOG = LoggerFactory.getLogger(OrderQueriesController.class);
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	@ResponseBody
	public List<Order> getAllOrders(){
		List<Order> orders = new ArrayList<Order>();
		for(OrderDetails detail : orderService.requestAllOrders(new RequestAllOrdersEvent()).getOrdersDetails())
		{
			orders.add(Order.fromOrderDetails(detail));
		}
		return orders;
	}
	
	@RequestMapping(method = RequestMethod.GET,value = "/{id}")
	public ResponseEntity<Order> viewOrder(@PathVariable String id){
		OrderDetailsEvent details = orderService
				.requestOrderDetails(new RequestOrderDetailsEvent(UUID.randomUUID()));
		if(!details.isEntityFound()){
			return new ResponseEntity<Order>(HttpStatus.NOT_FOUND);
		}
		Order order = Order.fromOrderDetails(details.getOrderDetails());
		return new  ResponseEntity<Order>(order, HttpStatus.OK);
	}
	
	
	
	

}

/**
 * @Probject Name: web-spring
 * @Path: net.shopin.web.controller.OrderStatusController.java
 * @Create By kongm
 * @Create In 2013-12-13 上午3:10:04
 * TODO
 */
package net.shopin.web.controller;

import java.util.UUID;

import net.shopin.core.services.OrderService;
import net.shopin.events.orders.OrderDetailsEvent;
import net.shopin.events.orders.OrderStatusEvent;
import net.shopin.events.orders.RequestOrderDetailsEvent;
import net.shopin.events.orders.RequestOrderStatusEvent;
import net.shopin.web.domain.OrderStatus;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @Class Name OrderStatusController
 * @Author kongm
 * @Create In 2013-12-13
 */
@Controller
@RequestMapping("/order/{orderId}")
public class OrderStatusController {
	
	private static final Logger LOG = LoggerFactory.getLogger(OrderStatusController.class);
	
	@Autowired
	private OrderService orderService;

	@RequestMapping(method = RequestMethod.GET)
	public String orderStatus(@ModelAttribute("orderStatus")OrderStatus orderStatus){
		LOG.debug("Get order status order id {} customer {}",orderStatus.getOrderId(),orderStatus.getName());
		return "/order";
	}
	
	@ModelAttribute("orderStatus")
	private OrderStatus getOrderStatus(@PathVariable("orderId")String orderId){
		OrderDetailsEvent orderDetailsEvent = orderService.requestOrderDetails(new RequestOrderDetailsEvent(UUID.fromString(orderId)));
		OrderStatusEvent orderStatusEvent = orderService.requestOrderStatus(new RequestOrderStatusEvent(UUID.fromString(orderId)));
		OrderStatus status = new OrderStatus();
		status.setName(orderDetailsEvent.getOrderDetails().getName());
		status.setOrderId(orderId);
		status.setStatus(orderStatusEvent.getOrderStatus().getStatus());
		return status;
	}
	
	
	
}

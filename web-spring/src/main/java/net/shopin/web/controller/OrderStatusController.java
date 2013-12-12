/**
 * @Probject Name: web-spring
 * @Path: net.shopin.web.controller.OrderStatusController.java
 * @Create By kongm
 * @Create In 2013-12-13 上午3:10:04
 * TODO
 */
package net.shopin.web.controller;

import net.shopin.core.services.OrderService;
import net.shopin.web.domain.OrderStatus;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	
	
	
	
}

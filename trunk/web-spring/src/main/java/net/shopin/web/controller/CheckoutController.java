/**
 * @Probject Name: web-spring
 * @Path: net.shopin.web.controller.CheckoutController.java
 * @Create By kongm
 * @Create In 2013-12-12 下午10:44:11
 * TODO
 */
package net.shopin.web.controller;

import java.util.UUID;

import javax.validation.Valid;

import net.shopin.core.services.OrderService;
import net.shopin.events.orders.CreateOrderEvent;
import net.shopin.events.orders.OrderCreatedEvent;
import net.shopin.events.orders.OrderDetails;
import net.shopin.web.domain.Basket;
import net.shopin.web.domain.CustomerInfo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @Class Name CheckoutController
 * @Author kongm
 * @Create In 2013-12-12
 */
@Controller
@RequestMapping("/checkout")
public class CheckoutController {
	
	private static final Logger LOG = LoggerFactory.getLogger(CheckoutController.class);
	
	@Autowired
	private Basket basket;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String checkout(){
		return "/checkout";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String doCheckout(@Valid @ModelAttribute("customerInfo")CustomerInfo customer,BindingResult result,
			   RedirectAttributes redirectAttributes){
		if(result.hasErrors()){
			//errors in the form
			//show the checkout form again
			return "/checkout";
		}
		LOG.debug("NO errors , continue with processing for customer {}　:",customer.getName());
		OrderDetails order = basket.createOrderDetailsWithCustomerInfo(customer);
		OrderCreatedEvent event = 
				orderService.createOrder(new CreateOrderEvent(order));
		UUID key = event.getNewOrderKey();
		redirectAttributes.addFlashAttribute("message","Your order has been accepted");
		basket.clear();
		LOG.debug("Basket now has {} items",basket.getSize());
		return "redirect:/order/" + key.toString();
	}
	
	
	@ModelAttribute("customerInfo")
	private CustomerInfo getCustomerInfo(){
		return new CustomerInfo();
	}
	
	@ModelAttribute("basket")
	private Basket getBasket(){
		return basket;
	}

	public void setBasket(Basket basket){
		this.basket = basket;
	}
	
}

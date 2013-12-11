/**
 * @Probject Name: web-spring
 * @Path: net.shopin.web.controller.BasketQueryController.java
 * @Create By kongm
 * @Create In 2013-12-11 下午3:41:17
 * TODO
 */
package net.shopin.web.controller;

import net.shopin.web.domain.Basket;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Class Name BasketQueryController
 * @Author kongm
 * @Create In 2013-12-11
 */
@Controller
public class BasketQueryController {
	
	
	private static final Logger LOG = LoggerFactory.getLogger(BasketQueryController.class);

	@Autowired
	private Basket basket;
	
	@RequestMapping(value = "/showBasket",method = RequestMethod.GET)
	public String show(Model model){
		LOG.debug("Show the basket contents");
		return "/showBasket";
	}
	
	@ModelAttribute("basket")
	private Basket getBasket(){
		return basket;
	}

}

/**
 * @Probject Name: web-spring
 * @Path: net.shopin.web.controller.BasketCommandController.java
 * @Create By kongm
 * @Create In 2013-12-11 下午3:41:33
 * TODO
 */
package net.shopin.web.controller;

import net.shopin.web.domain.Basket;
import net.shopin.web.domain.MenuItem;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Class Name BasketCommandController
 * @Author kongm
 * @Create In 2013-12-11
 */
@Controller
public class BasketCommandController {

	private static final Logger LOG = LoggerFactory.getLogger(BasketCommandController.class);
	
	
	@Autowired
	private Basket basket;
	
	@RequestMapping(value = "/addToBasket",method = RequestMethod.POST)
	public String add(@ModelAttribute("joe")MenuItem menuItem){
		LOG.debug("Add {} from the basket",menuItem.getId());
		basket.add(menuItem);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/removeFromBasket",method = RequestMethod.POST)
	public String remove(@ModelAttribute("fred")MenuItem menuItem){
		LOG.debug("Remove {} from the basket", menuItem.getId());
		basket.delete(menuItem.getId());
        return "redirect:/showBasket";
	}
	
	
	@ModelAttribute("basket")
	private Basket getBasket(){
		return basket;
	}
}











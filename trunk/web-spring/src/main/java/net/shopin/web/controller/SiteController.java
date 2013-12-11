/**
 * @Probject Name: web-spring
 * @Path: net.shopin.web.controller.SiteController.java
 * @Create By kongm
 * @Create In 2013-12-10 下午5:39:05
 * TODO
 */
package net.shopin.web.controller;

import java.util.ArrayList;
import java.util.List;

import net.shopin.core.services.MenuService;
import net.shopin.events.menu.AllMenuItemsEvent;
import net.shopin.events.menu.MenuItemDetails;
import net.shopin.events.menu.RequestAllMenuItemsEvent;
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
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Class Name SiteController
 * @Author kongm
 * @Create In 2013-12-10
 */
@Controller
@RequestMapping("/")
public class SiteController {

	private static final Logger LOG = LoggerFactory
			.getLogger(SiteController.class);

	@Autowired
	private MenuService menuService;

	@Autowired
	private Basket basket;

	@RequestMapping(method = RequestMethod.GET)
	public String getCurrentMenu(Model model) {
		LOG.debug("Yummy Menu directly");
		model.addAttribute("menuItems",
				getMenuItems(menuService.requestAllMenuItems(new RequestAllMenuItemsEvent())));
		return "/home";
	}
	
	private List<MenuItem> getMenuItems(AllMenuItemsEvent requestAllMenuItems) {
        List<MenuItem> menuDetails = new ArrayList<MenuItem>();

        for (MenuItemDetails menuItemDetails : requestAllMenuItems.getMenuItemDetails()) {
            menuDetails.add(MenuItem.fromMenuDetails(menuItemDetails));
        }

        return menuDetails;
    }


	private String prettyPrint(AllMenuItemsEvent requestAllMenuItems) {
		StringBuffer sb = new StringBuffer();
		String delim = "";
		for (MenuItemDetails menuItemDetails : requestAllMenuItems
				.getMenuItemDetails()) {
			sb.append(delim).append(menuItemDetails.getName());
			delim = ",";
		}

		return sb.toString();
	}
	
	@ModelAttribute("basket")
	private Basket getBasket(){
		return basket;
	}

}

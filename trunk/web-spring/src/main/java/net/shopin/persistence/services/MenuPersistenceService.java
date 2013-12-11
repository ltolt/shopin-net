/**
 * @Probject Name: web-spring
 * @Path: net.shopin.persistence.services.MenuPersistenceService.java
 * @Create By kongm
 * @Create In 2013-12-11 上午10:04:06
 * TODO
 */
package net.shopin.persistence.services;

import net.shopin.events.menu.AllMenuItemsEvent;
import net.shopin.events.menu.CreateMenuItemEvent;
import net.shopin.events.menu.MenuItemDetailsEvent;
import net.shopin.events.menu.RequestAllMenuItemsEvent;
import net.shopin.events.menu.RequestMenuItemDetailsEvent;

/**
 * @Class Name MenuPersistenceService
 * @Author kongm
 * @Create In 2013-12-11
 */
public interface MenuPersistenceService {

	AllMenuItemsEvent requestAllMenuItems(
			RequestAllMenuItemsEvent requestAllMenuItemsEvent);

	MenuItemDetailsEvent requestMenuItemDetails(
			RequestMenuItemDetailsEvent requestMenuItemDetailsEvent);

	MenuItemDetailsEvent createMenuItem(CreateMenuItemEvent createMenuItemEvent);

}

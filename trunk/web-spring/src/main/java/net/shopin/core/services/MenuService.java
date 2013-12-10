/**
 * @Probject Name: web-spring
 * @Path: net.shopin.core.services.MenuService.java
 * @Create By kongm
 * @Create In 2013-12-10 下午5:40:31
 * TODO
 */
package net.shopin.core.services;

import net.shopin.events.menu.AllMenuItemsEvent;
import net.shopin.events.menu.RequestAllMenuItemsEvent;

/**
 * @Class Name MenuService
 * @Author kongm
 * @Create In 2013-12-10
 */
public interface MenuService {
	AllMenuItemsEvent requestAllMenuItems(RequestAllMenuItemsEvent requestAllMenuItemsEvent);

}

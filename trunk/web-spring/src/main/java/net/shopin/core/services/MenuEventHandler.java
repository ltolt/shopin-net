/**
 * @Probject Name: web-spring
 * @Path: net.shopin.core.services.MenuEventHandler.java
 * @Create By kongm
 * @Create In 2013-12-10 下午5:43:33
 * TODO
 */
package net.shopin.core.services;

import net.shopin.events.menu.AllMenuItemsEvent;
import net.shopin.events.menu.RequestAllMenuItemsEvent;
import net.shopin.persistence.services.MenuPersistenceService;

/**
 * @Class Name MenuEventHandler
 * @Author kongm
 * @Create In 2013-12-10
 */
public class MenuEventHandler implements MenuService {
	
	private MenuPersistenceService menuPersistenceService;

	
	
	public MenuEventHandler(MenuPersistenceService menuPersistenceService) {
		this.menuPersistenceService = menuPersistenceService;
	}



	/* (non-Javadoc)
	 * @see net.shopin.core.services.MenuService#requestAllMenuItems(net.shopin.events.menu.RequestAllMenuItemsEvent)
	 */
	public AllMenuItemsEvent requestAllMenuItems(
			RequestAllMenuItemsEvent requestAllMenuItemsEvent) {
		return menuPersistenceService.requestAllMenuItems(requestAllMenuItemsEvent);
	}

}

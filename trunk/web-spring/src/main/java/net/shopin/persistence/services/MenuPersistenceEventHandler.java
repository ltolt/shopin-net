/**
 * @Probject Name: web-spring
 * @Path: net.shopin.persistence.services.MenuPersistenceEventHandler.java
 * @Create By kongm
 * @Create In 2013-12-11 上午10:05:09
 * TODO
 */
package net.shopin.persistence.services;

import java.util.ArrayList;
import java.util.List;

import net.shopin.events.menu.AllMenuItemsEvent;
import net.shopin.events.menu.CreateMenuItemEvent;
import net.shopin.events.menu.MenuItemDetails;
import net.shopin.events.menu.MenuItemDetailsEvent;
import net.shopin.events.menu.RequestAllMenuItemsEvent;
import net.shopin.events.menu.RequestMenuItemDetailsEvent;
import net.shopin.persistence.domain.MenuItem;
import net.shopin.persistence.repository.MenuItemRepository;

/**
 * @Class Name MenuPersistenceEventHandler
 * @Author kongm
 * @Create In 2013-12-11
 */
public class MenuPersistenceEventHandler implements MenuPersistenceService {

	private MenuItemRepository menuItemRepository;
	
	
	
	public MenuPersistenceEventHandler(MenuItemRepository menuItemRepository) {
		this.menuItemRepository = menuItemRepository;
	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.services.MenuPersistenceService#requestAllMenuItems(net.shopin.events.menu.RequestAllMenuItemsEvent)
	 */
	public AllMenuItemsEvent requestAllMenuItems(
			RequestAllMenuItemsEvent requestAllMenuItemsEvent) {
		Iterable<MenuItem> menuItems = menuItemRepository.findAll();
		List<MenuItemDetails> details = new ArrayList<MenuItemDetails>();
		for(MenuItem item : menuItems){
			details.add(item.toStatusDetails());
		}
		return new AllMenuItemsEvent(details);
	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.services.MenuPersistenceService#requestMenuItemDetails(net.shopin.events.menu.RequestMenuItemDetailsEvent)
	 */
	public MenuItemDetailsEvent requestMenuItemDetails(
			RequestMenuItemDetailsEvent requestMenuItemDetailsEvent) {
		MenuItem item = menuItemRepository.findById(requestMenuItemDetailsEvent.getId());
		if(item == null){
			return MenuItemDetailsEvent.notFound(requestMenuItemDetailsEvent.getId());
		}
		return new MenuItemDetailsEvent(requestMenuItemDetailsEvent.getId(),item.toStatusDetails());
	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.services.MenuPersistenceService#createMenuItem(net.shopin.events.menu.CreateMenuItemEvent)
	 */
	public MenuItemDetailsEvent createMenuItem(
			CreateMenuItemEvent createMenuItemEvent) {
		MenuItem item = menuItemRepository.save(
		        MenuItem.fromStatusDetails(createMenuItemEvent.getDetails()));

		    return new MenuItemDetailsEvent(
		        item.getId(),
		        item.toStatusDetails());
	}

}

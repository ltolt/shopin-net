/**
 * @Probject Name: web-spring
 * @Path: net.shopin.persistence.repository.MenuItemMemoryRepository.java
 * @Create By kongm
 * @Create In 2013-12-10 下午5:56:27
 * TODO
 */
package net.shopin.persistence.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import net.shopin.persistence.domain.MenuItem;

/**
 * @Class Name MenuItemMemoryRepository
 * @Author kongm
 * @Create In 2013-12-10
 */
public class MenuItemMemoryRepository implements MenuItemRepository {

	private Map<String, MenuItem> items = new HashMap<String, MenuItem>();
	
	public MenuItemMemoryRepository() {
		
	}
	
	public MenuItemMemoryRepository(Map<String, MenuItem> items) {
		this.items = items;
	}

	
	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.MenuItemRepository#save(net.shopin.persistence.domain.MenuItem)
	 */
	public MenuItem save(MenuItem order) {
		items.put(order.getId(), order);
		return order;
	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.MenuItemRepository#delete(java.lang.String)
	 */
	public void delete(String key) {
		items.remove(key);	
	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.MenuItemRepository#findById(java.lang.String)
	 */
	public MenuItem findById(String key) {
		for (MenuItem item : items.values()) {
			if (item.getId().equals(key)) {
				return item;
			}
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.MenuItemRepository#findAll()
	 */
	public Iterable<MenuItem> findAll() {
		return new ArrayList<MenuItem>(items.values());
	}

}

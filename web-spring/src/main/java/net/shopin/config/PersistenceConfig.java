/**
 * @Probject Name: web-spring
 * @Path: net.shopin.config.PersistenceConfig.java
 * @Create By kongm
 * @Create In 2013-12-11 上午11:36:19
 * TODO
 */
package net.shopin.config;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import net.shopin.persistence.domain.MenuItem;
import net.shopin.persistence.domain.Order;
import net.shopin.persistence.repository.MenuItemMemoryRepository;
import net.shopin.persistence.repository.MenuItemRepository;
import net.shopin.persistence.repository.OrderStatusMemoryRepository;
import net.shopin.persistence.repository.OrderStatusRepository;
import net.shopin.persistence.repository.OrdersMemoryRepository;
import net.shopin.persistence.repository.OrdersRepository;
import net.shopin.persistence.services.MenuPersistenceEventHandler;
import net.shopin.persistence.services.MenuPersistenceService;
import net.shopin.persistence.services.OrderPersistenceEventHandler;
import net.shopin.persistence.services.OrderPersistenceService;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Class Name PersistenceConfig
 * @Author kongm
 * @Create In 2013-12-11
 */
@Configuration
public class PersistenceConfig {

	@Bean
	public OrdersRepository orderRepository(){
		return new OrdersMemoryRepository(new HashMap<UUID, Order>());
	}
	
	@Bean
	public OrderStatusRepository orderStatusRepository(){
		return new OrderStatusMemoryRepository();
	}
	
	@Bean
	public OrderPersistenceService orderPersistenceService(){
		return new OrderPersistenceEventHandler(orderRepository(), orderStatusRepository());
	}
	
	
	@Bean
	public MenuItemRepository menuItemRepository() {
		return new MenuItemMemoryRepository(defaultMenu());
	}
	
	@Bean
	public MenuPersistenceService menuPersistenceService(MenuItemRepository menuItemRepository){
		return new MenuPersistenceEventHandler(menuItemRepository);
	}

	
	private Map<String, MenuItem> defaultMenu() {
		Map<String, MenuItem> items = new HashMap<String, MenuItem>();
		items.put("YM1",
				menuItem("YM1", new BigDecimal("1.99"), 11, "Yummy Noodles"));
		items.put(
				"YM2",
				menuItem("YM2", new BigDecimal("2.99"), 12,
						"Special Yummy Noodles"));
		items.put(
				"YM3",
				menuItem("YM3", new BigDecimal("3.99"), 13,
						"Low cal Yummy Noodles"));
		return items;
	}

	private MenuItem menuItem(String id, BigDecimal cost, int minutesToPrepare,
			String name) {
		MenuItem item = new MenuItem();
		item.setId(id);
		item.setCost(cost);
		item.setMinutesToPrepare(minutesToPrepare);
		item.setName(name);
		return item;
	}
}

/**
 * @Probject Name: web-spring
 * @Path: net.shopin.config.CoreConfig.java
 * @Create By kongm
 * @Create In 2013-12-11 上午11:32:27
 * TODO
 */
package net.shopin.config;

import net.shopin.core.services.MenuEventHandler;
import net.shopin.core.services.MenuService;
import net.shopin.core.services.OrderEventHandler;
import net.shopin.core.services.OrderService;
import net.shopin.persistence.services.MenuPersistenceService;
import net.shopin.persistence.services.OrderPersistenceService;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Class Name CoreConfig
 * @Author kongm
 * @Create In 2013-12-11
 */
@Configuration
public class CoreConfig {
	
	@Bean
	public MenuService menuService(MenuPersistenceService menuPersistenceService){
		return new MenuEventHandler(menuPersistenceService);
	}
	
	@Bean
	public OrderService orderService(OrderPersistenceService orderPersistenceService){
		return new OrderEventHandler(orderPersistenceService);
	}

}

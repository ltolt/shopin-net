/**
 * @Probject Name: spring
 * @Path: net.shopin.config.CoreConfig.java
 * @Create By kongm
 * @Create In 2013-12-2 下午3:13:47
 * TODO
 */
package net.shopin.config;

import java.util.HashMap;
import java.util.UUID;

import net.shopin.domain.Order;
import net.shopin.repository.OrdersMemoryRepository;
import net.shopin.repository.OrdersRepository;
import net.shopin.services.OrderEventHandler;
import net.shopin.services.OrderService;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Class Name CoreConfig
 * @Author kongm
 * @Create In 2013-12-2
 */
@Configuration
public class CoreConfig {
	
	@Bean
	public OrderService createService(OrdersRepository repo){
		return new OrderEventHandler(repo);
	}
	
	@Bean
	public OrdersRepository createRepo(){
		return new OrdersMemoryRepository(new HashMap<UUID, Order>());
	}
	
	
}

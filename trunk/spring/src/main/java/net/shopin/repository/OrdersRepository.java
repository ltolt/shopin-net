/**
 * @Probject Name: spring
 * @Path: net.shopin.repository.OrdersRepository.java
 * @Create By kongm
 * @Create In 2013-11-29 下午2:47:16
 * TODO
 */
package net.shopin.repository;

import java.util.List;
import java.util.UUID;

import net.shopin.domain.Order;

/**
 * @Class Name OrdersRepository
 * @Author kongm
 * @Create In 2013-11-29
 */
//TODO, make this event based again, with persistence integration events.
public interface OrdersRepository {
	
	Order save(Order order);

	void delete(UUID key);
	
	Order findById(UUID key);
	
	List<Order> findAll();
	
}

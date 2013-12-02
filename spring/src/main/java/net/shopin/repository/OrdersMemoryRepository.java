/**
 * @Probject Name: spring
 * @Path: net.shopin.repository.OrdersMemoryRepository.java
 * @Create By kongm
 * @Create In 2013-11-29 下午2:49:21
 * TODO
 */
package net.shopin.repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Repository;

import net.shopin.domain.Order;

/**
 * @Class Name OrdersMemoryRepository
 * @Author kongm
 * @Create In 2013-11-29
 */
//@Repository("ordersRepository")
public class OrdersMemoryRepository implements OrdersRepository {

	
	
	public OrdersMemoryRepository() {
		orders = new HashMap<UUID, Order>();
	}

	private Map<UUID, Order> orders;
	
	
	
	public OrdersMemoryRepository(final Map<UUID, Order> orders) {
		this.orders = Collections.unmodifiableMap(orders);
	}

	/* (non-Javadoc)
	 * @see net.shopin.repository.OrdersRepository#save(net.shopin.domain.Order)
	 */
	public synchronized Order save(Order order) {
		Map<UUID,Order> modifiableOrders = new HashMap<UUID, Order>(orders);
		modifiableOrders.put(order.getKey(), order);
		this.orders = Collections.unmodifiableMap(modifiableOrders);
		return order;
	}

	/* (non-Javadoc)
	 * @see net.shopin.repository.OrdersRepository#delete(java.util.UUID)
	 */
	public synchronized void delete(UUID key) {
		Map<UUID, Order> modifiableOrders = new HashMap<UUID, Order>(orders);
		modifiableOrders.remove(key);
		this.orders = Collections.unmodifiableMap(modifiableOrders);
	}

	/* (non-Javadoc)
	 * @see net.shopin.repository.OrdersRepository#findById(java.util.UUID)
	 */
	public Order findById(UUID key) {
		return orders.get(key);
	}

	/* (non-Javadoc)
	 * @see net.shopin.repository.OrdersRepository#findAll()
	 */
	public List<Order> findAll() {
		return Collections.unmodifiableList(new ArrayList<Order>(orders.values()));
	}

}

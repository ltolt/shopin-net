/**
 * @Probject Name: web-spring
 * @Path: net.shopin.persistence.repository.OrdersMemoryRepository.java
 * @Create By kongm
 * @Create In 2013-12-13 上午1:29:09
 * TODO
 */
package net.shopin.persistence.repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import net.shopin.persistence.domain.Order;

/**
 * @Class Name OrdersMemoryRepository
 * @Author kongm
 * @Create In 2013-12-13
 */
public class OrdersMemoryRepository implements OrdersRepository {
	
	
	private Map<UUID,Order> orders;
	
	

	public OrdersMemoryRepository(final Map<UUID, Order> orders) {
		this.orders = Collections.unmodifiableMap(orders);
	}
	

	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.OrdersRepository#save(net.shopin.persistence.domain.Order)
	 */
	public synchronized Order save(Order order) {
		Map<UUID,Order> modifiableOrders = new HashMap<UUID, Order>(orders);
		modifiableOrders.put(order.getKey(),order);
		this.orders = Collections.unmodifiableMap(modifiableOrders);
		return order;
	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.OrdersRepository#delete(java.util.UUID)
	 */
	public void delete(UUID key) {
		if(orders.containsKey(key)){
			Map<UUID, Order> modifiableOrders = new HashMap<UUID, Order>(orders);
			modifiableOrders.remove(key);
			this.orders = Collections.unmodifiableMap(modifiableOrders);
		}

	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.OrdersRepository#findById(java.util.UUID)
	 */
	public Order findById(UUID key) {
		return orders.get(key);
	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.OrdersRepository#findAll()
	 */
	public Iterable<Order> findAll() {
		return Collections.unmodifiableList(new ArrayList<Order>(orders.values()));
	}

}

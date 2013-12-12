/**
 * @Probject Name: web-spring
 * @Path: net.shopin.persistence.repository.OrderStatusMemoryRepository.java
 * @Create By kongm
 * @Create In 2013-12-13 上午1:35:37
 * TODO
 */
package net.shopin.persistence.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import net.shopin.persistence.domain.OrderStatus;

/**
 * @Class Name OrderStatusMemoryRepository
 * @Author kongm
 * @Create In 2013-12-13
 */
public class OrderStatusMemoryRepository implements OrderStatusRepository {

	private Map<UUID, OrderStatus> orderStatuses = new HashMap<UUID, OrderStatus>();
	
	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.OrderStatusRepository#save(net.shopin.persistence.domain.OrderStatus)
	 */
	public OrderStatus save(OrderStatus order) {
		orderStatuses.put(order.getId(), order);
		return order;
	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.OrderStatusRepository#delete(java.util.UUID)
	 */
	public void delete(UUID key) {
		orderStatuses.remove(key);
	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.OrderStatusRepository#findLatestById(java.util.UUID)
	 */
	public OrderStatus findLatestById(UUID key) {
		 for(OrderStatus item: orderStatuses.values()) {
		      if (item.getOrderId().equals(key)) {
		        return item;
		      }
		    }
		    return null;
	}

	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.OrderStatusRepository#findAll()
	 */
	public List<OrderStatus> findAll() {
		return new ArrayList<OrderStatus>(orderStatuses.values());
	}

}

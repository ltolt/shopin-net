/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.repository.OrderStatusRepository.java
 * @Create By kongm
 * @Create In 2013-12-6 下午3:45:41
 * TODO
 */
package net.shopin.persistence.repository;

import java.util.Collection;
import java.util.List;
import java.util.UUID;

import org.springframework.data.gemfire.repository.GemfireRepository;
import org.springframework.data.gemfire.repository.Query;

import net.shopin.persistence.domain.OrderStatus;

/**
 * @Class Name OrderStatusRepository
 * @Author kongm
 * @Create In 2013-12-6
 */
public interface OrderStatusRepository extends GemfireRepository<OrderStatus, UUID>{
	
	@Query("SELECT DISTINCT * FROM /YummyNoodleOrder WHERE orderId = $1 ORDER BY statusDate")
	public Collection<OrderStatus> getOrderHistory(UUID orderId);

}

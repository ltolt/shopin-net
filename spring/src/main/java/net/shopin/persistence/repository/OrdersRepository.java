/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.repository.OrdersRepository.java
 * @Create By kongm
 * @Create In 2013-12-5 上午11:28:53
 * TODO
 */
package net.shopin.persistence.repository;

import net.shopin.persistence.domain.JPAOrder;

import org.springframework.data.repository.CrudRepository;

/**
 * @Class Name OrdersRepository
 * @Author kongm
 * @Create In 2013-12-5
 */
public interface OrdersRepository extends CrudRepository<JPAOrder, String>{
	
	JPAOrder findById(String key);
	
}

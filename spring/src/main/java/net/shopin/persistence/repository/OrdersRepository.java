/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.repository.OrdersRepository.java
 * @Create By kongm
 * @Create In 2013-12-5 上午11:28:53
 * TODO
 */
package net.shopin.persistence.repository;

import java.util.List;

import net.shopin.persistence.domain.JPAOrder;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 * @Class Name OrdersRepository
 * @Author kongm
 * @Create In 2013-12-5
 */
public interface OrdersRepository extends CrudRepository<JPAOrder, String>{
	
	JPAOrder findById(String key);
	
	//{!begin query}
	@Query(value = "select no.* from  NOODLE_ORDERS no where no.ORDER_ID in (select ID from ORDER_ORDER_ITEMS where MENU_ID=:menuId)",nativeQuery = true)
	List<JPAOrder> findOrdersContaining(@Param("menuId")String menuId);
	
}

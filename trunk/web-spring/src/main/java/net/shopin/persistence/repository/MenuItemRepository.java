/**
 * @Probject Name: web-spring
 * @Path: net.shopin.persistence.repository.MenuItemRepository.java
 * @Create By kongm
 * @Create In 2013-12-10 下午5:55:26
 * TODO
 */
package net.shopin.persistence.repository;

import net.shopin.persistence.domain.MenuItem;

/**
 * @Class Name MenuItemRepository
 * @Author kongm
 * @Create In 2013-12-10
 */
public interface MenuItemRepository {

	MenuItem save(MenuItem order);

	void delete(String key);

	MenuItem findById(String key);

	Iterable<MenuItem> findAll();

}

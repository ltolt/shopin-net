/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.repository.MenuItemRepository.java
 * @Create By kongm
 * @Create In 2013-12-4 下午3:39:53
 * TODO
 */
package net.shopin.persistence.repository;

import java.util.List;

import net.shopin.persistence.domain.MenuItem;

import org.springframework.data.repository.CrudRepository;

/**
 * @Class Name MenuItemRepository
 * @Author kongm
 * @Create In 2013-12-4
 */
public interface MenuItemRepository extends CrudRepository<MenuItem, String>,AnalyseIngredients{
	
	public List<MenuItem> findByIngredientsNameIn(String ... name);

}

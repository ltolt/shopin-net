/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.repository.AnalyseIngredients.java
 * @Create By kongm
 * @Create In 2013-12-4 下午3:42:04
 * TODO
 */
package net.shopin.persistence.repository;

import java.util.Map;

/**
 * @Class Name AnalyseIngredients
 * @Author kongm
 * @Create In 2013-12-4
 */
public interface AnalyseIngredients {
	public Map<String, Integer> analyseIngredientsByPopularity();

}

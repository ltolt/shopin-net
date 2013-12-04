/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.repository.MenuItemRepositoryImpl.java
 * @Create By kongm
 * @Create In 2013-12-4 下午4:54:02
 * TODO
 */
package net.shopin.persistence.repository;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapreduce.MapReduceResults;
import org.springframework.stereotype.Component;

/**
 * @Class Name MenuItemRepositoryImpl
 * @Author kongm
 * @Create In 2013-12-4
 */
@Component
public class MenuItemRepositoryImpl implements AnalyseIngredients {

	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	
	/* (non-Javadoc)
	 * @see net.shopin.persistence.repository.AnalyseIngredients#analyseIngredientsByPopularity()
	 */
	@Override
	public Map<String, Integer> analyseIngredientsByPopularity() {
		MapReduceResults<IngredientAnalysis> results = mongoTemplate.mapReduce("menu", "classpath:ingredientsmap.js", "classpath:ingredientsreduce.js",IngredientAnalysis.class);
		Map<String, Integer> analysis = new HashMap<String, Integer>();
		for(IngredientAnalysis ingredientAnalysis : results){
			analysis.put(ingredientAnalysis.getId(), ingredientAnalysis.getValue());
		}
		return analysis;
	}
	
	private static class IngredientAnalysis{
		private String id;
		private int value;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public int getValue() {
			return value;
		}
		public void setValue(int value) {
			this.value = value;
		}
		
		
	}
	

}

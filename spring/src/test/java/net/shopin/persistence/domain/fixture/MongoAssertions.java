/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.domain.fixture.MongoAssertions.java
 * @Create By kongm
 * @Create In 2013-12-4 下午2:23:33
 * TODO
 */
package net.shopin.persistence.domain.fixture;

import java.util.Arrays;
import java.util.List;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.index.IndexInfo;

/**
 * @Class Name MongoAssertions
 * @Author kongm
 * @Create In 2013-12-4
 */
/**
 * Simple implementation of a fluent interface builder around MongoTemplate and Mongo.
 * Providing some assertions on collections, indexes and document structure.
 */
public class MongoAssertions {
	
	private MongoOperations ops;
	
	public static MongoAssertions usingMongo(MongoOperations ops){
		MongoAssertions assertions = new MongoAssertions();
		assertions.ops = ops;
		return assertions;
	}
	

	public class CollectionAssertions{
		
		private String collection;
		public CollectionAssertions(String name) {
			this.collection = name;
		}
		
		public boolean hasIndexOn(String ... fields){
			List<IndexInfo> indexes = ops.indexOps(collection).getIndexInfo();
			for(IndexInfo info : indexes){
				if(info.isIndexForFields(Arrays.asList(fields))){
					return true;
				}
			}
			return false;
		}
		
		
	}
	
	

}

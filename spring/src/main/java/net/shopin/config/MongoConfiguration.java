/**
 * @Probject Name: spring
 * @Path: net.shopin.config.MongoConfiguration.java
 * @Create By kongm
 * @Create In 2013-12-4 下午3:46:24
 * TODO
 */
package net.shopin.config;

import java.net.UnknownHostException;

import net.shopin.persistence.repository.MenuItemRepository;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import com.mongodb.Mongo;

/**
 * @Class Name MongoConfiguration
 * @Author kongm
 * @Create In 2013-12-4
 */
@Configuration
@EnableMongoRepositories(basePackages = "net.shopin.persistence.repository",
		includeFilters = @ComponentScan.Filter(value = {MenuItemRepository.class},type = FilterType.ASSIGNABLE_TYPE))
public class MongoConfiguration {

	public @Bean
		MongoTemplate mongoTemplate(Mongo mongo) throws UnknownHostException {
		return new MongoTemplate(mongo, "yummynoodle");
	}
	
	
	public @Bean Mongo mongo() throws UnknownHostException {
		return new Mongo("172.16.103.231");
	}
	
}

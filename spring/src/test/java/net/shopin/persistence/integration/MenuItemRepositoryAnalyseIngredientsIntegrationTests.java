/**
 * @Path: net.shopin.persistence.integration.MenuItemRepositoryAnalyseIngredientsIntegrationTests.java
 * @Probject Name: spring
 * @Create By kongm
 * @Create In 2013-12-4 下午5:03:09
 * TODO
 */
package net.shopin.persistence.integration;

import java.util.Map;

import net.shopin.config.MongoConfiguration;
import net.shopin.persistence.domain.fixture.PersistenceFixture;
import net.shopin.persistence.repository.MenuItemRepository;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Class Name MenuItemRepositoryAnalyseIngredientsIntegrationTests
 * @Author kongm
 * @Create In 2013-12-4
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {MongoConfiguration.class})
public class MenuItemRepositoryAnalyseIngredientsIntegrationTests {
	@Autowired
	MenuItemRepository menuItemRepository;
	
	@Autowired
	MongoOperations mongo;
	
	@Before
	public void setup()throws Exception{
		mongo.dropCollection("menu");
	}
	
	@After
	public void teardown(){
		mongo.dropCollection("menu");
	}
	
	@Test
	public void thatIngredientsAnalysisWorks()throws Exception{
		menuItemRepository.save(PersistenceFixture.standardItem());
		menuItemRepository.save(PersistenceFixture.standardItem());
		menuItemRepository.save(PersistenceFixture.standardItem());
		menuItemRepository.save(PersistenceFixture.eggFriedRice());
		menuItemRepository.save(PersistenceFixture.eggFriedRice());
		Map<String, Integer> ingredients = 
				menuItemRepository.analyseIngredientsByPopularity();
		System.out.println(ingredients);
	}

}

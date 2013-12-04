/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.integration.MenuItemRepositoryFindByIngredientsIntegrationTests.java
 * @Create By kongm
 * @Create In 2013-12-4 下午4:16:41
 * TODO
 */
package net.shopin.persistence.integration;

import java.util.List;

import junit.framework.TestCase;

import net.shopin.config.MongoConfiguration;
import net.shopin.persistence.domain.MenuItem;
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
 * @Class Name MenuItemRepositoryFindByIngredientsIntegrationTests
 * @Author kongm
 * @Create In 2013-12-4
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {MongoConfiguration.class})
public class MenuItemRepositoryFindByIngredientsIntegrationTests {

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
	public void thatItemIsInsertedIntoRepoWorks()throws Exception{
		menuItemRepository.save(PersistenceFixture.standardItem());
		menuItemRepository.save(PersistenceFixture.standardItem());
		menuItemRepository.save(PersistenceFixture.eggFriedRice());
		List<MenuItem> peanutItems = menuItemRepository.findByIngredientsNameIn("Peanuts");
		List items =  (List) menuItemRepository.findAll();
		System.out.println(items);
		TestCase.assertEquals(2, peanutItems.size());
	}

}

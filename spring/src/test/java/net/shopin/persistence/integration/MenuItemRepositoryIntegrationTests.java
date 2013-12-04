/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.integration.MenuItemRepositoryIntegrationTests.java
 * @Create By kongm
 * @Create In 2013-12-4 下午3:54:28
 * TODO
 */
package net.shopin.persistence.integration;

import junit.framework.TestCase;
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
 * @Class Name MenuItemRepositoryIntegrationTests
 * @Author kongm
 * @Create In 2013-12-4
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {MongoConfiguration.class})
public class MenuItemRepositoryIntegrationTests {
	
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
	public void thatItemIsInsertedIntoRepoWorks() throws Exception{
		TestCase.assertEquals(0, mongo.getCollection("menu").count());
		menuItemRepository.save(PersistenceFixture.standardItem());
		TestCase.assertEquals(1, mongo.getCollection("menu").count());
	}
	

}

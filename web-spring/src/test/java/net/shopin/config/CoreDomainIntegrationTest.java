package net.shopin.config;

/**
 * This integration test constructs an ApplicationContext using JavaConfig as specified on the @ContextConfiguration annotation. The Core domain's configuration will be created using Spring JavaConfig in a class called CoreConfig. The persistence domain's configuration will be created in a class call PersistenceConfig.
 * 
 */

import net.shopin.core.services.MenuService;
import net.shopin.events.menu.AllMenuItemsEvent;
import net.shopin.events.menu.RequestAllMenuItemsEvent;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { PersistenceConfig.class, CoreConfig.class })
public class CoreDomainIntegrationTest {

	@Autowired
	MenuService menuService;

	@Test
	public void thatAllMenuItemsReturned() {
		AllMenuItemsEvent allMenuItems = menuService
				.requestAllMenuItems(new RequestAllMenuItemsEvent());
		System.out.println(allMenuItems.getMenuItemDetails());
	}

}

/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.domain.fixture.PersistenceFixture.java
 * @Create By kongm
 * @Create In 2013-12-4 下午2:23:09
 * TODO
 */
package net.shopin.persistence.domain.fixture;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.UUID;

import net.shopin.persistence.domain.Ingredient;
import net.shopin.persistence.domain.JPAOrder;
import net.shopin.persistence.domain.MenuItem;
import net.shopin.persistence.domain.OrderStatus;

/**
 * @Class Name PersistenceFixture
 * @Author kongm
 * @Create In 2013-12-4
 */
public class PersistenceFixture {

	public static MenuItem standardItem(){
		MenuItem item = new MenuItem();
		item.setDescription("test yummy noddle bar");
		item.setName("yummy noddle");
		item.setCost(new BigDecimal("12.99"));
		item.setIngredients(new HashSet<Ingredient>(Arrays.asList(new Ingredient("Egg","used int the noddls"),new Ingredient("Peanuts", "A nut"),new Ingredient("Noddles","I love eat"))));
		return item;
	}
	
	
	public static MenuItem eggFriedRice(){
		MenuItem item = new MenuItem();
		item.setDescription("Rice egg fried");
		item.setName("yummy rice");
		item.setCost(new BigDecimal("12.88"));
		item.setIngredients(new HashSet<Ingredient>(
		        Arrays.asList(
		            new Ingredient("Rice", "Straight White Rice"),
		            new Ingredient("Egg", "Chicken Eggs")
		        )));
		return item;
	}
	
	public static JPAOrder standardOrder(){
		String key = UUID.randomUUID().toString();
		JPAOrder order = new JPAOrder();
		order.setDateTimeOfSubmission(new Date());
		order.setId(key);
		Map<String, Integer> items = new HashMap<String, Integer>();
		items.put("yummy1", 15);
		items.put("yummy2", 12);
		items.put("yummy3", 14);
		order.setOrderItems(items);
		return order;
	}
	
	 public static JPAOrder yummy16Order() {
		    String key = UUID.randomUUID().toString();

		    JPAOrder order = new JPAOrder();
		    order.setDateTimeOfSubmission(new Date());
		    order.setId(key);

		    Map<String, Integer> items = new HashMap<String, Integer>();

		    items.put("yummy16", 22);

		    order.setOrderItems(items);

		    return order;
		  }
	
	
	 public static OrderStatus startedCooking(UUID orderId){
		 return new OrderStatus(orderId, UUID.randomUUID(), new Date(), "start cooking");
	 }
	 
}

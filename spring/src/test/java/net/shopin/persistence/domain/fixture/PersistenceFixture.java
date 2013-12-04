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
import java.util.HashSet;

import net.shopin.persistence.domain.Ingredient;
import net.shopin.persistence.domain.MenuItem;

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
	
	
	
}

/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.domain.MenuItem.java
 * @Create By kongm
 * @Create In 2013-12-4 下午2:32:58
 * TODO
 */
package net.shopin.persistence.domain;

import java.math.BigDecimal;
import java.util.Set;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * @Class Name MenuItem
 * @Author kongm
 * @Create In 2013-12-4
 */
@Document(collection = "menu")
public class MenuItem {
	
	@Id
	private String id;
	
	@Field("itemName")
	@Indexed
	private String name;
	
	private String description;
	
	private Set<Ingredient> ingredients;
	
	private BigDecimal cost;
	
	private int minutesToPrepare;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<Ingredient> getIngredients() {
		return ingredients;
	}

	public void setIngredients(Set<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}

	public int getMinutesToPrepare() {
		return minutesToPrepare;
	}

	public void setMinutesToPrepare(int minutesToPrepare) {
		this.minutesToPrepare = minutesToPrepare;
	}

	@Override
	public String toString() {
		return String
				.format("MenuItem [id=%s, name=%s, description=%s, ingredients=%s, cost=%s, minutesToPrepare=%s]",
						id, name, description, ingredients, cost,
						minutesToPrepare);
	}
	
	
	

}

/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.domain.Ingredient.java
 * @Create By kongm
 * @Create In 2013-12-4 下午2:40:10
 * TODO
 */
package net.shopin.persistence.domain;

import org.springframework.data.mongodb.core.index.Indexed;

/**
 * @Class Name Ingredient
 * @Author kongm
 * @Create In 2013-12-4
 */
public class Ingredient {
	
	@Indexed
	private String name;
	private String description;
	
	public Ingredient(String name, String description) {
		this.name = name;
		this.description = description;
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
	
	
	
	
}

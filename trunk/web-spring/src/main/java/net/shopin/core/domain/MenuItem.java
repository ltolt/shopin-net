package net.shopin.core.domain;

import java.math.BigDecimal;
import java.util.Set;

public class MenuItem {

  private String id;
  private String name;
  private String description;

  private Set<Ingredient> ingredients;

  private BigDecimal cost;

  private int minutesToPrepare;

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
}

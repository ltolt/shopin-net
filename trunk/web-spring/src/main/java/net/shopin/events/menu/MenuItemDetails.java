package net.shopin.events.menu;

import java.math.BigDecimal;

public class MenuItemDetails {

  private String id;
  private String name;

  private BigDecimal cost;

  private int minutesToPrepare;

  public MenuItemDetails(String id, String name, BigDecimal cost, int minutesToPrepare) {
    this.id = id;
    this.name = name;
    this.cost = cost;
    this.minutesToPrepare = minutesToPrepare;
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

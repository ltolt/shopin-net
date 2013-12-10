package net.shopin.persistence.domain;


import java.math.BigDecimal;

import net.shopin.events.menu.MenuItemDetails;

public class MenuItem {

  private String id;
  private String name;

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

  public MenuItemDetails toStatusDetails() {
    return new MenuItemDetails(id, name, cost, minutesToPrepare);
  }

  public static MenuItem fromStatusDetails(MenuItemDetails orderStatusDetails) {
    MenuItem item = new MenuItem();

    item.cost = orderStatusDetails.getCost();
    item.id = orderStatusDetails.getId();
    item.minutesToPrepare = orderStatusDetails.getMinutesToPrepare();
    item.name = orderStatusDetails.getName();

    return item;
  }
}

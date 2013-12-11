package net.shopin.web.domain;

import java.math.BigDecimal;

import net.shopin.events.menu.MenuItemDetails;

import org.springframework.beans.BeanUtils;


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
 
  public static MenuItem fromMenuDetails(MenuItemDetails menuItemDetails) {
	MenuItem menuItem = new MenuItem();
	BeanUtils.copyProperties(menuItemDetails, menuItem);
	return menuItem;
  }
  
}

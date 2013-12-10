package net.shopin.events.menu;

import net.shopin.events.ReadEvent;



public class MenuItemDetailsEvent extends ReadEvent {
  private String key;
  private MenuItemDetails menuItemDetails;

  private MenuItemDetailsEvent() {}

  public MenuItemDetailsEvent(String key, MenuItemDetails menuItemDetails) {
    this.menuItemDetails = menuItemDetails;
  }

  public MenuItemDetails getMenuItemDetails() {
    return menuItemDetails;
  }

  public String getKey() {
    return key;
  }

  public static MenuItemDetailsEvent notFound(String key) {
    MenuItemDetailsEvent ev = new MenuItemDetailsEvent();
    ev.key = key;
    ev.entityFound=false;
    return ev;
  }
}

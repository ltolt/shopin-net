package net.shopin.events.menu;



import java.util.List;

import net.shopin.events.ReadEvent;

public class AllMenuItemsEvent extends ReadEvent {
  private List<MenuItemDetails> menuItemDetails;

  public AllMenuItemsEvent(List<MenuItemDetails> menuItemDetails) {
    this.menuItemDetails = menuItemDetails;
  }

  public List<MenuItemDetails> getMenuItemDetails() {
    return menuItemDetails;
  }
}

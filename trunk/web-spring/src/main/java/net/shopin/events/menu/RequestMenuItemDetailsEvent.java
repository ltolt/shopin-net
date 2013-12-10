package net.shopin.events.menu;

import net.shopin.events.RequestReadEvent;


public class RequestMenuItemDetailsEvent extends RequestReadEvent {
  private String id;

  public RequestMenuItemDetailsEvent(String id) {
    this.id = id;
  }

  public String getId() {
    return id;
  }
}

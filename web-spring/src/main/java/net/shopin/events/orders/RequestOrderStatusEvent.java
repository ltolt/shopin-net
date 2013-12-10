package net.shopin.events.orders;


import java.util.UUID;

import net.shopin.events.RequestReadEvent;

public class RequestOrderStatusEvent extends RequestReadEvent {
  private UUID key;

  public RequestOrderStatusEvent(UUID key) {
    this.key = key;
  }

  public UUID getKey() {
    return key;
  }
}

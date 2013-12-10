package net.shopin.events.orders;


import java.util.UUID;

import net.shopin.events.RequestReadEvent;

public class RequestOrderDetailsEvent extends RequestReadEvent {
  private UUID key;

  public RequestOrderDetailsEvent(UUID key) {
    this.key = key;
  }

  public UUID getKey() {
    return key;
  }
}

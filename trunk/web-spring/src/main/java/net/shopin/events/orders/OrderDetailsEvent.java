package net.shopin.events.orders;


import java.util.UUID;

import net.shopin.events.ReadEvent;

public class OrderDetailsEvent extends ReadEvent {
  private UUID key;
  private OrderDetails orderDetails;

  private OrderDetailsEvent(UUID key) {
    this.key = key;
  }

  public OrderDetailsEvent(UUID key, OrderDetails orderDetails) {
    this.key = key;
    this.orderDetails = orderDetails;
  }

  public UUID getKey() {
    return key;
  }

  public OrderDetails getOrderDetails() {
    return orderDetails;
  }

  public static OrderDetailsEvent notFound(UUID key) {
    OrderDetailsEvent ev = new OrderDetailsEvent(key);
    ev.entityFound=false;
    return ev;
  }
}

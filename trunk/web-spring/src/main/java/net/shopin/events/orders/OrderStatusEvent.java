package net.shopin.events.orders;


import java.util.UUID;

import net.shopin.events.ReadEvent;

public class OrderStatusEvent extends ReadEvent {
  private UUID key;
  private OrderStatusDetails orderStatus;

  private OrderStatusEvent(UUID key) {
    this.key = key;
  }

  public OrderStatusEvent(UUID key, OrderStatusDetails orderStatus) {
    this.key = key;
    this.orderStatus = orderStatus;
  }

  public UUID getKey() {
    return key;
  }

  public OrderStatusDetails getOrderStatus() {
    return orderStatus;
  }

  public static OrderStatusEvent notFound(UUID key) {
    OrderStatusEvent ev = new OrderStatusEvent(key);
    ev.entityFound=false;
    return ev;
  }
}

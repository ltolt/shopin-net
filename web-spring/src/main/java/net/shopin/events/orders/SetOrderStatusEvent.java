package net.shopin.events.orders;


import java.util.UUID;

import net.shopin.events.UpdateEvent;

public class SetOrderStatusEvent extends UpdateEvent {

  private UUID key;
  private OrderStatusDetails orderStatus;

  public SetOrderStatusEvent(UUID key, OrderStatusDetails orderStatus) {
    this.key = key;
    this.orderStatus = orderStatus;
  }

  public UUID getKey() {
    return key;
  }

  public OrderStatusDetails getOrderStatus() {
    return orderStatus;
  }
}

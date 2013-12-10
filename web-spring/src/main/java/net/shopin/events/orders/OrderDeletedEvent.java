package net.shopin.events.orders;


import java.util.UUID;

import net.shopin.events.DeletedEvent;

public class OrderDeletedEvent extends DeletedEvent {

  private UUID key;
  private OrderDetails details;
  private boolean deletionCompleted;

  private OrderDeletedEvent(UUID key) {
    this.key = key;
  }

  public OrderDeletedEvent(UUID key, OrderDetails details) {
    this.key = key;
    this.details = details;
    this.deletionCompleted = true;
  }

  public UUID getKey() {
    return key;
  }

  public OrderDetails getDetails() {
    return details;
  }

  public boolean isDeletionCompleted() {
    return deletionCompleted;
  }

  public static OrderDeletedEvent deletionForbidden(UUID key, OrderDetails details) {
    OrderDeletedEvent ev = new OrderDeletedEvent(key, details);
    ev.entityFound=true;
    ev.deletionCompleted=false;
    return ev;
  }

  public static OrderDeletedEvent notFound(UUID key) {
    OrderDeletedEvent ev = new OrderDeletedEvent(key);
    ev.entityFound=false;
    return ev;
  }
}

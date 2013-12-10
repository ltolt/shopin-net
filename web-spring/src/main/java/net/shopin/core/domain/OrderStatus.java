package net.shopin.core.domain;


import java.util.Date;
import java.util.UUID;

import net.shopin.events.orders.OrderStatusDetails;

public class OrderStatus {

  private UUID orderId;
  private UUID id;
  private Date statusDate;
  private String status;

  public OrderStatus(UUID orderId, UUID id, final Date date, final String status) {
    this.orderId = orderId;
    this.id = id;
    this.status = status;
    this.statusDate = date;
  }

  public Date getStatusDate() {
    return statusDate;
  }

  public String getStatus() {
    return status;
  }

  public UUID getOrderId() {
    return orderId;
  }

  public UUID getId() {
    return id;
  }

  public OrderStatusDetails toStatusDetails() {
    return new OrderStatusDetails(orderId, id, statusDate, status);
  }

  public static OrderStatus fromStatusDetails(OrderStatusDetails orderStatusDetails) {
    return new OrderStatus(
        orderStatusDetails.getOrderId(), orderStatusDetails.getId(),
        orderStatusDetails.getStatusDate(), orderStatusDetails.getStatus());
  }
}

package net.shopin.events.orders;

import java.util.Date;
import java.util.UUID;

public class OrderStatusDetails {

  private UUID orderId;
  private UUID id;
  private Date statusDate;
  private String status;

  public OrderStatusDetails(UUID orderId,
      UUID id, Date statusDate, String status) {
    this.id = id;
    this.orderId = orderId;
    this.status = status;
    this.statusDate = statusDate;
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
}

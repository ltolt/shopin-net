package net.shopin.web.domain;


public class OrderStatus {

  private String status;
  private String orderId;
  private String name;

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public String getOrderId() {
    return orderId;
  }

  public void setOrderId(String orderId) {
    this.orderId = orderId;
  }

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}
}

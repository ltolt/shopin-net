package net.shopin.persistence.domain;


import net.shopin.events.orders.OrderDetails;

import org.springframework.beans.BeanUtils;

import java.util.*;

public class Order {

  private final Date dateTimeOfSubmission;
  private Map<String, Integer> orderItems;
  private final UUID key;

  private OrderStatus status;
  private List<OrderStatus> statusHistory;
  
  private String name;
  private String address1;
  private String postcode;

  public Order(final Date dateTimeOfSubmission) {
    this.key = UUID.randomUUID();
    this.dateTimeOfSubmission = dateTimeOfSubmission;
    statusHistory = new ArrayList<OrderStatus>();
  }

  public void addStatus(OrderStatus newStatus) {
    statusHistory.add(newStatus);
    status = newStatus;
  }

  public OrderStatus getStatus() {
    return status;
  }

  public Date getDateTimeOfSubmission() {
    return dateTimeOfSubmission;
  }

  public UUID getKey() {
    return key;
  }

  public void setOrderItems(Map<String, Integer> orderItems) {
    if (orderItems == null) {
      this.orderItems = Collections.emptyMap();
    } else {
      this.orderItems = Collections.unmodifiableMap(orderItems);
    }
  }

  public Map<String, Integer> getOrderItems() {
    return orderItems;
  }

  public OrderDetails toOrderDetails() {
    OrderDetails details = new OrderDetails();

    BeanUtils.copyProperties(this, details);

    return details;
  }

  public static Order fromOrderDetails(OrderDetails orderDetails) {
    Order order = new Order(orderDetails.getDateTimeOfSubmission());

    BeanUtils.copyProperties(orderDetails, order);

    return order;
  }

public List<OrderStatus> getStatusHistory() {
	return statusHistory;
}

public void setStatusHistory(List<OrderStatus> statusHistory) {
	this.statusHistory = statusHistory;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getAddress1() {
	return address1;
}

public void setAddress1(String address1) {
	this.address1 = address1;
}

public String getPostcode() {
	return postcode;
}

public void setPostcode(String postcode) {
	this.postcode = postcode;
}

public void setStatus(OrderStatus status) {
	this.status = status;
}
}

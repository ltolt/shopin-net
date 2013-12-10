package net.shopin.events.orders;

import java.util.Collections;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

public class OrderDetails {

  private UUID key;
  private Date dateTimeOfSubmission;
  private Map<String, Integer> orderItems;
  
  private String name;
  private String address1;
  private String postcode;
  
  private String userName;
  

  public OrderDetails() {
    key = null;
  }

  public OrderDetails(UUID key) {
    this.key = key;
  }

  public Date getDateTimeOfSubmission() {
    return this.dateTimeOfSubmission;
  }

  public void setDateTimeOfSubmission(Date dateTimeOfSubmission) {
    this.dateTimeOfSubmission = dateTimeOfSubmission;
  }

  public Map<String, Integer> getOrderItems() {
    return orderItems;
  }

  public void setOrderItems(Map<String, Integer> orderItems) {
    if (orderItems == null) {
      this.orderItems = Collections.emptyMap();
    } else {
      this.orderItems = Collections.unmodifiableMap(orderItems);
    }
  }

  public UUID getKey() {
    return key;
  }

  public void setKey(UUID key) {
    this.key = key;
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

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}
}

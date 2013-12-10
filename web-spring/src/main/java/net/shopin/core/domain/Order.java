package net.shopin.core.domain;

import net.shopin.events.orders.OrderDetails;

import org.springframework.beans.BeanUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class Order {

  private final Date dateTimeOfSubmission;
  private List<MenuItem> menuItems;
  private final UUID key;
  private Customer customer;

  private OrderStatus status;
  private List<OrderStatus> statusHistory;

  private Date expectedCompletionTime;
  private BigDecimal totalCost;

  //currently 5 minutes
  private final static long ACCEPT_CANCEL_TIME = 1000 * 60 * 5;

  public Order(final Date dateTimeOfSubmission) {
    this.key = UUID.randomUUID();
    this.dateTimeOfSubmission = dateTimeOfSubmission;
    statusHistory = new ArrayList<OrderStatus>();
  }

  public Order(final UUID key,final Date dateTimeOfSubmission) {
    this.key = key;
    this.dateTimeOfSubmission = dateTimeOfSubmission;
    statusHistory = new ArrayList<OrderStatus>();
  }

  public Date getExpectedCompletionTime() {
    return expectedCompletionTime;
  }

  public void setExpectedCompletionTime(Date expectedCompletionTime) {
    this.expectedCompletionTime = expectedCompletionTime;
  }

  public BigDecimal getTotalCost() {
    return totalCost;
  }

  public void setTotalCost(BigDecimal totalCost) {
    this.totalCost = totalCost;
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

  public List<MenuItem> getMenuItems() {
    return menuItems;
  }

  public void setMenuItems(List<MenuItem> menuItems) {
    this.menuItems = menuItems;
  }

  public boolean canBeDeleted() {
    //accept cancellation if within 5 minutes of placing.
    return System.currentTimeMillis() - dateTimeOfSubmission.getTime() < ACCEPT_CANCEL_TIME;
  }

  public Order withMenuItems(List<MenuItem> menuItems) {
    this.menuItems = menuItems;
    return this;
  }

  public OrderDetails toOrderDetails() {
    OrderDetails details = new OrderDetails();

    details.setDateTimeOfSubmission(getDateTimeOfSubmission());
    details.setKey(getKey());

    return details;
  }

  public static Order fromOrderDetails(OrderDetails orderDetails) {
    Order order = new Order(orderDetails.getKey(),orderDetails.getDateTimeOfSubmission());

    BeanUtils.copyProperties(orderDetails, order);

    return order;
  }
}

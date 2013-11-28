/**
 * @Probject Name: spring
 * @Path: net.shopin.domain.Order.java
 * @Create By kongm
 * @Create In 2013-11-28 下午4:00:16
 * TODO
 */
package net.shopin.domain;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;

import net.shopin.events.orders.OrderDetails;

/**
 * @Class Name Order
 * @Author kongm
 * @Create In 2013-11-28
 */
public class Order {

	private final Date dateTimeOfSubmission;

	private Map<String, Integer> orderItems;

	private final UUID key;

	private Customer customer;

	private OrderStatus status;
	private List<OrderStatus> statusHistory;

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

	public boolean canBeDeleted() {
		return true;
	}
	
	public OrderDetails toOrderDetails(){
		OrderDetails details = new OrderDetails();
		BeanUtils.copyProperties(this, details);
		return details;
	}
	
	public static Order fromOrderDetails(OrderDetails details){
		Order order = new Order(details.getDateTimeOfSubmission());
		BeanUtils.copyProperties(details, order);
		return order;
	}
	

}

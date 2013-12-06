/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.domain.JPAOrder.java
 * @Create By kongm
 * @Create In 2013-12-5 上午10:17:16
 * TODO
 */
package net.shopin.persistence.domain;

import java.util.Collections;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.MapKeyColumn;
import javax.persistence.Transient;


import net.shopin.domain.OrderStatus;
import net.shopin.events.orders.OrderDetails;

/**
 * @Class Name JPAOrder
 * @Author kongm
 * @Create In 2013-12-5
 */
@Entity(name = "NOODLE_ORDERS")
public class JPAOrder {
	
	@Column(name = "SUBMISSION_DATETIME")
	private Date dateTimeOfSubmission;
	
	@ElementCollection(fetch = FetchType.EAGER,targetClass = java.lang.Integer.class)
	@JoinTable(name = "ORDER_ORDER_ITEMS",joinColumns = @JoinColumn(name = "ID"))
	@MapKeyColumn(name = "MENU_ID")
	@Column(name = "VALUE")
	private Map<String,Integer> orderItems;
	
	@Transient
	private OrderStatus orderStatus;

	@Id
	@Column(name = "ORDER_ID")
	private String id;

	public Date getDateTimeOfSubmission() {
		return dateTimeOfSubmission;
	}

	public void setDateTimeOfSubmission(Date dateTimeOfSubmission) {
		this.dateTimeOfSubmission = dateTimeOfSubmission;
	}

	public Map<String, Integer> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Map<String, Integer> orderItems) {
		if(orderItems == null){
			this.orderItems = Collections.emptyMap();
		}else{
			this.orderItems = Collections.unmodifiableMap(orderItems);
		}
	}

	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public OrderDetails toOrderDetails(){
		OrderDetails details = new OrderDetails();
		details.setKey(UUID.fromString(id));
		details.setDateTimeOfSubmission(this.dateTimeOfSubmission);
		details.setOrderItems(this.orderItems);
		return details;
	}
	
	public static JPAOrder fromOrderDetails(OrderDetails details){
		JPAOrder order = new JPAOrder();
		order.id = details.getKey().toString();
		order.dateTimeOfSubmission = details.getDateTimeOfSubmission();
		order.orderItems = details.getOrderItems();
		return order;
	}

	
	@Override
	public String toString() {
		return String
				.format("JPAOrder [dateTimeOfSubmission=%s, orderItems=%s, orderStatus=%s, id=%s]",
						dateTimeOfSubmission, orderItems, orderStatus, id);
	}
	
	
	
	
	
	
	
}

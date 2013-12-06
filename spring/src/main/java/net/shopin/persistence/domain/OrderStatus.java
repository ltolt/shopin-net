/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.domain.OrderStatus.java
 * @Create By kongm
 * @Create In 2013-12-6 下午3:43:51
 * TODO
 */
package net.shopin.persistence.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import org.springframework.data.annotation.Id;
import org.springframework.data.gemfire.mapping.Region;

/**
 * @Class Name OrderStatus
 * @Author kongm
 * @Create In 2013-12-6
 */
//{!begin gemfire}
@Region("YummyNoodleOrder")
public class OrderStatus implements Serializable{

	private UUID orderId;
	@Id
	private UUID id;
	private Date statusDate;
	private String status;
	
	public OrderStatus(UUID orderId, UUID id, Date statusDate, String status) {
		this.orderId = orderId;
		this.id = id;
		this.statusDate = statusDate;
		this.status = status;
	}

	public UUID getOrderId() {
		return orderId;
	}

	public void setOrderId(UUID orderId) {
		this.orderId = orderId;
	}

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public Date getStatusDate() {
		return statusDate;
	}

	public void setStatusDate(Date statusDate) {
		this.statusDate = statusDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return String.format(
				"OrderStatus [orderId=%s, id=%s, statusDate=%s, status=%s]",
				orderId, id, statusDate, status);
	}
	
	
	
	
	
}

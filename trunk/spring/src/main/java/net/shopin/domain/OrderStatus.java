/**
 * @Probject Name: spring
 * @Path: net.shopin.domain.OrderStatus.java
 * @Create By kongm
 * @Create In 2013-11-28 下午4:08:06
 * TODO
 */
package net.shopin.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * @Class Name OrderStatus
 * @Author kongm
 * @Create In 2013-11-28
 */
public class OrderStatus implements Serializable{
	
	private Date statusDate;
	private String status;
	
	public OrderStatus(final Date statusDate,final String status) {
		this.statusDate = statusDate;
		this.status = status;
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
	
	
	
	

}

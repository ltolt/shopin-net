/**
 * @Probject Name: spring
 * @Path: net.shopin.events.orders.OrderStatusDetails.java
 * @Create By kongm
 * @Create In 2013-11-29 下午2:21:04
 * TODO
 */
package net.shopin.events.orders;

import java.util.Date;

/**
 * @Class Name OrderStatusDetails
 * @Author kongm
 * @Create In 2013-11-29
 */
public class OrderStatusDetails {
	  private Date statusDate;
	  private String status;

	  public OrderStatusDetails(Date statusDate, String status) {
	    this.status = status;
	    this.statusDate = statusDate;
	  }

	  public Date getStatusDate() {
	    return statusDate;
	  }

	  public String getStatus() {
	    return status;
	  }
}

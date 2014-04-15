/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.condProBestDetail.java
 * @Create By shiying
 * @Create In 2013-5-13 上午9:59:36
 * TODO
 */
package net.shopin.back.entity.po;

import com.framework.AbstractPOEntity;

/**
 * @Class Name ProBestDetail
 * @Author shiying
 * @Create In 2013-5-13
 */
public class ProBestDetail extends AbstractPOEntity{
	
	private  Integer  productListSid ; 
	private  Integer pageLayoutSid;
	private  Integer orderNumber;
	
	
	
	public Integer getProductListSid() {
		return productListSid;
	}
	public void setProductListSid(Integer productListSid) {
		this.productListSid = productListSid;
	}
	public Integer getPageLayoutSid() {
		return pageLayoutSid;
	}
	public void setPageLayoutSid(Integer pageLayoutSid) {
		this.pageLayoutSid = pageLayoutSid;
	}
	public Integer getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}
	
	
	
}

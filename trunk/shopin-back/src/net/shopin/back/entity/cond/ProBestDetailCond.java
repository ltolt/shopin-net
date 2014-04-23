/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.condProBestDetailCond.java
 * @Create By shiying
 * @Create In 2013-5-13 上午10:08:41
 * TODO
 */
package net.shopin.back.entity.cond;

import net.shopin.back.entity.po.ProBestDetail;

import com.framework.AbstractCondtion;
import com.utils.JsonUtil;

/**
 * @Class Name ProBestDetailCond
 * @Author shiying
 * @Create In 2013-5-13
 */
public class ProBestDetailCond extends AbstractCondtion{
	
	private  Integer  productListSid ; 
	private  Integer pageLayoutSid;
	private  Integer orderNumber;
	
	private ProBestDetail proBestDetail;
	private String proBestDetailJson;
	
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
	public ProBestDetail getProBestDetail() {
		return proBestDetail;
	}
	
	
	public void setProBestDetail(ProBestDetail proBestDetail) {
		if(proBestDetail!=null){
		this.proBestDetail = proBestDetail;
		}
	}
	
	public String getProBestDetailJson() {
		return proBestDetailJson;
	}
	public void setProBestDetailJson(String proBestDetailJson) {
		this.proBestDetailJson = proBestDetailJson;
		if(proBestDetailJson!=null&&!"".equals(proBestDetailJson)){
			this.proBestDetail
			=(ProBestDetail)JsonUtil.Json2Object(proBestDetailJson, ProBestDetail.class);
		}
	}
	

}

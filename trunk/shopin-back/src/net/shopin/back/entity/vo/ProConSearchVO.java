/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.voProConSearchVO.java
 * @Create By k
 * @Create In 2013-5-9 下午2:59:40
 * TODO
 */
package net.shopin.back.entity.vo;

import java.util.Date;

import com.framework.AbstractVOEntity;

/**
 * @Class Name ProConSearchVO
 * @Author k
 * @Create In 2013-5-9
 */
public class ProConSearchVO  extends AbstractVOEntity {

private String saleCodeSid;
	
	private String proSku;
	
	private Double offMin;
	
	private Double offMax;
	
	private Double priceMin;
	
	private Double priceMax;
	
	private Date proBeginTime;
	
	private Date proEndTime;
   
    private Integer brandSid;

    private Integer productClassSid;
	
    private Integer proStockNum;
    
    private Integer pageLayoutSid;

	public String getSaleCodeSid() {
		return saleCodeSid;
	}

	public void setSaleCodeSid(String saleCodeSid) {
		this.saleCodeSid = saleCodeSid;
	}

	public String getProSku() {
		return proSku;
	}

	public void setProSku(String proSku) {
		this.proSku = proSku;
	}

	public Double getOffMin() {
		return offMin;
	}

	public void setOffMin(Double offMin) {
		this.offMin = offMin;
	}

	public Double getOffMax() {
		return offMax;
	}

	public void setOffMax(Double offMax) {
		this.offMax = offMax;
	}

	public Double getPriceMin() {
		return priceMin;
	}

	public void setPriceMin(Double priceMin) {
		this.priceMin = priceMin;
	}

	public Double getPriceMax() {
		return priceMax;
	}

	public void setPriceMax(Double priceMax) {
		this.priceMax = priceMax;
	}

	public Date getProBeginTime() {
		return proBeginTime;
	}

	public void setProBeginTime(Date proBeginTime) {
		this.proBeginTime = proBeginTime;
	}

	public Date getProEndTime() {
		return proEndTime;
	}

	public void setProEndTime(Date proEndTime) {
		this.proEndTime = proEndTime;
	}

	public Integer getBrandSid() {
		return brandSid;
	}

	public void setBrandSid(Integer brandSid) {
		this.brandSid = brandSid;
	}

	public Integer getProductClassSid() {
		return productClassSid;
	}

	public void setProductClassSid(Integer productClassSid) {
		this.productClassSid = productClassSid;
	}

	public Integer getProStockNum() {
		return proStockNum;
	}

	public void setProStockNum(Integer proStockNum) {
		this.proStockNum = proStockNum;
	}

	public Integer getPageLayoutSid() {
		return pageLayoutSid;
	}

	public void setPageLayoutSid(Integer pageLayoutSid) {
		this.pageLayoutSid = pageLayoutSid;
	}

	@Override
	public String toString() {
		return "ProConSearchVO :{saleCodeSid:'" + saleCodeSid + "', proSku:'"
				+ proSku + "', offMin:'" + offMin + "', offMax:'" + offMax
				+ "', priceMin:'" + priceMin + "', priceMax:'" + priceMax
				+ "', proBeginTime:'" + proBeginTime + "', proEndTime:'"
				+ proEndTime + "', brandSid:'" + brandSid
				+ "', productClassSid:'" + productClassSid + "', proStockNum:'"
				+ proStockNum + "', pageLayoutSid:'" + pageLayoutSid + "}";
	}


	





}

/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.poTRuleDetail.java
 * @Create By shiying
 * @Create In 2013-6-24 下午1:22:50
 * TODO
 */
package net.shopin.back.entity.po;

import java.util.Date;

import com.framework.AbstractPOEntity;

/**
 * @Class Name TRuleDetail
 * @Author shiying
 * @Create In 2013-6-24
 */
public class TRuleDetail extends AbstractPOEntity {
	private Long sid;
	private Long ruleSid;
	private Long brandSid;
	private Long productClassSid;
	private String productClassName;
	private String brandName;
	
	
	private Double offMin;
	private Double offMax;
	private Integer priceMin;
	private Integer priceMax;
	private Integer stockMin;
	private Integer stockMax;
	private Long shopSid;
	private String shopName;
	private String saleCode;
	private Long saleSum;
	private Date priceUpdateTime;
	
	
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
	public Integer getPriceMin() {
		return priceMin;
	}
	public void setPriceMin(Integer priceMin) {
		this.priceMin = priceMin;
	}
	public Integer getPriceMax() {
		return priceMax;
	}
	public void setPriceMax(Integer priceMax) {
		this.priceMax = priceMax;
	}
	public Integer getStockMin() {
		return stockMin;
	}
	public void setStockMin(Integer stockMin) {
		this.stockMin = stockMin;
	}
	public Integer getStockMax() {
		return stockMax;
	}
	public void setStockMax(Integer stockMax) {
		this.stockMax = stockMax;
	}
	public Long getShopSid() {
		return shopSid;
	}
	public void setShopSid(Long shopSid) {
		this.shopSid = shopSid;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getSaleCode() {
		return saleCode;
	}
	public void setSaleCode(String saleCode) {
		this.saleCode = saleCode;
	}
	public Long getSaleSum() {
		return saleSum;
	}
	public void setSaleSum(Long saleSum) {
		this.saleSum = saleSum;
	}
	public Date getPriceUpdateTime() {
		return priceUpdateTime;
	}
	public void setPriceUpdateTime(Date priceUpdateTime) {
		this.priceUpdateTime = priceUpdateTime;
	}
	
	
	public Long getSid() {
		return sid;
	}
	public void setSid(Long sid) {
		this.sid = sid;
	}
	public Long getRuleSid() {
		return ruleSid;
	}
	public void setRuleSid(Long ruleSid) {
		this.ruleSid = ruleSid;
	}
	public Long getBrandSid() {
		return brandSid;
	}
	public void setBrandSid(Long brandSid) {
		this.brandSid = brandSid;
	}
	public Long getProductClassSid() {
		return productClassSid;
	}
	public void setProductClassSid(Long productClassSid) {
		this.productClassSid = productClassSid;
	}
	public String getProductClassName() {
		return productClassName;
	}
	public void setProductClassName(String productClassName) {
		this.productClassName = productClassName;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	
	

}

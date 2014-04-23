/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.viewDetailsVO.java
 * @Create By Administrator
 * @Create In 2013-6-25 下午2:16:17
 * TODO
 */
package net.shopin.wms.util;

import java.io.Serializable;

/**
 * @Class Name DetailsVO
 * @Author Administrator
 * @Create In 2013-6-25
 */
public class DetailsMqlVO implements Serializable{
	private String sid;
	private String ruleSid;
	private String brandSid;
	private String productClassSid;
	private String productClassName;
	private String brandName;
	private String offMin;
	private String offMax;
	private String priceMin;
	private String priceMax;
	private String stockMin;
	private String stockMax;
	private String shopSid;
	private String shopName;
	private String saleCode;
	private String saleSum;
	private String priceUpdateTime;
	
	public String getOffMin() {
		return offMin;
	}
	public void setOffMin(String offMin) {
		this.offMin = offMin;
	}
	public String getOffMax() {
		return offMax;
	}
	public void setOffMax(String offMax) {
		this.offMax = offMax;
	}
	public String getPriceMin() {
		return priceMin;
	}
	public void setPriceMin(String priceMin) {
		this.priceMin = priceMin;
	}
	public String getPriceMax() {
		return priceMax;
	}
	public void setPriceMax(String priceMax) {
		this.priceMax = priceMax;
	}
	public String getStockMin() {
		return stockMin;
	}
	public void setStockMin(String stockMin) {
		this.stockMin = stockMin;
	}
	public String getStockMax() {
		return stockMax;
	}
	public void setStockMax(String stockMax) {
		this.stockMax = stockMax;
	}
	public String getShopSid() {
		return shopSid;
	}
	public void setShopSid(String shopSid) {
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
	public String getSaleSum() {
		return saleSum;
	}
	public void setSaleSum(String saleSum) {
		this.saleSum = saleSum;
	}
	public String getPriceUpdateTime() {
		return priceUpdateTime;
	}
	public void setPriceUpdateTime(String priceUpdateTime) {
		this.priceUpdateTime = priceUpdateTime;
	}
	
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getRuleSid() {
		return ruleSid;
	}
	public void setRuleSid(String ruleSid) {
		this.ruleSid = ruleSid;
	}
	public String getBrandSid() {
		return brandSid;
	}
	public void setBrandSid(String brandSid) {
		this.brandSid = brandSid;
	}
	public String getProductClassSid() {
		return productClassSid;
	}
	public void setProductClassSid(String productClassSid) {
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
	@Override
	public String toString() {
		return "DetailsVO [sid=" + sid + ", ruleSid=" + ruleSid + ", brandSid="
				+ brandSid + ", productClassSid=" + productClassSid
				+ ", productClassName=" + productClassName + ", brandName="
				+ brandName + ", offMin=" + offMin + ", offMax=" + offMax
				+ ", priceMin=" + priceMin + ", priceMax=" + priceMax
				+ ", stockMin=" + stockMin + ", stockMax=" + stockMax
				+  ", shopSid="+ shopSid + ", shopName=" + shopName + ", saleCode=" + saleCode
				+ ", saleSum=" + saleSum + ", priceUpdateTime="
				+ priceUpdateTime + "]";
	}

	
	
	
	

}

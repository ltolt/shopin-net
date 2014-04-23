/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.voTRuleDetailVO.java
 * @Create By shiying
 * @Create In 2013-6-24 下午1:27:28
 * TODO
 */
package net.shopin.back.entity.vo;

import java.util.Date;

import com.framework.AbstractVOEntity;

/**
 * @Class Name TRuleDetailVO
 * @Author shiying
 * @Create In 2013-6-24
 */
public class TRuleDetailVO extends AbstractVOEntity{
	
	private Integer sid;
	private Long ruleSid;
	private Long brandSid;
	private Long productClassSid;
	private String productClassName;
	private String brandName;
	private String offMin;
	private String offMax;
	private Integer priceMin;
	private Integer priceMax;
	private Integer stockMin;
	private Integer stockMax;
	private Long shopSid;
	private String shopName;
	private String saleCode;
	private Long saleSum;
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
	public String getPriceUpdateTime() {
		return priceUpdateTime;
	}
	public void setPriceUpdateTime(String priceUpdateTime) {
		this.priceUpdateTime = priceUpdateTime;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
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
	@Override
	public String toString() {
		return "TRuleDetailVO [sid=" + sid + ", ruleSid=" + ruleSid
				+ ", brandSid=" + brandSid + ", productClassSid="
				+ productClassSid + ", productClassName=" + productClassName
				+ ", brandName=" + brandName + ", offMin=" + offMin
				+ ", offMax=" + offMax + ", priceMin=" + priceMin
				+ ", priceMax=" + priceMax + ", stockMin=" + stockMin
				+ ", stockMax=" + stockMax + ", shopSid=" + shopSid
				+ ", shopName=" + shopName + ", saleCode=" + saleCode
				+ ", saleSum=" + saleSum + ", priceUpdateTime="
				+ priceUpdateTime + "]";
	}
	
	
	

}

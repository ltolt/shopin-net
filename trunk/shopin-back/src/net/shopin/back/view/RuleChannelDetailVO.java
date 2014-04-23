/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.viewRuleChannelVO.java
 * @Create By shiying
 * @Create In 2013-6-19 上午9:41:39
 * TODO
 */
package net.shopin.back.view;

import java.util.Date;
import java.util.List;

import net.shopin.back.entity.vo.TRuleNewChannelVO;

/**
 * @Class Name RuleChannelVO
 * @Author shiying
 * @Create In 2013-6-19
 */
public class RuleChannelDetailVO {
	
	private String sid;
	private String ruleName;
	private String activeBeginTime;
	private String activeEndTime;
	private String brandSid;
	private String brandName;
	private String offMin;
	private String offMax;
	private String priceMin;
	private String priceMax;
	private String stockMin;
	private String stockMax;
	private String productClassSid;
	private String productClassName;
	private String shopSid;
	private String shopName;
	private String saleCode;
	private String saleSum;
	private String createUser;
	private String createTime;
	private String updateUser;
	private String updateTime;
	private String priceUpdateTime;
	private String channelSid;
	private String channelName;
	private String detailSid;
		
	
	public String getDetailSid() {
		return detailSid;
	}
	public void setDetailSid(String detailSid) {
		this.detailSid = detailSid;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getChannelSid() {
		return channelSid;
	}
	public void setChannelSid(String channelSid) {
		this.channelSid = channelSid;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getRuleName() {
		return ruleName;
	}
	public void setRuleName(String ruleName) {
		this.ruleName = ruleName;
	}
	public String getActiveBeginTime() {
		return activeBeginTime;
	}
	public void setActiveBeginTime(String activeBeginTime) {
		this.activeBeginTime = activeBeginTime;
	}
	public String getActiveEndTime() {
		return activeEndTime;
	}
	public void setActiveEndTime(String activeEndTime) {
		this.activeEndTime = activeEndTime;
	}
	public String getBrandSid() {
		return brandSid;
	}
	public void setBrandSid(String brandSid) {
		this.brandSid = brandSid;
	}
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
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getPriceUpdateTime() {
		return priceUpdateTime;
	}
	public void setPriceUpdateTime(String priceUpdateTime) {
		this.priceUpdateTime = priceUpdateTime;
	}
	@Override
	public String toString() {
		return "RuleChannelDetailVO [sid=" + sid + ", ruleName=" + ruleName
				+ ", activeBeginTime=" + activeBeginTime + ", activeEndTime="
				+ activeEndTime + ", brandSid=" + brandSid + ", brandName="
				+ brandName + ", offMin=" + offMin + ", offMax=" + offMax
				+ ", priceMin=" + priceMin + ", priceMax=" + priceMax
				+ ", stockMin=" + stockMin + ", stockMax=" + stockMax
				+ ", productClassSid=" + productClassSid
				+ ", productClassName=" + productClassName + ", shopSid="
				+ shopSid + ", shopName=" + shopName + ", saleCode=" + saleCode
				+ ", saleSum=" + saleSum + ", createUser=" + createUser
				+ ", createTime=" + createTime + ", updateUser=" + updateUser
				+ ", updateTime=" + updateTime + ", priceUpdateTime="
				+ priceUpdateTime + ", channelSid=" + channelSid
				+ ", channelName=" + channelName + ", detailSid=" + detailSid
				+ "]";
	}

	
	
	
	
	

}

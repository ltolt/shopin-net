/**
 * @Probject Name: business
 * @Path: net.shopin.entity.ProConSearch.java
 * @Create By wangdg
 * @Create In 2013-7-9 下午3:21:18
 * TODO
 */
package net.shopin.entity;

import java.sql.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @Class Name ProConSearch
 * @Author wangdg
 * @Create In 2013-7-9
 */
@Table(name = "PRO_CON_SEARCH")
@Entity
public class ProConSearch {

	private Integer sid;

	@Column(name = "SID")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	private Integer saleCodeSid;

	@Column(name = "SALE_CODE_SID")
	@Basic
	public Integer getSaleCodeSid() {
		return saleCodeSid;
	}

	public void setSaleCodeSid(Integer saleCodeSid) {
		this.saleCodeSid = saleCodeSid;
	}

	private String proSku;

	@Column(name = "PRO_SKU")
	@Basic
	public String getProSku() {
		return proSku;
	}

	public void setProSku(String proSku) {
		this.proSku = proSku;
	}

	private Double offMin;

	@Column(name = "OFF_MIN")
	@Basic
	public Double getOffMin() {
		return offMin;
	}

	public void setOffMin(Double offMin) {
		this.offMin = offMin;
	}

	private Double offMax;

	@Column(name = "OFF_MAX")
	@Basic
	public Double getOffMax() {
		return offMax;
	}

	public void setOffMax(Double offMax) {
		this.offMax = offMax;
	}

	private Double priceMin;

	@Column(name = "PRICE_MIN")
	@Basic
	public Double getPriceMin() {
		return priceMin;
	}

	public void setPriceMin(Double priceMin) {
		this.priceMin = priceMin;
	}

	private Double priceMax;

	@Column(name = "PRICE_MAX")
	@Basic
	public Double getPriceMax() {
		return priceMax;
	}

	public void setPriceMax(Double priceMax) {
		this.priceMax = priceMax;
	}

	private Date proBeginTime;

	@Column(name = "PRO_BEGIN_TIME")
	@Basic
	public Date getProBeginTime() {
		return proBeginTime;
	}

	public void setProBeginTime(Date proBeginTime) {
		this.proBeginTime = proBeginTime;
	}

	private Date proEndTime;

	@Column(name = "PRO_END_TIME")
	@Basic
	public Date getProEndTime() {
		return proEndTime;
	}

	public void setProEndTime(Date proEndTime) {
		this.proEndTime = proEndTime;
	}

	private Integer brandSid;

	@Column(name = "BRAND_SID")
	@Basic
	public Integer getBrandSid() {
		return brandSid;
	}

	public void setBrandSid(Integer brandSid) {
		this.brandSid = brandSid;
	}

	private Integer productClassSid;

	@Column(name = "PRODUCT_CLASS_SID")
	@Basic
	public Integer getProductClassSid() {
		return productClassSid;
	}

	public void setProductClassSid(Integer productClassSid) {
		this.productClassSid = productClassSid;
	}

	private Integer proStockNum;

	@Column(name = "PRO_STOCK_NUM")
	@Basic
	public Integer getProStockNum() {
		return proStockNum;
	}

	public void setProStockNum(Integer proStockNum) {
		this.proStockNum = proStockNum;
	}

	private Integer pageLayoutSid;

	@Column(name = "PAGE_LAYOUT_SID")
	@Basic
	public Integer getPageLayoutSid() {
		return pageLayoutSid;
	}

	public void setPageLayoutSid(Integer pageLayoutSid) {
		this.pageLayoutSid = pageLayoutSid;
	}

}

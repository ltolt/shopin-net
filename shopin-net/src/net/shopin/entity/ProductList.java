package net.shopin.entity;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name = "PRODUCT_LIST")
@Entity
public class ProductList {

	private Integer sid;
	private Integer brandSid;
	private String proSku;
	private String proDesc;
	private Integer proActiveBit;
	private Integer proSelling;
	private Integer proType;
	private String productName;
	private Brand brand;
	private Timestamp proSellingTime;
	private Set<ProDetail> proDetails;
	private Set<ProductClass> productClasses;
	
	
	
	@ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.ALL})
	@JoinTable(name = "PRODUCT_WITH_CLASS",joinColumns = {@JoinColumn(name="PRODUCT_LIST_SID")},inverseJoinColumns = {@JoinColumn(name = "PRODUCT_CLASS_SID")})
	public Set<ProductClass> getProductClasses() {
		return productClasses;
	}
	public void setProductClasses(Set<ProductClass> productClasses) {
		this.productClasses = productClasses;
	}
	@OneToMany(mappedBy = "productList")
	public Set<ProDetail> getProDetails() {
		return proDetails;
	}
	public void setProDetails(Set<ProDetail> proDetails) {
		this.proDetails = proDetails;
	}
	@Column(name = "PRO_SELLING_TIME")
	@Basic
	public Timestamp getProSellingTime() {
		return proSellingTime;
	}
	public void setProSellingTime(Timestamp proSellingTime) {
		this.proSellingTime = proSellingTime;
	}
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BRAND_SID",referencedColumnName = "SID")
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	@Column(name = "SID")
	@Id
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	@Column(name = "BRAND_SID",insertable = false, updatable = false)
	@Basic
	public Integer getBrandSid() {
		return brandSid;
	}
	public void setBrandSid(Integer brandSid) {
		this.brandSid = brandSid;
	}
	@Column(name = "PRO_SKU")
	@Basic
	public String getProSku() {
		return proSku;
	}
	public void setProSku(String proSku) {
		this.proSku = proSku;
	}
	@Column(name = "PRO_DESC")
	@Basic
	public String getProDesc() {
		return proDesc;
	}
	public void setProDesc(String proDesc) {
		this.proDesc = proDesc;
	}
	@Column(name = "PRO_ACTIVE_BIT")
	public Integer getProActiveBit() {
		return proActiveBit;
	}
	public void setProActiveBit(Integer proActiveBit) {
		this.proActiveBit = proActiveBit;
	}
	@Column(name = "PRO_SELLING")
	@Basic
	public Integer getProSelling() {
		return proSelling;
	}
	public void setProSelling(Integer proSelling) {
		this.proSelling = proSelling;
	}
	@Column(name = "PRO_TYPE")
	@Basic
	public Integer getProType() {
		return proType;
	}
	public void setProType(Integer proType) {
		this.proType = proType;
	}
	@Column(name = "PRODUCT_NAME")
	@Basic
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Override
	public String toString() {
		return "ProductList [sid=" + sid + ", brandSid=" + brandSid
				+ ", proSku=" + proSku + ", proDesc=" + proDesc
				+ ", proActiveBit=" + proActiveBit + ", proSelling="
				+ proSelling + ", proType=" + proType + ", productName="
				+ productName  + ", proSellingTime="
				+ proSellingTime ;
	}
	
	
	

	
	
	
	
	
	
	
	
	
}

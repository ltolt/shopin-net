package net.shopin.entity;

import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 品牌表
 * @author Administrator
 *
 */
@Table(name = "BRAND")
@Entity
public class Brand {
	private Integer sid;
	private String brandName;
	private String brandNameSecond;
	
	private Set<ProductList> productLists;
	
	
	
	
	
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "brand")
	public Set<ProductList> getProductLists() {
		return productLists;
	}
	public void setProductLists(Set<ProductList> productLists) {
		this.productLists = productLists;
	}
	@Column(name = "SID")
	@Id
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	@Column(name = "BRAND_NAME")
	@Basic
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	@Column(name = "BRAND_NAME_SECOND")
	@Basic
	public String getBrandNameSecond() {
		return brandNameSecond;
	}
	public void setBrandNameSecond(String brandNameSecond) {
		this.brandNameSecond = brandNameSecond;
	}
	@Override
	public String toString() {
		return "Brand [sid=" + sid + ", brandName=" + brandName
				+ ", brandNameSecond=" + brandNameSecond 
				 + "]";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

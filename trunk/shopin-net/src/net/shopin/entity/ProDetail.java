package net.shopin.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 商品明细表
 * 
 * @author Administrator
 * 
 */
@Table(name = "PRO_DETAIL")
@Entity
public class ProDetail {
	private Integer sid;

	private Integer productSid;

	private Integer proStanSid;

	private Integer proColorSid;

	private String memo;

	private Integer proActiveBit;

	@Column(name = "SID")
	@Id
	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	@Column(name = "PRODUCT_SID",insertable=false,updatable = false)
	@Basic
	public Integer getProductSid() {
		return productSid;
	}

	public void setProductSid(Integer productSid) {
		this.productSid = productSid;
	}

	@Column(name = "PRO_STAN_SID",insertable=false,updatable = false)
	@Basic
	public Integer getProStanSid() {
		return proStanSid;
	}

	public void setProStanSid(Integer proStanSid) {
		this.proStanSid = proStanSid;
	}

	@Column(name = "PRO_COLOR_SID",insertable=false,updatable = false)
	@Basic
	public Integer getProColorSid() {
		return proColorSid;
	}

	public void setProColorSid(Integer proColorSid) {
		this.proColorSid = proColorSid;
	}

	@Column(name = "MEMO")
	@Basic
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Column(name = "PRO_ACTIVE_BIT")
	@Basic
	public Integer getProActiveBit() {
		return proActiveBit;
	}

	public void setProActiveBit(Integer proActiveBit) {
		this.proActiveBit = proActiveBit;
	}

	/**
	 * 导航性 一个明细对应着一个单品 可以从 明细导航到单品
	 */
	private ProductList productList;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PRODUCT_SID", referencedColumnName = "SID")
	public ProductList getProductList() {
		return productList;
	}

	public void setProductList(ProductList productList) {
		this.productList = productList;
	}

	private ProStanDict proStanDict;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PRO_STAN_SID", referencedColumnName = "SID")
	public ProStanDict getProStanDict() {
		return proStanDict;
	}

	public void setProStanDict(ProStanDict proStanDict) {
		this.proStanDict = proStanDict;
	}

	private ProColorDict proColorDict;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PRO_COLOR_SID", referencedColumnName = "SID")
	public ProColorDict getProColorDict() {
		return proColorDict;
	}

	public void setProColorDict(ProColorDict proColorDict) {
		this.proColorDict = proColorDict;
	}

	@Override
	public String toString() {
		return "ProDetail [sid=" + sid + ", productSid=" + productSid
				+ ", proStanSid=" + proStanSid + ", proColorSid=" + proColorSid
				+ ", memo=" + memo + ", proActiveBit=" + proActiveBit
				+ ", proStanDict="
				+ proStanDict + ", proColorDict=" + proColorDict + "]";
	}

	
}

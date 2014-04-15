/**
 * @Probject Name: business
 * @Path: net.shopin.entity.NavBrand.java
 * @Create By jingpeng
 * @Create In 2013-7-22 上午11:36:16
 * TODO
 */
package net.shopin.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @Class Name NavBrand
 * @Author jingpeng
 * @Create In 2013-7-22
 */
@Table(name = "NAV_BRAND")
@Entity
public class NavBrand {
	private Long sid;
	private Long brandSid;
	private Long navSid;
	private String brandPic;
	private String brandName;
	private String brandLink;
	
	@Column(name = "SID")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getSid() {
		return sid;
	}
	public void setSid(Long sid) {
		this.sid = sid;
	}
	
	@Column(name = "BRAND_SID")
	@Basic
	public Long getBrandSid() {
		return brandSid;
	}
	public void setBrandSid(Long brandSid) {
		this.brandSid = brandSid;
	}
	
	@Column(name = "NAV_SID", insertable = false, updatable = false)
	@Basic
	public Long getNavSid() {
		return navSid;
	}
	public void setNavSid(Long navSid) {
		this.navSid = navSid;
	}
	
	@Column(name = "BRAND_PIC")
	@Basic
	public String getBrandPic() {
		return brandPic;
	}
	public void setBrandPic(String brandPic) {
		this.brandPic = brandPic;
	}
	
	@Column(name = "BRAND_NAME")
	@Basic
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	@Column(name="BRAND_LINK")
	@Basic
	public String getBrandLink() {
	    return brandLink;
	}
	public void setBrandLink(String brandLink) {
	    this.brandLink = brandLink;
	}
	private Navigation navigation;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NAV_SID", referencedColumnName = "SID")
	public Navigation getNavigation() {
		return navigation;
	}
	public void setNavigation(Navigation navigation) {
		this.navigation = navigation;
	}
	
}

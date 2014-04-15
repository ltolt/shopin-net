/**
 * @Probject Name: business
 * @Path: net.shopin.entity.PageLayoutBrand.java
 * @Create By wangdg
 * @Create In 2013-7-9 上午10:28:27
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
 * @Class Name PageLayoutBrand
 * @Author wangdg
 * @Create In 2013-7-9
 */
@Table(name = "PAGE_LAYOUT_BRAND")
@Entity
public class PageLayoutBrand {

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

	private Integer brandSid;

	@Column(name = "BRAND_SID", insertable = false, updatable = false)
	@Basic
	public Integer getBrandSid() {
		return brandSid;
	}

	public void setBrandSid(Integer brandSid) {
		this.brandSid = brandSid;
	}

	private Integer pageLayoutSid;

	@Column(name = "PAGE_LAYOUT_SID", insertable = false, updatable = false)
	@Basic
	public Integer getPageLayoutSid() {
		return pageLayoutSid;
	}

	public void setPageLayoutSid(Integer pageLayoutSid) {
		this.pageLayoutSid = pageLayoutSid;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		PageLayoutBrand that = (PageLayoutBrand) o;

		if (brandSid != that.brandSid)
			return false;
		if (pageLayoutSid != that.pageLayoutSid)
			return false;
		if (sid != that.sid)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = sid;
		result = 31 * result + brandSid;
		result = 31 * result + pageLayoutSid;
		return result;
	}
	
	private PageLayout pageLayout;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PAGE_LAYOUT_SID", referencedColumnName = "SID")
	public PageLayout getPageLayout() {
		return pageLayout;
	}

	public void setPageLayout(PageLayout pageLayout) {
		this.pageLayout = pageLayout;
	}
	
	private Brand brand;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BRAND_SID", referencedColumnName = "SId")
	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}
}

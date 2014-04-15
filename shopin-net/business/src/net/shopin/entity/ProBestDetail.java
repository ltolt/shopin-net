/**
 * @Probject Name: business
 * @Path: net.shopin.entity.ProBestDetail.java
 * @Create By wangdg
 * @Create In 2013-7-9 上午10:45:09
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
 * @Class Name ProBestDetail
 * @Author wangdg
 * @Create In 2013-7-9
 */
@Table(name = "PRO_BEST_DETAIL")
@Entity
public class ProBestDetail {

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

	private Integer productListSid;

	@Column(name = "PRODUCT_LIST_SID")
	@Basic
	public Integer getProductListSid() {
		return productListSid;
	}

	public void setProductListSid(Integer productListSid) {
		this.productListSid = productListSid;
	}

	private Integer orderNumber;

	@Column(name = "ORDER_NUMBER", insertable = true, updatable = true)
	@Basic
	public Integer getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
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
		if (this == o)	return true;
		if (o == null || getClass() != o.getClass())return false;

		ProBestDetail that = (ProBestDetail) o;

		if (pageLayoutSid != that.pageLayoutSid)return false;
		if (productListSid != that.productListSid)return false;
		if (sid != that.sid)return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = sid;
		result = 31 * result + productListSid;
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

}

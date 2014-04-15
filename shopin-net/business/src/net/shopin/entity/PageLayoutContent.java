/**
 * @Probject Name: business
 * @Path: net.shopin.entity.PageLayoutContent.java
 * @Create By wangdg
 * @Create In 2013-7-9 上午10:32:56
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
 * @Class Name PageLayoutContent
 * @Author wangdg
 * @Create In 2013-7-9
 */
@Table(name = "PAGE_LAYOUT_CONTENT")
@Entity
public class PageLayoutContent {

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

	private Integer pageLayoutSid;

	@Column(name = "PAGE_LAYOUT_SID", insertable = false, updatable = false)
	@Basic
	public Integer getPageLayoutSid() {
		return pageLayoutSid;
	}

	public void setPageLayoutSid(Integer pageLayoutSid) {
		this.pageLayoutSid = pageLayoutSid;
	}

	private String mainTitle;

	@Column(name = "MAIN_TITLE")
	@Basic
	public String getMainTitle() {
		return mainTitle;
	}

	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}

	private String subTitle;

	@Column(name = "SUB_TITLE")
	@Basic
	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	private String pict;

	@Column(name = "PICT")
	@Basic
	public String getPict() {
		return pict;
	}

	public void setPict(String pict) {
		this.pict = pict;
	}

	private String link;

	@Column(name = "LINK")
	@Basic
	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	private String seq;

	@Column(name = "SEQ")
	@Basic
	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		PageLayoutContent that = (PageLayoutContent) o;

		if (pageLayoutSid != that.pageLayoutSid)return false;
		if (sid != that.sid)return false;
		if (link != null ? !link.equals(that.link) : that.link != null)	return false;
		if (mainTitle != null ? !mainTitle.equals(that.mainTitle) : that.mainTitle != null)	return false;
		if (pict != null ? !pict.equals(that.pict) : that.pict != null)	return false;
		if (seq != null ? !seq.equals(that.seq) : that.seq != null)	return false;
		if (subTitle != null ? !subTitle.equals(that.subTitle) : that.subTitle != null)	return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = sid;
		result = 31 * result + pageLayoutSid;
		result = 31 * result + (mainTitle != null ? mainTitle.hashCode() : 0);
		result = 31 * result + (subTitle != null ? subTitle.hashCode() : 0);
		result = 31 * result + (pict != null ? pict.hashCode() : 0);
		result = 31 * result + (link != null ? link.hashCode() : 0);
		result = 31 * result + (seq != null ? seq.hashCode() : 0);
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

/**
 * @Probject Name: business
 * @Path: net.shopin.entity.PageLayout.java
 * @Create By wangdg
 * @Create In 2013-7-9 上午10:20:15
 * TODO
 */
package net.shopin.entity;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

/**
 * @Class Name PageLayout
 * @Author wangdg
 * @Create In 2013-7-9
 */
@Table(name = "PAGE_LAYOUT")
@Entity
public class PageLayout {

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

	private Integer channelSid;

	@Column(name = "CHANNEL_SID")
	@Basic
	public Integer getChannelSid() {
		return channelSid;
	}

	public void setChannelSid(Integer channelSid) {
		this.channelSid = channelSid;
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

	private Integer proLinkType;

	@Column(name = "PRO_LINK_TYPE")
	@Basic
	public Integer getProLinkType() {
		return proLinkType;
	}

	public void setProLinkType(Integer proLinkType) {
		this.proLinkType = proLinkType;
	}

	private Integer nodeLevel;

	@Column(name = "NODE_LEVEL")
	@Basic
	public Integer getNodeLevel() {
		return nodeLevel;
	}

	public void setNodeLevel(Integer nodeLevel) {
		this.nodeLevel = nodeLevel;
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

	private Integer pageLayoutTemplateSid;

	@Column(name = "PAGE_LAYOUT_TEMPLATE_SID", insertable = false, updatable = false)
	@Basic
	public Integer getPageLayoutTemplateSid() {
		return pageLayoutTemplateSid;
	}

	public void setPageLayoutTemplateSid(Integer pageLayoutTemplateSid) {
		this.pageLayoutTemplateSid = pageLayoutTemplateSid;
	}

	private String title;

	@Column(name = "TITLE")
	@Basic
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	private String titleLink;

	@Column(name = "TITLE_LINK")
	@Basic
	public String getTitleLink() {
		return titleLink;
	}

	public void setTitleLink(String titleLink) {
		this.titleLink = titleLink;
	}

	private Integer pageType;

	@Column(name = "PAGE_TYPE")
	@Basic
	public Integer getPageType() {
		return pageType;
	}

	public void setPageType(Integer pageType) {
		this.pageType = pageType;
	}

	private Timestamp startTime;

	@Column(name = "START_TIME")
	@Basic
	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	private Timestamp endTime;

	@Column(name = "END_TIME")
	@Basic
	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		PageLayout that = (PageLayout) o;

		if (pageLayoutSid != that.pageLayoutSid)
			return false;
		if (pageLayoutTemplateSid != that.pageLayoutTemplateSid)
			return false;
		if (pageType != that.pageType)
			return false;
		if (sid != that.sid)
			return false;
		if (proLinkType != null ? !proLinkType.equals(that.proLinkType)
				: that.proLinkType != null)
			return false;
		if (seq != null ? !seq.equals(that.seq) : that.seq != null)
			return false;
		if (title != null ? !title.equals(that.title) : that.title != null)
			return false;
		if (titleLink != null ? !titleLink.equals(that.titleLink)
				: that.titleLink != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = sid;
		result = 31 * result
				+ (pageLayoutSid != null ? pageLayoutSid.hashCode() : 0);
		result = 31 * result
				+ (proLinkType != null ? proLinkType.hashCode() : 0);
		result = 31 * result + (seq != null ? seq.hashCode() : 0);
		result = 31
				* result
				+ (pageLayoutTemplateSid != null ? pageLayoutTemplateSid
						.hashCode() : 0);
		result = 31 * result + (title != null ? title.hashCode() : 0);
		result = 31 * result + (titleLink != null ? titleLink.hashCode() : 0);
		result = 31 * result + (pageType != null ? pageType.hashCode() : 0);
		return result;
	}

	@Override
	public String toString() {
		return "PageLayout{" + "sid=" + sid + ", pageLayoutSid="
				+ pageLayoutSid + ", proLinkType=" + proLinkType + ", seq='"
				+ seq + '\'' + ", pageLayoutTemplateSid="
				+ pageLayoutTemplateSid + ", title='" + title + '\''
				+ ", titleLink='" + titleLink + '\'' + ", pageType=" + pageType
				+ ", pageLayoutBrands=" + pageLayoutBrands
				+ ", pageLayoutContents=" + pageLayoutContents
				+ ", proBestDetails=" + proBestDetails + ", childPageLayouts="
				+ childPageLayouts + '}';
	}

	private Set<PageLayoutBrand> pageLayoutBrands;

	@OneToMany(mappedBy = "pageLayout")
	@OrderBy(" sid asc")
	public Set<PageLayoutBrand> getPageLayoutBrands() {
		return pageLayoutBrands;
	}

	public void setPageLayoutBrands(Set<PageLayoutBrand> pageLayoutBrands) {
		this.pageLayoutBrands = pageLayoutBrands;
	}

	private Set<PageLayoutContent> pageLayoutContents;

	@OneToMany(mappedBy = "pageLayout")
	@OrderBy(" sid asc")
	public Set<PageLayoutContent> getPageLayoutContents() {
		return pageLayoutContents;
	}

	public void setPageLayoutContents(Set<PageLayoutContent> pageLayoutContents) {
		this.pageLayoutContents = pageLayoutContents;
	}

	private Set<ProBestDetail> proBestDetails;

	@OneToMany(mappedBy = "pageLayout")
	@OrderBy(" sid asc")
	public Set<ProBestDetail> getProBestDetails() {
		return proBestDetails;
	}

	public void setProBestDetails(Set<ProBestDetail> proBestDetails) {
		this.proBestDetails = proBestDetails;
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

	private Set<PageLayout> childPageLayouts;

	@OneToMany(mappedBy = "pageLayout")
	@OrderBy(" seq asc")
	public Set<PageLayout> getChildPageLayouts() {
		return childPageLayouts;
	}

	public void setChildPageLayouts(Set<PageLayout> childPageLayouts) {
		this.childPageLayouts = childPageLayouts;
	}

	private PageLayoutTemplate pageLayoutTemplate;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PAGE_LAYOUT_TEMPLATE_SID", referencedColumnName = "SID")
	public PageLayoutTemplate getPageLayoutTemplate() {
		return pageLayoutTemplate;
	}

	public void setPageLayoutTemplate(PageLayoutTemplate pageLayoutTemplate) {
		this.pageLayoutTemplate = pageLayoutTemplate;
	}

	private Set<ShopChannels> shopChannels;

	@OneToMany(mappedBy = "pageLayout")
	public Set<ShopChannels> getShopChannels() {
		return shopChannels;
	}

	public void setShopChannels(Set<ShopChannels> shopChannels) {
		this.shopChannels = shopChannels;
	}

	private Set<Promotions> promotions;

	@OneToMany(mappedBy = "pageLayout")
	public Set<Promotions> getPromotions() {
		return promotions;
	}

	public void setPromotions(Set<Promotions> promotions) {
		this.promotions = promotions;
	}
}

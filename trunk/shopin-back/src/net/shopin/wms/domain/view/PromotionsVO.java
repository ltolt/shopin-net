/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.util.PromotionsKey.java
 * @Create By wangdg
 * @Create In 2013-8-30 下午4:46:37
 * TODO
 */
package net.shopin.wms.domain.view;


import com.framework.page.Page;



/**
 * @Class Name PromotionsKey
 * @Author wangdg
 * @Create In 2013-8-30
 */
public class PromotionsVO extends Page{

	private Integer proSid;
	private String title;
	private String startTime;
	private String endTime;

	private Integer proStatus;
	private Integer promotionTypeSid;
	private Integer pageLayoutSid;
	
	
	public Integer getProSid() {
		return proSid;
	}
	public void setProSid(Integer proSid) {
		this.proSid = proSid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getProStatus() {
		return proStatus;
	}
	public void setProStatus(Integer proStatus) {
		this.proStatus = proStatus;
	}
	public Integer getPageLayoutSid() {
		return pageLayoutSid;
	}
	public void setPageLayoutSid(Integer pageLayoutSid) {
		this.pageLayoutSid = pageLayoutSid;
	}
	public Integer getPromotionTypeSid() {
		return promotionTypeSid;
	}
	public void setPromotionTypeSid(Integer promotionTypeSid) {
		this.promotionTypeSid = promotionTypeSid;
	}
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "PromotionsVO [proSid=" + proSid + ", title=" + title
				+ ", startTime=" + startTime + ", endTime=" + endTime
				+ ", proStatus=" + proStatus + ", promotionTypeSid="
				+ promotionTypeSid + ", pageLayoutSid=" + pageLayoutSid
				+ ", getPageSize()=" + getPageSize() + ", getCurrentPage()="
				+ getCurrentPage() + ", getTotalRecords()=" + getTotalRecords()
				+ ", getTotalPages()=" + getTotalPages()
				+ ", getStartRecords()=" + getStartRecords()
				+ ", getEndRecords()=" + getEndRecords() + ", getStart()="
				+ getStart() + ", getLimit()=" + getLimit()
				+ super.toString() + "]";
	}
	

	
	
}

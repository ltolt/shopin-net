/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.voPageLayoutVO.java
 * @Create By shiying
 * @Create In 2013-5-9 下午4:56:48
 * TODO
 */
package net.shopin.back.entity.vo;

import java.util.Date;

import com.framework.AbstractVOEntity;

/**
 * desc : 页面表 实体VO对象
 * @Class Name PageLayoutVO
 * @Author shiying
 * @Create In 2013-5-9
 */
public class PageLayoutVO extends AbstractVOEntity{
	
	private  Integer  pageLayoutSid; 
	 
	 private Integer proLinkType;
	 
	 private Integer pageType;
	 private Integer channelSid;
	 private Integer nodeLevel;
	 
	 private String seq;
	 
	 private Integer pageLayoutTemplateSid; 
	 
	 private String title;
	 
	 private String titleLink;
	 
	 private Date startTime;
	 
	 private Date endTime;

	public Integer getpageLayoutSid() {
		return pageLayoutSid;
	}

	public void setpageLayoutSid(Integer pageLayoutSid) {
		this.pageLayoutSid= pageLayoutSid;
	}

	public Integer getproLinkType() {
		return proLinkType;
	}

	public void setproLinkType(Integer proLinkType) {
		this.proLinkType = proLinkType;
	}

	public Integer getPageType() {
		return pageType;
	}

	public void setPageType(Integer pageType) {
		this.pageType = pageType;
	}

	public Integer getChannelSid() {
		return channelSid;
	}

	public void setChannelSid(Integer channelSid) {
		this.channelSid = channelSid;
	}

	public Integer getNodeLevel() {
		return nodeLevel;
	}

	public void setNodeLevel(Integer nodeLevel) {
		this.nodeLevel = nodeLevel;
	}

	

	public Integer getpageLayoutTemplateSid() {
		return pageLayoutTemplateSid;
	}

	public void setpageLayoutTemplateSid(Integer pageLayoutTemplateSid) {
		this.pageLayoutTemplateSid = pageLayoutTemplateSid;
	}

	
	public String getTitleLink() {
		return titleLink;
	}

	public void setTitleLink(String titleLink) {
		this.titleLink = titleLink;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "PageLayoutVO :{pageLayoutSid:'" + pageLayoutSid + "', proLinkType:'"
				+ proLinkType + "', seq:'" + seq + "', pageLayoutTemplateSid:'" + pageLayoutTemplateSid
				+ "', title:'" + title + "', titleLink:'" + titleLink
				+ "', pageType:'" + pageType + "', channelSid:'"
				+ channelSid + "', nodeLevel:'" + nodeLevel
				+ "', startTime:'" + startTime + "', endTime:'"
				+ endTime +"}";
	}

}

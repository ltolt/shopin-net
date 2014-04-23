/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.poPageLayout.java
 * @Create By shiying
 * @Create In 2013-5-9 下午3:35:14
 * TODO
 */
package net.shopin.back.entity.po;

import java.sql.Date;
import com.framework.AbstractPOEntity;

/**
 * @Class Name PageLayout
 * desc   : 页面表 实体对象
 * @Author shiying
 * @Create In 2013-5-9
 */
public class PageLayout extends AbstractPOEntity{
	
	 private  Integer  pageLayoutSid ; 
	 
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
	
	
	 
	 public Integer getPageLayoutSid() {
		return pageLayoutSid;
	}

	public void setPageLayoutSid(Integer pageLayoutSid) {
		this.pageLayoutSid = pageLayoutSid;
	}

	public Integer getProLinkType() {
		return proLinkType;
	}

	public void setProLinkType(Integer proLinkType) {
		this.proLinkType = proLinkType;
	}

	public Integer getPageLayoutTemplateSid() {
		return pageLayoutTemplateSid;
	}

	public void setPageLayoutTemplateSid(Integer pageLayoutTemplateSid) {
		this.pageLayoutTemplateSid = pageLayoutTemplateSid;
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

	

	

	

	public String getTitleLink() {
		return titleLink;
	}

	public void setTitleLink(String titleLink) {
		this.titleLink = titleLink;
	}

	public Date getstartTime() {
		return startTime;
	}

	public void setstartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getendTime() {
		return endTime;
	}

	public void setendTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}
	 
	 
	
	

}

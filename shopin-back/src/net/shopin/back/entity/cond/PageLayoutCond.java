/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.condPageLayoutCond.java
 * @Create By shiying
 * @Create In 2013-5-9 下午4:30:42
 * TODO
 */
package net.shopin.back.entity.cond;

import java.sql.Date;

import net.shopin.back.entity.po.PageLayout;

import com.framework.AbstractCondtion;
import com.utils.JsonUtil;

/**
 * desc 页面展示表 条件对象
 * @Class Name PageLayoutCond
 * @Author shiying
 * @Create In 2013-5-9
 */
public class PageLayoutCond extends AbstractCondtion{
	
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
	 
	 
	 private PageLayout pageLayout;
	 private String pageLayoutJson;

	

	

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

	
	 
	
	public Integer getpageLayoutSid() {
		return pageLayoutSid;
	}

	public void setpageLayoutSid(Integer pageLayoutSid) {
		this.pageLayoutSid = pageLayoutSid;
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

	public PageLayout getPageLayout() {
		return pageLayout;
	}

	public void setPageLayout(PageLayout pageLayout) {
		if(pageLayout!=null){
		this.pageLayout = pageLayout;
		}
	}

	public String getpageLayoutJson() {
		return pageLayoutJson;
	}

	public void setpageLayoutJson(String pageLayoutJson) {
		this.pageLayoutJson = pageLayoutJson;
		if(pageLayoutJson!=null&&!"".equals(pageLayoutJson)){
			this.pageLayout  = (PageLayout) JsonUtil.Json2Object(pageLayoutJson, PageLayout.class);
		}
	}
	 

}

/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.utilPageLayoutMql.java
 * @Create By shiying
 * @Create In 2013-9-5 下午2:05:23
 * TODO
 */
package net.shopin.wms.util;



/**
 * @Class Name PageLayoutMql
 * @Author shiying
 * @Create In 2013-9-5
 */
public class PageLayoutMqlKey {
	private String sid;

    private String pageLayoutSid;

    private String proLinkType;

    private String seq;

    private String pageLayoutTemplateSid;

    private String title;

    private String titleLink;

    private String pageType;

    private String channelSid;

    private String nodeLevel;

    private String startTime;

    private String endTime;

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPageLayoutSid() {
		return pageLayoutSid;
	}

	public void setPageLayoutSid(String pageLayoutSid) {
		this.pageLayoutSid = pageLayoutSid;
	}

	public String getProLinkType() {
		return proLinkType;
	}

	public void setProLinkType(String proLinkType) {
		this.proLinkType = proLinkType;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getPageLayoutTemplateSid() {
		return pageLayoutTemplateSid;
	}

	public void setPageLayoutTemplateSid(String pageLayoutTemplateSid) {
		this.pageLayoutTemplateSid = pageLayoutTemplateSid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitleLink() {
		return titleLink;
	}

	public void setTitleLink(String titleLink) {
		this.titleLink = titleLink;
	}

	public String getPageType() {
		return pageType;
	}

	public void setPageType(String pageType) {
		this.pageType = pageType;
	}

	public String getChannelSid() {
		return channelSid;
	}

	public void setChannelSid(String channelSid) {
		this.channelSid = channelSid;
	}

	public String getNodeLevel() {
		return nodeLevel;
	}

	public void setNodeLevel(String nodeLevel) {
		this.nodeLevel = nodeLevel;
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
		return "PageLayoutMqlKey [sid=" + sid + ", pageLayoutSid="
				+ pageLayoutSid + ", proLinkType=" + proLinkType + ", seq="
				+ seq + ", pageLayoutTemplateSid=" + pageLayoutTemplateSid
				+ ", title=" + title + ", titleLink=" + titleLink
				+ ", pageType=" + pageType + ", channelSid=" + channelSid
				+ ", nodeLevel=" + nodeLevel + ", startTime=" + startTime
				+ ", endTime=" + endTime + "]";
	}
    
    
}

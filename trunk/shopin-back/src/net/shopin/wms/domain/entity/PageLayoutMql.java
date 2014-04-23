package net.shopin.wms.domain.entity;


import java.util.Date;


public class PageLayoutMql {
    private Integer sid;

    private Integer pageLayoutSid;

    private Integer proLinkType;

    private String seq;

    private Integer pageLayoutTemplateSid;

    private String title;

    private String titleLink;

    private Integer pageType;

    private Integer channelSid;

    private Integer nodeLevel;

    private Date startTime;

    private Date endTime;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

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

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq == null ? null : seq.trim();
    }

    public Integer getPageLayoutTemplateSid() {
        return pageLayoutTemplateSid;
    }

    public void setPageLayoutTemplateSid(Integer pageLayoutTemplateSid) {
        this.pageLayoutTemplateSid = pageLayoutTemplateSid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getTitleLink() {
        return titleLink;
    }

    public void setTitleLink(String titleLink) {
        this.titleLink = titleLink == null ? null : titleLink.trim();
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
}
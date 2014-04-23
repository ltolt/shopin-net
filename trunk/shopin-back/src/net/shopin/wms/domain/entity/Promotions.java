package net.shopin.wms.domain.entity;

import java.util.Date;

public class Promotions {
    private Integer sid;

    private Integer pageLayoutSid;

    private Integer pageTemplateSid;

    private String promotionTitle;

    private String promotionLink;

    private String promotionDesc;

    private String promotionSpict;

    private String promotionBpict;

    private Integer promotionStatus;

    private Date promotionBeginTime;

    private Date promotionEndTime;

    private String seq;

    private Integer promotionTypeSid;

    private String promotionVpict;//活动精图
    
    private String promotionCpict;//活动方图
    
    private String promotionCgpict;//活动方灰图
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

    public Integer getPageTemplateSid() {
        return pageTemplateSid;
    }

    public void setPageTemplateSid(Integer pageTemplateSid) {
        this.pageTemplateSid = pageTemplateSid;
    }

    public String getPromotionTitle() {
        return promotionTitle;
    }

    public void setPromotionTitle(String promotionTitle) {
        this.promotionTitle = promotionTitle == null ? null : promotionTitle.trim();
    }

    public String getPromotionLink() {
        return promotionLink;
    }

    public void setPromotionLink(String promotionLink) {
        this.promotionLink = promotionLink == null ? null : promotionLink.trim();
    }

    public String getPromotionDesc() {
        return promotionDesc;
    }

    public void setPromotionDesc(String promotionDesc) {
        this.promotionDesc = promotionDesc == null ? null : promotionDesc.trim();
    }

    public String getPromotionSpict() {
        return promotionSpict;
    }

    public void setPromotionSpict(String promotionSpict) {
        this.promotionSpict = promotionSpict == null ? null : promotionSpict.trim();
    }

    public String getPromotionBpict() {
        return promotionBpict;
    }

    public void setPromotionBpict(String promotionBpict) {
        this.promotionBpict = promotionBpict == null ? null : promotionBpict.trim();
    }

    public Integer getPromotionStatus() {
        return promotionStatus;
    }

    public void setPromotionStatus(Integer promotionStatus) {
        this.promotionStatus = promotionStatus;
    }

    public Date getPromotionBeginTime() {
        return promotionBeginTime;
    }

    public void setPromotionBeginTime(Date promotionBeginTime) {
        this.promotionBeginTime = promotionBeginTime;
    }

    public Date getPromotionEndTime() {
        return promotionEndTime;
    }

    public void setPromotionEndTime(Date promotionEndTime) {
        this.promotionEndTime = promotionEndTime;
    }

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq == null ? null : seq.trim();
    }

    public Integer getPromotionTypeSid() {
        return promotionTypeSid;
    }

    public void setPromotionTypeSid(Integer promotionTypeSid) {
        this.promotionTypeSid = promotionTypeSid;
    }

	public String getPromotionVpict() {
		return promotionVpict;
	}

	public void setPromotionVpict(String promotionVpict) {
		this.promotionVpict = promotionVpict;
	}

	public String getPromotionCpict() {
		return promotionCpict;
	}

	public void setPromotionCpict(String promotionCpict) {
		this.promotionCpict = promotionCpict;
	}

	public String getPromotionCgpict() {
		return promotionCgpict;
	}

	public void setPromotionCgpict(String promotionCgpict) {
		this.promotionCgpict = promotionCgpict;
	}
}
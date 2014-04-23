/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.util.PromotionsKey.java
 * @Create By wangdg
 * @Create In 2013-8-30 下午4:46:37
 * TODO
 */
package net.shopin.wms.util;

import java.util.Date;

/**
 * @Class Name PromotionsKey
 * @Author wangdg
 * @Create In 2013-8-30
 */
public class PromotionsKey {

	private String sid;

	private String pageTemplateSid;

	private String promotionTitle;

	private String promotionLink;

	private String promotionDesc;

	private String promotionSpict;

	private String promotionBpict;

	private String promotionBeginTime;

	private String promotionEndTime;

	private String seq;

	private String promotionTypeSid;

	private String promotionVpict;// 活动精图

	private String promotionCpict;// 活动方图

	private String promotionCgpict;// 活动方灰图

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPageTemplateSid() {
		return pageTemplateSid;
	}

	public void setPageTemplateSid(String pageTemplateSid) {
		this.pageTemplateSid = pageTemplateSid;
	}

	public String getPromotionTitle() {
		return promotionTitle;
	}

	public void setPromotionTitle(String promotionTitle) {
		this.promotionTitle = promotionTitle;
	}

	public String getPromotionLink() {
		return promotionLink;
	}

	public void setPromotionLink(String promotionLink) {
		this.promotionLink = promotionLink;
	}

	public String getPromotionDesc() {
		return promotionDesc;
	}

	public void setPromotionDesc(String promotionDesc) {
		this.promotionDesc = promotionDesc;
	}

	public String getPromotionSpict() {
		return promotionSpict;
	}

	public void setPromotionSpict(String promotionSpict) {
		this.promotionSpict = promotionSpict;
	}

	public String getPromotionBpict() {
		return promotionBpict;
	}

	public void setPromotionBpict(String promotionBpict) {
		this.promotionBpict = promotionBpict;
	}

	public String getPromotionBeginTime() {
		return promotionBeginTime;
	}

	public void setPromotionBeginTime(String promotionBeginTime) {
		this.promotionBeginTime = promotionBeginTime;
	}

	public String getPromotionEndTime() {
		return promotionEndTime;
	}

	public void setPromotionEndTime(String promotionEndTime) {
		this.promotionEndTime = promotionEndTime;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getPromotionTypeSid() {
		return promotionTypeSid;
	}

	public void setPromotionTypeSid(String promotionTypeSid) {
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

	@Override
	public String toString() {
		return "PromotionsKey [sid=" + sid + ", pageTemplateSid="
				+ pageTemplateSid + ", promotionTitle=" + promotionTitle
				+ ", promotionLink=" + promotionLink + ", promotionDesc="
				+ promotionDesc + ", promotionSpict=" + promotionSpict
				+ ", promotionBpict=" + promotionBpict
				+ ", promotionBeginTime=" + promotionBeginTime
				+ ", promotionEndTime=" + promotionEndTime + ", seq=" + seq
				+ ", promotionTypeSid=" + promotionTypeSid
				+ ", promotionVpict=" + promotionVpict + ", promotionCpict="
				+ promotionCpict + ", promotionCgpict=" + promotionCgpict + "]";
	}

}

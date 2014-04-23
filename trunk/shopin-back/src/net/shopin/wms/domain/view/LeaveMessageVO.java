/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.domain.viewLeaveMessageVO.java
 * @Create By jingpeng
 * @Create In 2013-8-15 下午2:28:19
 * TODO
 */
package net.shopin.wms.domain.view;

import java.util.Date;

import net.shopin.wms.util.PageModel;

/**
 * @Class Name LeaveMessageVO
 * @Author jingpeng
 * @Create In 2013-8-15
 */
public class LeaveMessageVO extends PageModel {
	private Date startTime;
	private Date endTime;
	private String orderKey;
	private Integer replyStatus;
	private String userEmail;
	private String orderno;
	private Integer blacklist;// (是否黑名单)
	private Integer leaveMessageType;

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

	public String getOrderKey() {
		return orderKey;
	}

	public void setOrderKey(String orderKey) {
		this.orderKey = orderKey;
	}

	public Integer getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(Integer replyStatus) {
		this.replyStatus = replyStatus;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public Integer getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(Integer blacklist) {
		this.blacklist = blacklist;
	}

	public Integer getLeaveMessageType() {
		return leaveMessageType;
	}

	public void setLeaveMessageType(Integer leaveMessageType) {
		this.leaveMessageType = leaveMessageType;
	}

	@Override
	public String toString() {
		return "LeaveMessageVO [startTime=" + startTime + ", endTime="
				+ endTime + ", orderKey=" + orderKey + ", replyStatus="
				+ replyStatus + ", userEmail=" + userEmail + ", orderno="
				+ orderno + ", blacklist=" + blacklist + ", leaveMessageType="
				+ leaveMessageType + "]";
	}

}

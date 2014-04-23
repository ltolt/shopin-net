/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.domain.view.LeaveMessageKey.java
 * @Create By wangdg
 * @Create In 2013-8-14 下午7:36:28
 * TODO
 */
package net.shopin.wms.domain.view;

/**
 * @Class Name LeaveMessageKey
 * @Author wangdg
 * @Create In 2013-8-14
 */
public class LeaveMessageKey {

	private String startTime;
	private String endTime;
	private String orderKey;
	private String replyStatus;
	private String userEmail;
	private String orderno;
	private String blacklist;// (是否黑名单)
	private String leaveMessageType;
	private String pageNo;
	private String pageSize;

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

	public String getOrderKey() {
		return orderKey;
	}

	public void setOrderKey(String orderKey) {
		this.orderKey = orderKey;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
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

	public String getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(String blacklist) {
		this.blacklist = blacklist;
	}

	public String getLeaveMessageType() {
		return leaveMessageType;
	}

	public void setLeaveMessageType(String leaveMessageType) {
		this.leaveMessageType = leaveMessageType;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "MessageTypeKey [startTime=" + startTime + ", endTime="
				+ endTime + ", orderKey=" + orderKey + ", replyStatus="
				+ replyStatus + ", userEmail=" + userEmail + ", orderno="
				+ orderno + ", blacklist=" + blacklist + ", leaveMessageType="
				+ leaveMessageType + ", pageNo=" + pageNo + ", pageSize="
				+ pageSize + "]";
	}

}

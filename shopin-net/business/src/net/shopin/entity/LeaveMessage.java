package net.shopin.entity;

import javax.persistence.*;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 
 * @Description： 留言信息类 用来保存留言的相关信息
 * @ClassName:LeaveMessage
 * @author： huyy
 * @date: 2013-7-10
 */
@Entity
@Table(name = "leave_message")
public class LeaveMessage{

	private Integer msgId;
	private Integer tid;
	private LeaveMessageType leaveMessageType;
	private String msgContent;
	private String replayContent;
	private Timestamp leaveMsgTime;
	private Timestamp replayTime;
	private String replayer;
	private Integer replayStatu;
	private Integer commonVisible;
	private String disableReson;
	private Integer needReplay;
	private String userEmail;
	private Integer blankList;
	// private Set<Refundapplyinfo> refundapplyinfos = new
	// HashSet<Refundapplyinfo>();
	private String userName;
	private String tel;
	private String orderId; // 订单编号
	private String userProvince;// 用户所在省市

	@Column(name = "ORDERNO")
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Column(name = "MSGID")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getMsgId() {
		return msgId;
	}

	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}

	@Column(name = "TID", insertable = false, updatable = false)
	@Basic
	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	@Column(name = "USERPROVINCE")
	public String getUserProvince() {
		return userProvince;
	}

	public void setUserProvince(String userProvince) {
		this.userProvince = userProvince;
	}

	@Column(name = "USERNAME")
	public String getUserName() {
		return userName;
	}

	@Column(name = "TEL")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TID",referencedColumnName = "TID")
	public LeaveMessageType getLeaveMessageType() {
		return leaveMessageType;
	}

	public void setLeaveMessageType(LeaveMessageType leaveMessageType) {
		this.leaveMessageType = leaveMessageType;
	}

	@Column(name = "MSGCONTENT")
	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	@Column(name = "REPLAYCONTENT")
	public String getReplayContent() {
		return replayContent;
	}

	public void setReplayContent(String replayContent) {
		this.replayContent = replayContent;
	}

	@Column(name = "LEAVEMSGTIME")
	public Timestamp getLeaveMsgTime() {
		return leaveMsgTime;
	}

	public void setLeaveMsgTime(Timestamp leavelMsgTime) {
		this.leaveMsgTime = leavelMsgTime;
	}

	@Column(name = "REPLAYTIME")
	public Timestamp getReplayTime() {
		return replayTime;
	}

	public void setReplayTime(Timestamp replayTime) {
		this.replayTime = replayTime;
	}

	@Column(name = "REPLAYER")
	public String getReplayer() {
		return replayer;
	}

	public void setReplayer(String replayer) {
		this.replayer = replayer;
	}

	@Column(name = "REPLAYSTATU")
	public Integer getReplayStatu() {
		return replayStatu;
	}

	public void setReplayStatu(Integer replayStatu) {
		this.replayStatu = replayStatu;
	}

	@Column(name = "COMMONVISIBLE")
	public Integer getCommonVisible() {
		return commonVisible;
	}

	public void setCommonVisible(Integer commonVisible) {
		this.commonVisible = commonVisible;
	}

	@Column(name = "DISABLERESON")
	public String getDisableReson() {
		return disableReson;
	}

	public void setDisableReson(String disableReson) {
		this.disableReson = disableReson;
	}

	@Column(name = "NEEDREPLAY")
	public Integer getNeedReplay() {
		return needReplay;
	}

	public void setNeedReplay(Integer needReplay) {
		this.needReplay = needReplay;
	}

	@Column(name = "USEREMAIL")
	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	@Column(name = "BLANKLIST")
	public Integer getBlankList() {
		return blankList;
	}

	public void setBlankList(Integer blankList) {
		this.blankList = blankList;
	}
	// @OneToMany(mappedBy = "leaveMessage")
	// public Set<Refundapplyinfo> getRefundapplyinfos() {
	// return refundapplyinfos;
	// }
	//
	// public void setRefundapplyinfos(Set<Refundapplyinfo> refundapplyinfos) {
	// this.refundapplyinfos = refundapplyinfos;
	// }
}
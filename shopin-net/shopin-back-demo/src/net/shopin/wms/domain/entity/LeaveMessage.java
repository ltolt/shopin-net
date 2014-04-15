package net.shopin.wms.domain.entity;

import java.util.Date;

import net.shopin.wms.util.PageModel;

public class LeaveMessage {
	private Integer msgid;

	private Integer tid;

	private String msgcontent;

	private String replaycontent;

	private Date leavemsgtime;

	private Date replaytime;

	private String replayer;

	private Integer replaystatu;

	private Integer commonvisible;

	private String disablereson;

	private Integer needreplay;

	private String useremail;

	private Integer blanklist;

	private String username;

	private String tel;

	private String orderno;

	private String userprovince;

	public Integer getMsgid() {
		return msgid;
	}

	public void setMsgid(Integer msgid) {
		this.msgid = msgid;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getMsgcontent() {
		return msgcontent;
	}

	public void setMsgcontent(String msgcontent) {
		this.msgcontent = msgcontent == null ? null : msgcontent.trim();
	}

	public String getReplaycontent() {
		return replaycontent;
	}

	public void setReplaycontent(String replaycontent) {
		this.replaycontent = replaycontent == null ? null : replaycontent
				.trim();
	}

	public Date getLeavemsgtime() {
		return leavemsgtime;
	}

	public void setLeavemsgtime(Date leavemsgtime) {
		this.leavemsgtime = leavemsgtime;
	}

	public Date getReplaytime() {
		return replaytime;
	}

	public void setReplaytime(Date replaytime) {
		this.replaytime = replaytime;
	}

	public String getReplayer() {
		return replayer;
	}

	public void setReplayer(String replayer) {
		this.replayer = replayer == null ? null : replayer.trim();
	}

	public Integer getReplaystatu() {
		return replaystatu;
	}

	public void setReplaystatu(Integer replaystatu) {
		this.replaystatu = replaystatu;
	}

	public Integer getCommonvisible() {
		return commonvisible;
	}

	public void setCommonvisible(Integer commonvisible) {
		this.commonvisible = commonvisible;
	}

	public String getDisablereson() {
		return disablereson;
	}

	public void setDisablereson(String disablereson) {
		this.disablereson = disablereson == null ? null : disablereson.trim();
	}

	public Integer getNeedreplay() {
		return needreplay;
	}

	public void setNeedreplay(Integer needreplay) {
		this.needreplay = needreplay;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail == null ? null : useremail.trim();
	}

	public Integer getBlanklist() {
		return blanklist;
	}

	public void setBlanklist(Integer blanklist) {
		this.blanklist = blanklist;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel == null ? null : tel.trim();
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno == null ? null : orderno.trim();
	}

	public String getUserprovince() {
		return userprovince;
	}

	public void setUserprovince(String userprovince) {
		this.userprovince = userprovince == null ? null : userprovince.trim();
	}

}
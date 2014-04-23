/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.voTRuleNewChannelVO.java
 * @Create By Administrator
 * @Create In 2013-5-28 上午11:48:50
 * TODO
 */
package net.shopin.back.entity.vo;

import com.framework.AbstractVOEntity;

/**
 * @Class Name TRuleNewChannelVO
 * @Author Administrator
 * @Create In 2013-5-28
 */
public class TRuleNewChannelVO extends AbstractVOEntity {
	
	private Integer sid;
	private Long ruleSid;
	private Long channelSid;
	private String channelName;
	
	private Integer seq;
	
	


	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public Long getRuleSid() {
		return ruleSid;
	}
	public void setRuleSid(Long ruleSid) {
		this.ruleSid = ruleSid;
	}
	public Long getChannelSid() {
		return channelSid;
	}
	public void setChannelSid(Long channelSid) {
		this.channelSid = channelSid;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	

	@Override
	public String toString() {
		return "TRuleNewChannelVO [sid=" + sid + ", ruleSid=" + ruleSid
				+ ", channelSid=" + channelSid + ", channelName=" + channelName
				+ ", seq=" + seq + "]";
	}
	

}

/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.poTRuleNewChannel.java
 * @Create By Administrator
 * @Create In 2013-5-28 上午11:40:11
 * TODO
 */
package net.shopin.back.entity.po;

import com.framework.AbstractPOEntity;

/**
 * @Class Name TRuleNewChannel
 * @Author Administrator
 * @Create In 2013-5-28
 */
public class TRuleNewChannel extends AbstractPOEntity{
	private Long sid;
	private Long ruleSid;
	private Long channelSid;
	private String channelName;
	private Integer seq;
	

	
	public Long getSid() {
		return sid;
	}
	
	public void setSid(Long sid) {
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
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	
	

}

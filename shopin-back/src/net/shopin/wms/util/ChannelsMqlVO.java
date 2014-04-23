/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.viewChannelsVO.java
 * @Create By shiying
 * @Create In 2013-6-25 下午2:12:11
 * TODO
 */
package net.shopin.wms.util;

import java.io.Serializable;
import java.util.List;

/**
 * @Class Name ChannelsVO
 * @Author shiying
 * @Create In 2013-6-25
 */
public class ChannelsMqlVO implements Serializable{
	
	//private String sid;
//	private String ruleSid;
	private String channelSid;
	private String channelName;
	//private String seq;
	
	List<RulesMqlVO> rules;
	
	public List<RulesMqlVO> getRules() {
		return rules;
	}
	public void setRules(List<RulesMqlVO> rules) {
		this.rules = rules;
	}

	public String getChannelSid() {
		return channelSid;
	}
	public void setChannelSid(String channelSid) {
		this.channelSid = channelSid;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

//	public String getRuleSid() {
//		return ruleSid;
//	}
//	public void setRuleSid(String ruleSid) {
//		this.ruleSid = ruleSid;
//	}
	@Override
	public String toString() {
		return "ChannelsMqlVO [ channelSid="
				+ channelSid + ", channelName=" + channelName + ", rules="
				+ rules + "]";
	}


	
	
	

}

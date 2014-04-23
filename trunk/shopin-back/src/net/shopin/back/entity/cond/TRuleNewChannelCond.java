/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.condTRuleNewChannelCond.java
 * @Create By Administrator
 * @Create In 2013-5-28 上午11:43:22
 * TODO
 */
package net.shopin.back.entity.cond;

import net.shopin.back.entity.po.TRuleNewChannel;

import com.framework.AbstractCondtion;
import com.utils.JsonUtil;

/**
 * @Class Name TRuleNewChannelCond
 * @Author Administrator
 * @Create In 2013-5-28
 */
public class TRuleNewChannelCond extends AbstractCondtion{
	private Long sid;
	private Long ruleSid;
	private Long channelSid;
	private String channelName;
	private Integer seq;
	

	
	private TRuleNewChannel truleNewChannel;
	private String truleNewChannelJson;
	
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
	public TRuleNewChannel getTruleNewChannel() {
		return truleNewChannel;
	}
	public void setTruleNewChannel(TRuleNewChannel truleNewChannel) {
		if(truleNewChannel!=null);
		this.truleNewChannel = truleNewChannel;
	}
	public String getTruleNewChannelJson() {
		return truleNewChannelJson;
	}
	public void setTruleNewChannelJson(String truleNewChannelJson) {
		
		this.truleNewChannelJson = truleNewChannelJson;
		if(truleNewChannelJson!=null&&"".equals(truleNewChannelJson)){
			this.truleNewChannel=JsonUtil.Json2Object(truleNewChannelJson, TRuleNewChannel.class);
		}
	}
	

}

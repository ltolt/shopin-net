/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.voShopChannelsVO.java
 * @Create By wangdg
 * @Create In 2013-5-9 下午4:30:39
 * TODO
 */
package net.shopin.back.entity.vo;

import com.framework.AbstractVOEntity;

/**
 * @Class Name ShopChannelsVO
 * @Author wangdg
 * @Create In 2013-5-9
 */
public class ShopChannelsVO extends AbstractVOEntity {
	
	private Integer sid;
	private Integer pageLayoutSid;
	private Integer pageTemplateSid;
	private String displayName;
	private String channelDesc;
	private String name;
	private String channelUrl;
	private String seq;
	private Integer flag;
	private Integer show;



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

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getChannelDesc() {
		return channelDesc;
	}

	public void setChannelDesc(String channelDesc) {
		this.channelDesc = channelDesc;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getChannelUrl() {
		return channelUrl;
	}

	public void setChannelUrl(String channelUrl) {
		this.channelUrl = channelUrl;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public Integer getShow() {
		return show;
	}

	public void setShow(Integer show) {
		this.show = show;
	}

	@Override
	public String toString() {
		return "ShopChannelsVO [sid=" + sid + ", pageLayoutSid="
				+ pageLayoutSid + ", pageTemplateSid=" + pageTemplateSid
				+ ", displayName=" + displayName + ", channelDesc="
				+ channelDesc + ", name=" + name + ", channelUrl=" + channelUrl
				+ ", seq=" + seq + ", flag=" + flag + ", show=" + show + "]";
	}
	
	
	
	

}

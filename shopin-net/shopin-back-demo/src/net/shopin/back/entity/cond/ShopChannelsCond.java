/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.condShopChannelsCond.java
 * @Create By wangdg
 * @Create In 2013-5-9 下午4:36:54
 * TODO
 */
package net.shopin.back.entity.cond;

import net.shopin.back.entity.po.ShopChannels;

import com.framework.AbstractCondtion;
import com.utils.JsonUtil;

/**
 * @Class Name ShopChannelsCond
 * @Author wangdg
 * @Create In 2013-5-9
 */
public class ShopChannelsCond extends AbstractCondtion {
	
	private Long sid;
	private Integer pageLayoutSid;
	private Integer pageTemplateSid;
	private String displayName;
	private String channelDesc;
	private String name;
	private String channelUrl;
	private String seq;
	private Integer flag;
	private Integer show;
	
	private ShopChannels shopChannels;
	private String shopChannelsJson;

	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
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

	public ShopChannels getShopChannels() {
		return shopChannels;
	}

	public void setShopChannels(ShopChannels shopChannels) {
		if(shopChannels!=null){
		this.shopChannels = shopChannels;
		}
	}

	public String getShopChannelsJson() {
		return shopChannelsJson;
	}

	public void setShopChannelsJson(String shopChannelsJson) {
		this.shopChannelsJson = shopChannelsJson;
		if(shopChannelsJson!=null&&!"".equals(shopChannelsJson)){
			this.shopChannels = JsonUtil.Json2Object(shopChannelsJson, ShopChannels.class);
		}
	}
}

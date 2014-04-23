/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.viewTRuleNewKey.java
 * @Create By shiying
 * @Create In 2013-5-31 下午1:48:38
 * TODO
 */
package net.shopin.back.view;

import java.io.Serializable;
import java.util.Date;

/**
 * @Class Name TRuleNewKey
 * @Author shiying
 * @Create In 2013-5-31
 */
public class TRuleNewKey implements Serializable {
	private String sid;
	private String ruleName;
	private String activeBeginTime;
	private String activeEndTime;
	private String brandSid;
	private String createUser;
	private String createTime;
	private String updateUser;
	private String updateTime;
	private String flag;


	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getRuleName() {
		return ruleName;
	}

	public void setRuleName(String ruleName) {
		this.ruleName = ruleName;
	}

	public String getActiveBeginTime() {
		return activeBeginTime;
	}

	public void setActiveBeginTime(String activeBeginTime) {
		this.activeBeginTime = activeBeginTime;
	}

	public String getActiveEndTime() {
		return activeEndTime;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public void setActiveEndTime(String activeEndTime) {
		this.activeEndTime = activeEndTime;
	}

	public String getBrandSid() {
		return brandSid;
	}

	public void setBrandSid(String brandSid) {
		this.brandSid = brandSid;
	}


	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "TRuleNewKey [sid=" + sid + ", ruleName=" + ruleName
				+ ", activeBeginTime=" + activeBeginTime + ", activeEndTime="
				+ activeEndTime + ", brandSid=" + brandSid + ", createUser="
				+ createUser + ", createTime=" + createTime + ", updateUser="
				+ updateUser + ", updateTime=" + updateTime + ", flag=" + flag
				+ "]";
	}





}

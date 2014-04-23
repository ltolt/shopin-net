/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.voTRuleNewVO.java
 * @Create By Administrator
 * @Create In 2013-5-27 下午5:50:02
 * TODO
 */
package net.shopin.back.entity.vo;



import java.util.Date;

import com.framework.AbstractVOEntity;
import com.utils.DateUtils;

/**
 * @Class Name TRuleNewVO
 * @Author Administrator
 * @Create In 2013-5-27
 */
public class TRuleNewVO extends AbstractVOEntity {
	
	private Integer sid;
	private String ruleName;
	private String activeBeginTime;
	private String activeEndTime;
	private String createUser;
	private String createTime;
	private String updateUser;
	private String updateTime;
	private Integer flag;
	
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getRuleName() {
		return ruleName;
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
	public void setActiveEndTime(String activeEndTime) {
		this.activeEndTime = activeEndTime;
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
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public void setRuleName(String ruleName) {
		this.ruleName = ruleName;
	}
	@Override
	public String toString() {
		return "TRuleNewVO [sid=" + sid + ", ruleName=" + ruleName
				+ ", activeBeginTime=" + activeBeginTime + ", activeEndTime="
				+ activeEndTime + ", createUser=" + createUser
				+ ", createTime=" + createTime + ", updateUser=" + updateUser
				+ ", updateTime=" + updateTime + ", flag=" + flag + "]";
	}


	


	
}

/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.viewRuleChannelVO.java
 * @Create By shiying
 * @Create In 2013-6-19 上午9:41:39
 * TODO
 */
package net.shopin.back.view;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import net.shopin.back.entity.vo.TRuleDetailVO;
import net.shopin.back.entity.vo.TRuleNewChannelVO;

/**
 * @Class Name RuleChannelVO
 * @Author shiying
 * @Create In 2013-6-19
 */
public class RulesVO implements Serializable{
	
	private String sid;
	private String ruleName;
	private String activeBeginTime;
	private String activeEndTime;
	private String createUser;
	private String createTime;
	private String updateUser;
	private String updateTime;
	private String flag;
	
//	List<ChannelsVO> channels;
	List<DetailsVO> details;

	

	


	public List<DetailsVO> getDetails() {
		return details;
	}

	public void setDetails(List<DetailsVO> details) {
		this.details = details;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
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
		this.activeBeginTime = activeBeginTime.substring(0,activeBeginTime.length()-2);
	}

	public String getActiveEndTime() {
		return activeEndTime;
	}

	public void setActiveEndTime(String activeEndTime) {
		this.activeEndTime = activeEndTime.substring(0,activeEndTime.length()-2);
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
		this.createTime = createTime.substring(0,createTime.length()-2);
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
		this.updateTime = updateTime.substring(0,updateTime.length()-2);
	}

	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}



	@Override
	public String toString() {
		
		return "sid:" + sid + ", ruleName:" + ruleName
				+ ", activeBeginTime:" + activeBeginTime + ", activeEndTime:"
				+ activeEndTime + ", createUser:" + createUser + ", createTime:" + createTime
				+ ", updateUser:" + updateUser + ", updateTime:" + updateTime
				+ ", flag:" + flag + ", details:" + details;
	}




	
	

}

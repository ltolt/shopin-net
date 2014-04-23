/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.condTruleNewCond.java
 * @Create By Administrator
 * @Create In 2013-5-27 下午6:38:07
 * TODO
 */
package net.shopin.back.entity.cond;



import java.util.Date;

import net.shopin.back.entity.po.TRuleNew;

import com.framework.AbstractCondtion;
import com.utils.JsonUtil;

/**
 * @Class Name TruleNewCond
 * @Author shiying
 * @Create In 2013-5-27
 */
public class TRuleNewCond extends AbstractCondtion {

	private Long sid;
	private String ruleName;
	private Date activeBeginTime;
	private Date activeEndTime;
    private String createUser;
	private Date createTime;
	private String updateUser;
	private Date updateTime;
	private Integer flag;
	
	private TRuleNew truleNew;
	private String truleNewJson;
	
	
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public Long getSid() {
		return sid;
	}
	public void setSid(Long sid) {
		this.sid = sid;
	}
	public String getRuleName() {
		return ruleName;
	}
	public void setRuleName(String ruleName) {
		this.ruleName = ruleName;
	}
	public Date getActiveBeginTime() {
		return activeBeginTime;
	}
	public void setActiveBeginTime(Date activeBeginTime) {
		this.activeBeginTime = activeBeginTime;
	}
	public Date getActiveEndTime() {
		return activeEndTime;
	}
	public void setActiveEndTime(Date activeEndTime) {
		this.activeEndTime = activeEndTime;
	}
	
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	public TRuleNew getTruleNew() {
		return truleNew;
	}
	public void setTruleNew(TRuleNew truleNew) {
		if(truleNew!=null)
		this.truleNew = truleNew;
	}
	public String getTruleNewJson() {
		return truleNewJson;
	}
	public void setTruleNewJson(String truleNewJson) {
		
		this.truleNewJson = truleNewJson;
		if(truleNewJson!=null&&"".equals(truleNewJson)){
			this.truleNew=JsonUtil.Json2Object(truleNewJson, TRuleNew.class);
		}
	}
	
}

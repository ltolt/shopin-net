package net.shopin.wms.domain.view;

import java.util.Date;

import net.shopin.wms.util.PageModel;

public class NavSortVO  extends PageModel {
	
	private Integer sid;

    private Integer shopChannelsSid;

    private String moduleName;

    private String createUser;

    private String createTime;

    private String updateUser;

    private String updateTime;

    private Integer isEnable;
	
	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getShopChannelsSid() {
		return shopChannelsSid;
	}



	public void setShopChannelsSid(Integer shopChannelsSid) {
		this.shopChannelsSid = shopChannelsSid;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
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

	public Integer getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(Integer isEnable) {
		this.isEnable = isEnable;
	}

	@Override
	public String toString() {
		return "NavSortVO [sid=" + sid + ", shopChannelsSid="
				+ shopChannelsSid + ", createUser=" + createUser + ", createTime="
				+ createTime + ", updateUser=" + updateUser + ", updateTime="
				+ updateTime + ", isEnable=" + isEnable + ", moduleName="
				+ moduleName + "]";
	}

}

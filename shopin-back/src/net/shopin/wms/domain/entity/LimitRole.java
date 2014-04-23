/**
 * 
 */
package net.shopin.wms.domain.entity;

import java.util.Date;

import net.shopin.wms.util.PageModel;

/**
 * 角色信息
 * @Class Name LimitRole
 * @Author chenqb
 * @Create In 2013-8-7
 */
public class LimitRole extends PageModel{

	//唯一标识
	private Long sid;
	//角色Sid
	private String roleName;
	//角色名称
	private String roleCode;
	//角色编码
	private Date createdTime;
	//创建时间
	private Date updateTime;
	//修改时间
	private Integer delFlag;
	//删除标识符,1未删除0删除
	
	public Integer getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}
	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}
	/**
	 * @return the sid
	 */
	public Long getSid() {
		return sid;
	}
	/**
	 * @param sid the sid to set
	 */
	public void setSid(Long sid) {
		this.sid = sid;
	}
	/**
	 * @param roleName the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	/**
	 * @return the roleCode
	 */
	public String getRoleCode() {
		return roleCode;
	}
	/**
	 * @param roleCode the roleCode to set
	 */
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	

	/**
	 * @return the updateTime
	 */
	public Date getUpdateTime() {
		return updateTime;
	}
	/**
	 * @param updateTime the updateTime to set
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	/**
	 * @return the createdTime
	 */
	public Date getCreatedTime() {
		return createdTime;
	}
	/**
	 * @param createdTime the createdTime to set
	 */
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
//	@Override
//	public String toString() {
//		return "{sid :" + sid + ", roleName:" + roleName + ", roleCode:"
//				+ roleCode + ", createdTime:" + createdTime + ", updateTime:"
//				+ updateTime + ", delFlag:" + delFlag + "}";
//	}
	

	

}

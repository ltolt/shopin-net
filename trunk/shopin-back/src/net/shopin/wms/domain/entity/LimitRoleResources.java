/**
 * 
 */
package net.shopin.wms.domain.entity;


/**
 * 角色资源关系表
 * @Class Name LimitRoleResources
 * @Author chenqb
 * @Create In 2013-8-7
 */
public class LimitRoleResources {

	//唯一标识
	private Long sid;
	//角色资源关系Sid
	private Long roleSid;
	//角色Sid
	private Long rsSid;
	//资源Sid
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
	 * @return the roleSid
	 */
	public Long getRoleSid() {
		return roleSid;
	}
	/**
	 * @param roleSid the roleSid to set
	 */
	public void setRoleSid(Long roleSid) {
		this.roleSid = roleSid;
	}
	/**
	 * @return the rsSid
	 */
	public Long getRsSid() {
		return rsSid;
	}
	/**
	 * @param rsSid the rsSid to set
	 */
	public void setRsSid(Long rsSid) {
		this.rsSid = rsSid;
	}
	
}

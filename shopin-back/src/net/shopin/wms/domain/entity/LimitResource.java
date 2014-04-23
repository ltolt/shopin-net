package net.shopin.wms.domain.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 访问资源描述
 * @Class Name LimitResource
 * @Author chenqb
 * @Create In 2013-8-7
 */
public class LimitResource {

	//标记Sid
	private Long sid;
	//资源名称
	private String rsName;
	//资源编码
	private String rsCode;
	//创建时间
	private Date createTime;
	//修改时间
	private Date updateTime;
	//删除表示符 
	private Integer delFlag;
	//父类Sid
	private Long parentSid;
	//是否是叶子节点
	private Integer isLeaf;
	
	//是否是复选框
	private boolean checked;
	
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	private List<LimitResource> children = new ArrayList<LimitResource>();

	/**
	 * @return the children
	 */
	public List<LimitResource> getChildren() {
		return children;
	}

	/**
	 * @param children the children to set
	 */
	public void setChildren(List<LimitResource> children) {
		this.children = children;
	}

	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	public String getRsName() {
		return rsName;
	}

	public void setRsName(String rsName) {
		this.rsName = rsName;
	}

	public String getRsCode() {
		return rsCode;
	}

	public void setRsCode(String rsCode) {
		this.rsCode = rsCode;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

	public Long getParentSid() {
		return parentSid;
	}

	public void setParentSid(Long parentSid) {
		this.parentSid = parentSid;
	}

	public Integer getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(Integer isLeaf) {
		this.isLeaf = isLeaf;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((parentSid == null) ? 0 : parentSid.hashCode());
		result = prime * result + ((rsCode == null) ? 0 : rsCode.hashCode());
		result = prime * result + ((rsName == null) ? 0 : rsName.hashCode());
		result = prime * result + ((sid == null) ? 0 : sid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LimitResource other = (LimitResource) obj;
		if (parentSid == null) {
			if (other.parentSid != null)
				return false;
		} else if (!parentSid.equals(other.parentSid))
			return false;
		if (rsCode == null) {
			if (other.rsCode != null)
				return false;
		} else if (!rsCode.equals(other.rsCode))
			return false;
		if (rsName == null) {
			if (other.rsName != null)
				return false;
		} else if (!rsName.equals(other.rsName))
			return false;
		if (sid == null) {
			if (other.sid != null)
				return false;
		} else if (!sid.equals(other.sid))
			return false;
		return true;
	}

//	@Override
//	public String toString() {
//		return "LimitResource [sid=" + sid + ", rsName=" + rsName + ", rsCode="
//				+ rsCode + ", createTime=" + createTime + ", updateTime="
//				+ updateTime + ", delFlag=" + delFlag + ", parentSid="
//				+ parentSid + ", isLeaf=" + isLeaf + "]";
//	}

}

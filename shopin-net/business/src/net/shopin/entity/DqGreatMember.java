/**
 * @Probject Name: business
 * @Path: net.shopin.entity.DqGreatMember.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午4:28:12
 * TODO
 */
package net.shopin.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @Class Name DqGreatMember
 * @Author jingpeng
 * @Create In 2013-7-9
 */
@Table(name = "DQ_GREAT_MEMBER")
@Entity
public class DqGreatMember {
	
	private Integer sid;
	private String orderNo;
	private Integer membersSid;
	
	@Column(name = "sid")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	
	@Column(name = "ORDER_NO")
	@Basic
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	@Column(name = "MEMBERS_SID", insertable = false, updatable = false)
	@Basic
	public Integer getMembersSid() {
		return membersSid;
	}
	public void setMembersSid(Integer membersSid) {
		this.membersSid = membersSid;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((membersSid == null) ? 0 : membersSid.hashCode());
		result = prime * result + ((orderNo == null) ? 0 : orderNo.hashCode());
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
		DqGreatMember other = (DqGreatMember) obj;
		if (membersSid == null) {
			if (other.membersSid != null)
				return false;
		} else if (!membersSid.equals(other.membersSid))
			return false;
		if (orderNo == null) {
			if (other.orderNo != null)
				return false;
		} else if (!orderNo.equals(other.orderNo))
			return false;
		if (sid == null) {
			if (other.sid != null)
				return false;
		} else if (!sid.equals(other.sid))
			return false;
		return true;
	}
	
	private Members members;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MEMBERS_SID", referencedColumnName = "SID")
	public Members getMembers() {
		return members;
	}
	public void setMembers(Members members) {
		this.members = members;
	}
	
}

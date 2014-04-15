/**
 * @Probject Name: business
 * @Path: net.shopin.entity.DqActiveMember.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午4:27:11
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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @Class Name DqActiveMember
 * @Author jingpeng
 * @Create In 2013-7-9
 */
@Table(name = "DQ_ACTIVE_MEMBER")
@Entity
public class DqActiveMember {

	private Integer sid;
	private String telNumber;
	private String city;
	private Integer membersSid;
	private String type;
	
	@Column(name = "SID")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	
	@Column(name = "TEL_NUMBER")
	@Basic
	public String getTelNumber() {
		return telNumber;
	}
	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}
	
	@Column(name = "CITY")
	@Basic
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	@Column(name = "MEMBERS_SID", insertable = false, updatable = false)
	@Basic
	public Integer getMembersSid() {
		return membersSid;
	}
	public void setMembersSid(Integer membersSid) {
		this.membersSid = membersSid;
	}
	
	@Column(name = "TYPE")
	@Basic
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result
				+ ((membersSid == null) ? 0 : membersSid.hashCode());
		result = prime * result + ((sid == null) ? 0 : sid.hashCode());
		result = prime * result
				+ ((telNumber == null) ? 0 : telNumber.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
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
		DqActiveMember other = (DqActiveMember) obj;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		if (membersSid == null) {
			if (other.membersSid != null)
				return false;
		} else if (!membersSid.equals(other.membersSid))
			return false;
		if (sid == null) {
			if (other.sid != null)
				return false;
		} else if (!sid.equals(other.sid))
			return false;
		if (telNumber == null) {
			if (other.telNumber != null)
				return false;
		} else if (!telNumber.equals(other.telNumber))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
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

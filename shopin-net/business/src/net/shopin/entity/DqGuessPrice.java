/**
 * @Probject Name: business
 * @Path: net.shopin.entity.DqGuessPrice.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午4:28:36
 * TODO
 */
package net.shopin.entity;

import java.sql.Timestamp;

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
 * @Class Name DqGuessPrice
 * @Author jingpeng
 * @Create In 2013-7-9
 */
@Table(name = "DQ_GUESS_PRICE")
@Entity
public class DqGuessPrice {

	private Integer sid;
	private String proId;
	private String name;
	private String mobile;
	private String guessPrice;
	private Integer membersSid;
	private Timestamp guessTime;
	
	@Column(name = "SID")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	
	@Column(name = "PRO_ID")
	@Basic
	public String getProId() {
		return proId;
	}
	public void setProId(String proId) {
		this.proId = proId;
	}
	
	@Column(name = "NAME")
	@Basic
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "MOBILE")
	@Basic
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	@Column(name = "GUESS_PRICE")
	@Basic
	public String getGuessPrice() {
		return guessPrice;
	}
	public void setGuessPrice(String guessPrice) {
		this.guessPrice = guessPrice;
	}
	
	@Column(name = "MEMBERS_SID", insertable = false, updatable = false)
	@Basic
	public Integer getMembersSid() {
		return membersSid;
	}
	public void setMembersSid(Integer membersSid) {
		this.membersSid = membersSid;
	}
	
	@Column(name = "GUESS_TIME")
	@Basic
	public Timestamp getGuessTime() {
		return guessTime;
	}
	public void setGuessTime(Timestamp guessTime) {
		this.guessTime = guessTime;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((guessPrice == null) ? 0 : guessPrice.hashCode());
		result = prime * result
				+ ((guessTime == null) ? 0 : guessTime.hashCode());
		result = prime * result
				+ ((membersSid == null) ? 0 : membersSid.hashCode());
		result = prime * result + ((mobile == null) ? 0 : mobile.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((proId == null) ? 0 : proId.hashCode());
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
		DqGuessPrice other = (DqGuessPrice) obj;
		if (guessPrice == null) {
			if (other.guessPrice != null)
				return false;
		} else if (!guessPrice.equals(other.guessPrice))
			return false;
		if (guessTime == null) {
			if (other.guessTime != null)
				return false;
		} else if (!guessTime.equals(other.guessTime))
			return false;
		if (membersSid == null) {
			if (other.membersSid != null)
				return false;
		} else if (!membersSid.equals(other.membersSid))
			return false;
		if (mobile == null) {
			if (other.mobile != null)
				return false;
		} else if (!mobile.equals(other.mobile))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (proId == null) {
			if (other.proId != null)
				return false;
		} else if (!proId.equals(other.proId))
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

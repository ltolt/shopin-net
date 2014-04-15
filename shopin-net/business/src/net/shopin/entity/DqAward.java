/**
 * @Probject Name: business
 * @Path: net.shopin.entity.DqAward.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午4:27:55
 * TODO
 */
package net.shopin.entity;

import java.math.BigDecimal;
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
 * @Class Name DqAward
 * @Author jingpeng
 * @Create In 2013-7-9
 */
@Table(name = "DQ_AWARD")
@Entity
public class DqAward {
	
	private Integer sid;
	private String orderNo;
	private String receptPhone;
	private String receptName;
	private Timestamp fillTime;
	private String flag;
	private BigDecimal saleMoneySum;
	private Integer membersSid;
	
	@Column(name = "SID")
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
	
	
	@Column(name = "RECEPT_PHONE")
	@Basic
	public String getReceptPhone() {
		return receptPhone;
	}
	public void setReceptPhone(String receptPhone) {
		this.receptPhone = receptPhone;
	}
	
	
	@Column(name = "RECEPT_NAME")
	@Basic
	public String getReceptName() {
		return receptName;
	}
	public void setReceptName(String receptName) {
		this.receptName = receptName;
	}
	
	@Column(name = "FILL_TIME")
	@Basic
	public Timestamp getFillTime() {
		return fillTime;
	}
	public void setFillTime(Timestamp fillTime) {
		this.fillTime = fillTime;
	}
	
	
	@Column(name = "FLAG")
	@Basic
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	@Column(name = "SALE_MONEY_SUM")
	@Basic
	public BigDecimal getSaleMoneySum() {
		return saleMoneySum;
	}
	public void setSaleMoneySum(BigDecimal saleMoneySum) {
		this.saleMoneySum = saleMoneySum;
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
				+ ((fillTime == null) ? 0 : fillTime.hashCode());
		result = prime * result + ((flag == null) ? 0 : flag.hashCode());
		result = prime * result
				+ ((membersSid == null) ? 0 : membersSid.hashCode());
		result = prime * result + ((orderNo == null) ? 0 : orderNo.hashCode());
		result = prime * result
				+ ((receptName == null) ? 0 : receptName.hashCode());
		result = prime * result
				+ ((receptPhone == null) ? 0 : receptPhone.hashCode());
		result = prime * result
				+ ((saleMoneySum == null) ? 0 : saleMoneySum.hashCode());
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
		DqAward other = (DqAward) obj;
		if (fillTime == null) {
			if (other.fillTime != null)
				return false;
		} else if (!fillTime.equals(other.fillTime))
			return false;
		if (flag == null) {
			if (other.flag != null)
				return false;
		} else if (!flag.equals(other.flag))
			return false;
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
		if (receptName == null) {
			if (other.receptName != null)
				return false;
		} else if (!receptName.equals(other.receptName))
			return false;
		if (receptPhone == null) {
			if (other.receptPhone != null)
				return false;
		} else if (!receptPhone.equals(other.receptPhone))
			return false;
		if (saleMoneySum == null) {
			if (other.saleMoneySum != null)
				return false;
		} else if (!saleMoneySum.equals(other.saleMoneySum))
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

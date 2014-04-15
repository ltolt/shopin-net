/**
 * @Probject Name: business
 * @Path: net.shopin.entity.DqActiveOrders.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午4:27:38
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
 * @Class Name DqActiveOrders
 * @Author jingpeng
 * @Create In 2013-7-9
 */
@Table(name = "DQ_ACTIVE_ORDERS")
@Entity
public class DqActiveOrders {
	
	private Integer sid;
	private Integer membersSid;
	private Integer num;
	private String orderNo;
	private Timestamp saleTime;
	private String flag;
	private Integer yyNum;
	private Integer xpNum;
	
	@Column(name = "SID")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	
	@Column(name = "MEMBERS_SID", insertable = false, updatable = false)
	@Basic
	public Integer getMembersSid() {
		return membersSid;
	}
	public void setMembersSid(Integer membersSid) {
		this.membersSid = membersSid;
	}
	
	@Column(name = "NUM")
	@Basic
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	
	@Column(name = "ORDER_NO")
	@Basic
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	
	@Column(name = "SALE_TIME")
	@Basic
	public Timestamp getSaleTime() {
		return saleTime;
	}
	public void setSaleTime(Timestamp saleTime) {
		this.saleTime = saleTime;
	}
	
	
	@Column(name = "FLAG")
	@Basic
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	@Column(name = "YYNUM")
	@Basic
	public Integer getYyNum() {
		return yyNum;
	}
	public void setYyNum(Integer yyNum) {
		this.yyNum = yyNum;
	}
	
	
	@Column(name = "XPNUM")
	@Basic
	public Integer getXpNum() {
		return xpNum;
	}
	public void setXpNum(Integer xpNum) {
		this.xpNum = xpNum;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((flag == null) ? 0 : flag.hashCode());
		result = prime * result
				+ ((membersSid == null) ? 0 : membersSid.hashCode());
		result = prime * result + ((num == null) ? 0 : num.hashCode());
		result = prime * result + ((orderNo == null) ? 0 : orderNo.hashCode());
		result = prime * result
				+ ((saleTime == null) ? 0 : saleTime.hashCode());
		result = prime * result + ((sid == null) ? 0 : sid.hashCode());
		result = prime * result + ((xpNum == null) ? 0 : xpNum.hashCode());
		result = prime * result + ((yyNum == null) ? 0 : yyNum.hashCode());
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
		DqActiveOrders other = (DqActiveOrders) obj;
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
		if (num == null) {
			if (other.num != null)
				return false;
		} else if (!num.equals(other.num))
			return false;
		if (orderNo == null) {
			if (other.orderNo != null)
				return false;
		} else if (!orderNo.equals(other.orderNo))
			return false;
		if (saleTime == null) {
			if (other.saleTime != null)
				return false;
		} else if (!saleTime.equals(other.saleTime))
			return false;
		if (sid == null) {
			if (other.sid != null)
				return false;
		} else if (!sid.equals(other.sid))
			return false;
		if (xpNum == null) {
			if (other.xpNum != null)
				return false;
		} else if (!xpNum.equals(other.xpNum))
			return false;
		if (yyNum == null) {
			if (other.yyNum != null)
				return false;
		} else if (!yyNum.equals(other.yyNum))
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

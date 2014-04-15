/**
 * @Probject Name: business
 * @Path: net.shopin.entity.MembersInfo.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午6:34:51
 * TODO
 */
package net.shopin.entity;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @Class Name MembersInfo
 * @Author jingpeng
 * @Create In 2013-7-9
 */
@Table(name = "MEMBERS_INFO")
@Entity
public class MembersInfo {
    private Integer sid;

    @Column(name = "SID")
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    private Integer membersSid;

    @Column(name = "MEMBERS_SID",insertable=false, updatable=false)
    @Basic
    public Integer getMembersSid() {
        return membersSid;
    }

    public void setMembersSid(Integer membersSid) {
        this.membersSid = membersSid;
    }

    private Date birthdate;

    @Column(name = "BIRTHDATE")
    @Basic
    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    private String sex;

    @Column(name = "SEX")
    @Basic
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    private String stature;

    @Column(name = "STATURE")
    @Basic
    public String getStature() {
        return stature;
    }

    public void setStature(String stature) {
        this.stature = stature;
    }

    private String weight;

    @Column(name = "WEIGHT")
    @Basic
    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    private String tel;

    @Column(name = "TEL")
    @Basic
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    private String interest;

    @Column(name = "INTEREST")
    @Basic
    public String getInterest() {
        return interest;
    }

    public void setInterest(String interest) {
        this.interest = interest;
    }

    private String career;

    @Column(name = "CAREER")
    @Basic
    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    private String earnings;

    @Column(name = "EARNINGS")
    @Basic
    public String getEarnings() {
        return earnings;
    }

    public void setEarnings(String earnings) {
        this.earnings = earnings;
    }

    private String address;

    @Column(name = "ADDRESS")
    @Basic
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result
				+ ((birthdate == null) ? 0 : birthdate.hashCode());
		result = prime * result + ((career == null) ? 0 : career.hashCode());
		result = prime * result
				+ ((earnings == null) ? 0 : earnings.hashCode());
		result = prime * result
				+ ((interest == null) ? 0 : interest.hashCode());
		result = prime * result + ((members == null) ? 0 : members.hashCode());
		result = prime * result
				+ ((membersSid == null) ? 0 : membersSid.hashCode());
		result = prime * result + ((sex == null) ? 0 : sex.hashCode());
		result = prime * result + ((sid == null) ? 0 : sid.hashCode());
		result = prime * result + ((stature == null) ? 0 : stature.hashCode());
		result = prime * result + ((tel == null) ? 0 : tel.hashCode());
		result = prime * result + ((weight == null) ? 0 : weight.hashCode());
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
		MembersInfo other = (MembersInfo) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (birthdate == null) {
			if (other.birthdate != null)
				return false;
		} else if (!birthdate.equals(other.birthdate))
			return false;
		if (career == null) {
			if (other.career != null)
				return false;
		} else if (!career.equals(other.career))
			return false;
		if (earnings == null) {
			if (other.earnings != null)
				return false;
		} else if (!earnings.equals(other.earnings))
			return false;
		if (interest == null) {
			if (other.interest != null)
				return false;
		} else if (!interest.equals(other.interest))
			return false;
		if (members == null) {
			if (other.members != null)
				return false;
		} else if (!members.equals(other.members))
			return false;
		if (membersSid == null) {
			if (other.membersSid != null)
				return false;
		} else if (!membersSid.equals(other.membersSid))
			return false;
		if (sex == null) {
			if (other.sex != null)
				return false;
		} else if (!sex.equals(other.sex))
			return false;
		if (sid == null) {
			if (other.sid != null)
				return false;
		} else if (!sid.equals(other.sid))
			return false;
		if (stature == null) {
			if (other.stature != null)
				return false;
		} else if (!stature.equals(other.stature))
			return false;
		if (tel == null) {
			if (other.tel != null)
				return false;
		} else if (!tel.equals(other.tel))
			return false;
		if (weight == null) {
			if (other.weight != null)
				return false;
		} else if (!weight.equals(other.weight))
			return false;
		return true;
	}

	private Members members;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "MEMBERS_SID", referencedColumnName = "SID")
    public Members getMembers() {
        return members;
    }

    public void setMembers(Members members) {
        this.members = members;
    }
}

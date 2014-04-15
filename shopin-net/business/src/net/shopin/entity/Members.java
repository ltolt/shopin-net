/**
 * @Probject Name: business
 * @Path: net.shopin.entity.Members.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午6:33:46
 * TODO
 */
package net.shopin.entity;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @Class Name Members
 * @Author jingpeng
 * @Create In 2013-7-9
 */
@Table(name = "MEMBERS")
@Entity
public class Members {
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

    private String memName;

    @Column(name = "MEM_NAME")
    @Basic
    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    private String memEmail;

    @Column(name = "MEM_EMAIL")
    @Basic
    public String getMemEmail() {
        return memEmail;
    }

    public void setMemEmail(String memEmail) {
        this.memEmail = memEmail;
    }

    private String memPwd;

    @Column(name = "MEM_PWD")
    @Basic
    public String getMemPwd() {
        return memPwd;
    }

    public void setMemPwd(String memPwd) {
        this.memPwd = memPwd;
    }

    private Integer membersSid;

    @Column(name = "MEMBERS_SID")
    @Basic
    public Integer getMembersSid() {
        return membersSid;
    }

    public void setMembersSid(Integer membersSid) {
        this.membersSid = membersSid;
    }

    private Integer memStatus;

    @Column(name = "MEM_STATUS")
    @Basic
    public Integer getMemStatus() {
        return memStatus;
    }

    public void setMemStatus(Integer memStatus) {
        this.memStatus = memStatus;
    }

    private Timestamp regDate;

    @Column(name = "REG_DATE")
    @Basic
    public Timestamp getRegDate() {
        return regDate;
    }

    public void setRegDate(Timestamp regDate) {
        this.regDate = regDate;
    }

    private Timestamp loginDate;

    @Column(name = "LOGIN_DATE")
    @Basic
    public Timestamp getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Timestamp loginDate) {
        this.loginDate = loginDate;
    }

    private Integer memBit;

    @Column(name = "MEM_BIT")
    @Basic
    public Integer getMemBit() {
        return memBit;
    }

    public void setMemBit(Integer memBit) {
        this.memBit = memBit;
    }

    private Integer loginTimes;

    @Column(name = "LOGIN_TIMES")
    @Basic
    public Integer getLoginTimes() {
        return loginTimes;
    }

    public void setLoginTimes(Integer loginTimes) {
        this.loginTimes = loginTimes;
    }
    
    private String loginKey;

	@Column(name="LOGIN_KEY")
	@Basic
    public String getLoginKey() {
		return loginKey;
	}

	public void setLoginKey(String loginKey) {
		this.loginKey = loginKey;
	}
    
//    private MembersAccount membersAccount;
//
//    @OneToOne(mappedBy = "members",fetch=FetchType.LAZY,cascade=CascadeType.ALL)
//    public MembersAccount getMembersAccount() {
//        return membersAccount;
//    }
//
//    public void setMembersAccount(MembersAccount membersAccount) {
//        this.membersAccount = membersAccount;
//    }
    
    private MembersInfo membersInfo;

    @OneToOne(mappedBy = "members",fetch=FetchType.LAZY,cascade=CascadeType.ALL)
    public MembersInfo getMembersInfo() {
        return membersInfo;
    }

    public void setMembersInfo(MembersInfo membersInfo) {
        this.membersInfo = membersInfo;
    }
    
    private Set<DqActiveMember> dqActiveMembers;
    
    @OneToMany(mappedBy = "members")
	public Set<DqActiveMember> getDqActiveMembers() {
		return dqActiveMembers;
	}

	public void setDqActiveMembers(Set<DqActiveMember> dqActiveMembers) {
		this.dqActiveMembers = dqActiveMembers;
	}
    
	private Set<DqActiveOrders> dqActiveOrders;

	@OneToMany(mappedBy = "members")
	public Set<DqActiveOrders> getDqActiveOrders() {
		return dqActiveOrders;
	}

	public void setDqActiveOrders(Set<DqActiveOrders> dqActiveOrders) {
		this.dqActiveOrders = dqActiveOrders;
	}
	
	private Set<DqAward> dqAwards;
	
	@OneToMany(mappedBy = "members")
	public Set<DqAward> getDqAwards() {
		return dqAwards;
	}

	public void setDqAwards(Set<DqAward> dqAwards) {
		this.dqAwards = dqAwards;
	}
	
	private Set<DqGreatMember> dqGreatMembers;
	
	@OneToMany(mappedBy = "members")
	public Set<DqGreatMember> getDqGreatMembers() {
		return dqGreatMembers;
	}

	public void setDqGreatMembers(Set<DqGreatMember> dqGreatMembers) {
		this.dqGreatMembers = dqGreatMembers;
	}
	
	private Set<DqGuessPrice> dqGuessPrice;

	@OneToMany(mappedBy = "members")
	public Set<DqGuessPrice> getDqGuessPrice() {
		return dqGuessPrice;
	}

	public void setDqGuessPrice(Set<DqGuessPrice> dqGuessPrice) {
		this.dqGuessPrice = dqGuessPrice;
	}
	
//    private MembersPoints membersPoints;
//
//    @OneToOne(mappedBy = "members",fetch=FetchType.LAZY,cascade={ CascadeType.ALL})
//    public MembersPoints getMembersPoints() {
//        return membersPoints;
//    }
//
//    public void setMembersPoints(MembersPoints membersPoints) {
//        this.membersPoints = membersPoints;
//    }


//    private Set<MembersAccountDetail> membersAccountDetails;
//
//    @OneToMany(mappedBy = "members")
//    public Set<MembersAccountDetail> getMembersAccountDetails() {
//        return membersAccountDetails;
//    }
//
//    public void setMembersAccountDetails(Set<MembersAccountDetail> membersAccountDetails) {
//        this.membersAccountDetails = membersAccountDetails;
//    }
//
//    private Set<MembersDeliAddr> membersDeliAddrs;
//
//    @OneToMany(mappedBy = "members", cascade = CascadeType.REMOVE)
//    public Set<MembersDeliAddr> getMembersDeliAddrs() {
//        return membersDeliAddrs;
//    }
//
//    public void setMembersDeliAddrs(Set<MembersDeliAddr> membersDeliAddrs) {
//        this.membersDeliAddrs = membersDeliAddrs;
//    }
//
//    private Set<ProReviews> proReviews;
//
//    @OneToMany(mappedBy = "members")
//    public Set<ProReviews> getProReviews() {
//        return proReviews;
//    }
//
//    public void setProReviews(Set<ProReviews> proReviews) {
//        this.proReviews = proReviews;
//    }

//    private Set<Favorites> favorites;
//
//    @OneToMany(mappedBy = "members")
//    public Set<Favorites> getFavorites() {
//        return favorites;
//    }
//
//    public void setFavorites(Set<Favorites> favorites) {
//        this.favorites = favorites;
//    }
//
//
//    private Set<ProductRecommend> recommends;
//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "member")
//    public Set<ProductRecommend> getRecommends() {
//        return recommends;
//    }
//
//    public void setRecommends(Set<ProductRecommend> recommends) {
//        this.recommends = recommends;
//    }
}
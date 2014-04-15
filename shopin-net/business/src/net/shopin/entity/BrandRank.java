/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.entity.BrandRank.java
 * @Create By kongm
 * @Create In 2013-6-7 下午2:13:37
 * TODO
 */
package net.shopin.entity;

import java.math.BigInteger;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
/**
 * 
 * @Description： 品牌排行表
 * @ClassName:BrandRank
 * @author： huyy
 * @date: 2013-7-9
 */

@Table(name = "BRAND_RANK")
@Entity
public class BrandRank {
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

    private Integer brandSid;

    

	@Column(name = "BRAND_SID",insertable=false, updatable=false)
    @Basic
    public Integer getBrandSid() {
        return brandSid;
    }

    public void setBrandSid(Integer brandSid) {
        this.brandSid = brandSid;
    }

    private Integer salesNum;

    @Column(name = "SALES_NUM")
    @Basic
    public Integer getSalesNum() {
        return salesNum;
    }

    public void setSalesNum(Integer salesNum) {
        this.salesNum = salesNum;
    }

    private Integer rankChange;

    @Column(name = "RANK_CHANGE")
    @Basic
    public Integer getRankChange() {
        return rankChange;
    }

    public void setRankChange(Integer rankChange) {
        this.rankChange = rankChange;
    }

    private Integer rankTypeSid;

    @Column(name = "RANK_TYPE_SID",insertable=false, updatable=false)
    @Basic
    public Integer getRankTypeSid() {
        return rankTypeSid;
    }

    public void setRankTypeSid(Integer rankTypeSid) {
        this.rankTypeSid = rankTypeSid;
    }

    private Integer type;

    @Column(name = "TYPE")
    @Basic
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BrandRank brandRank = (BrandRank) o;

        if (brandSid != brandRank.brandSid) return false;
        if (rankChange != brandRank.rankChange) return false;
        if (rankTypeSid != brandRank.rankTypeSid) return false;
        if (salesNum != brandRank.salesNum) return false;
        if (sid != brandRank.sid) return false;
        if (type != null ? !type.equals(brandRank.type) : brandRank.type != null) return false;

        return true;
    }


    private Brand brand;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "BRAND_SID", referencedColumnName = "SID")
    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    private RankType rankType;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "RANK_TYPE_SID", referencedColumnName = "SID")
    public RankType getRankType() {
        return rankType;
    }

    public void setRankType(RankType rankType) {
        this.rankType = rankType;
    }

	@Override
	public String toString() {
		return "BrandRank :{sid:'" + sid + "', brandSid:'" + brandSid + "', salesNum:'" + salesNum
				+ "', rankChange:'" + rankChange + "', rankTypeSid:'" + rankTypeSid + "', type:'"
				+ type;
	}
    
    
    
    
    
    
}

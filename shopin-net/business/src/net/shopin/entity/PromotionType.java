/**
 * @Probject Name: business
 * @Path: net.shopin.entity.PromotionType.java
 * @Create By jingpeng
 * @Create In 2013-7-9 上午10:45:31
 * TODO
 */
package net.shopin.entity;

import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 活动类型表
 * @Class Name PromotionType
 * @Author jingpeng
 * @Create In 2013-7-9
 */
@Table(name = "PROMOTION_TYPE")
@Entity
public class PromotionType {
    private Integer sid;

    @Column(name = "SID")
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Id
    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    private String promotionTypeName;

    @Column(name = "PROMOTION_TYPE_NAME")
    @Basic
    public String getPromotionTypeName() {
        return promotionTypeName;
    }

    public void setPromotionTypeName(String promotionTypeName) {
        this.promotionTypeName = promotionTypeName;
    }

    private String promotionTypeMemo;

    @Column(name = "PROMOTION_TYPE_MEMO")
    @Basic
    public String getPromotionTypeMemo() {
        return promotionTypeMemo;
    }

    public void setPromotionTypeMemo(String promotionTypeMemo) {
        this.promotionTypeMemo = promotionTypeMemo;
    }
    
    private Set<Promotions> promotions;
    
    @OneToMany(mappedBy = "promotionType")
	public Set<Promotions> getPromotions() {
		return promotions;
	}

	public void setPromotions(Set<Promotions> promotions) {
		this.promotions = promotions;
	}
}

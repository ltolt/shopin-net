/**
 * @Probject Name: business
 * @Path: net.shopin.entity.BrandDisplay.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午2:26:16
 * TODO
 */
package net.shopin.entity;

import java.sql.Date;
import java.sql.Timestamp;

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
 * 品牌信息表
 * @Class Name BrandDisplay
 * @Author jingpeng
 * @Create In 2013-7-9
 * 加入了工厂的概念，同时加入了相关的字段
 */
@Table(name = "BRAND_DISPLAY")
@Entity
public class BrandDisplay {
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

    private String brandName;

    @Column(name = "BRAND_NAME")
    @Basic
    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    private String brandNameSpell;

    @Column(name = "BRAND_NAME_SPELL")
    @Basic
    public String getBrandNameSpell() {
        return brandNameSpell;
    }

    public void setBrandNameSpell(String brandNameSpell) {
        this.brandNameSpell = brandNameSpell;
    }

    private String brandNameAlias;

    @Column(name = "BRAND_NAME_ALIAS")
    @Basic
    public String getBrandNameAlias() {
        return brandNameAlias;
    }

    public void setBrandNameAlias(String brandNameAlias) {
        this.brandNameAlias = brandNameAlias;
    }

    private String brandNameEn;

    @Column(name = "BRAND_NAME_EN")
    @Basic
    public String getBrandNameEn() {
        return brandNameEn;
    }

    public void setBrandNameEn(String brandNameEn) {
        this.brandNameEn = brandNameEn;
    }

    private String brandDesc;

    @Column(name = "BRAND_DESC")
    @Basic
    public String getBrandDesc() {
        return brandDesc;
    }

    public void setBrandDesc(String brandDesc) {
        this.brandDesc = brandDesc;
    }

    private String brandCreateCountry;

    @Column(name = "BRAND_CREATE_COUNTRY")
    @Basic
    public String getBrandCreateCountry() {
        return brandCreateCountry;
    }

    public void setBrandCreateCountry(String brandCreateCountry) {
        this.brandCreateCountry = brandCreateCountry;
    }

    private Timestamp brandCreateTime;
    
    @Column(name = "BRAND_CREATE_TIME")
    @Basic
    public Timestamp getBrandCreateTime() {
        return brandCreateTime;
    }

    public void setBrandCreateTime(Timestamp brandCreateTime) {
        this.brandCreateTime = brandCreateTime;
    }

    private String brandSpecialty;
    
    @Column(name = "BRAND_SPECIALTY")
    @Basic
    public String getBrandSpecialty() {
        return brandSpecialty;
    }

    public void setBrandSpecialty(String brandSpecialty) {
        this.brandSpecialty = brandSpecialty;
    }

    private String brandSuitability;

    @Column(name = "BRAND_SUITABILITY")
    @Basic
    public String getBrandSuitability() {
        return brandSuitability;
    }

    public void setBrandSuitability(String brandSuitability) {
        this.brandSuitability = brandSuitability;
    }

    private String brandPict;

    @Column(name = "BRAND_PICT")
    @Basic
    public String getBrandPict() {
        return brandPict;
    }

    public void setBrandPict(String brandPict) {
        this.brandPict = brandPict;
    }
    
    private Brand brand;
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "BRAND_SID", referencedColumnName = "SID")
    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    //是否是工厂店，1是工厂店，0不是工厂店（即，是品牌）
    private Integer isFactoryStore;

    //工厂店大图片，只保存图片地址
    private String factoryBicPic;
    //工厂店缩略图
    private String factorySmallPic;

    //活动大图片
    private String activityBigPic;

    //活动小图地址
    private String activitySmallPic;

    //工厂店排序字段，用来对页面显示的工厂店进行排序用
    private int factoryOrder;


     //工厂店的上级工厂店
    private Integer parentFactoryStore;

    @Column(name="PARENT_FACTORY_STORE_ID")
    @Basic
    
    public Integer getParentFactoryStore() {
  		return parentFactoryStore;
  	}

  	public void setParentFactoryStore(Integer parentFactoryStore) {
  		this.parentFactoryStore = parentFactoryStore;
  	}


    @Column(name="IS_FACTORY_STORE")
    @Basic
   
    public Integer getIsFactoryStore() {
		return isFactoryStore;
	}

	public void setIsFactoryStore(Integer isFactoryStore) {
		this.isFactoryStore = isFactoryStore;
	}


    @Column(name = "FACTORY_BIG_PIC")
    @Basic
    public String getFactoryBicPic() {
        return factoryBicPic;
    }

    

	public void setFactoryBicPic(String factoryBicPic) {
        this.factoryBicPic = factoryBicPic;
    }


    @Basic
    @Column(name = "FACTORY_SMALL_PIC")
    public String getFactorySmallPic() {
        return factorySmallPic;
    }

    public void setFactorySmallPic(String factorySmallPic) {
        this.factorySmallPic = factorySmallPic;
    }

    @Basic
    @Column(name = "ACTIVITY_BIG_PIC")
    public String getActivityBigPic() {
        return activityBigPic;
    }

    public void setActivityBigPic(String activityBigPic) {
        this.activityBigPic = activityBigPic;
    }

    @Basic
    @Column(name = "ACTIVITY_SMALL_PIC")
    public String getActivitySmallPic() {
        return activitySmallPic;
    }

    public void setActivitySmallPic(String activitySmallPic) {
        this.activitySmallPic = activitySmallPic;
    }


    @Basic
    @Column(name = "FACTORY_STORE_ORDER")
    public int getFactoryOrder() {
        return factoryOrder;
    }

    public void setFactoryOrder(int factoryOrder) {
        this.factoryOrder = factoryOrder;
    }

    @Basic
    @Column(name = "LOGO_PIC")
    public String getLogoPic() {
        return logoPic;
    }

    public void setLogoPic(String logoPic) {
        this.logoPic = logoPic;
    }

    //工厂店Logo图片
    private String logoPic ;
}


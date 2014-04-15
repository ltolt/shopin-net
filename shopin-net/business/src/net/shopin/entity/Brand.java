/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.entity.Brand.java
 * @Create By kongm
 * @Create In 2013-6-6 下午4:44:12
 * TODO
 */
package net.shopin.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Basic;
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
 * @Desc 品牌表(该表没有实际使用价值)
 * @Class Name Brand
 * @Author kongm
 * @Create In 2013-6-6
 * 
 */

@Table(name = "BRAND")
@Entity
public class Brand {
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

    private String brandName;

    @Column(name = "BRAND_NAME")
    @Basic
    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    private String pictureUrl;

    @Column(name = "PICTURE_URL")
    @Basic
    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    private String brandNameSecond;

    @Column(name = "BRAND_NAME_SECOND")
    @Basic
    public String getBrandNameSecond() {
        return brandNameSecond;
    }

    public void setBrandNameSecond(String brandNameSecond) {
        this.brandNameSecond = brandNameSecond;
    }

    private Integer brandActiveBit;

    @Column(name = "BRAND_ACTIVE_BIT")
    @Basic
    public Integer getBrandActiveBit() {
        return brandActiveBit;
    }

    public void setBrandActiveBit(Integer brandActiveBit) {
        this.brandActiveBit = brandActiveBit;
    }

    private String brandno;

    @Column(name = "BRANDNO")
    @Basic
    public String getBrandno() {
        return brandno;
    }

    public void setBrandno(String brandno) {
        this.brandno = brandno;
    }

    private String brandcorp;

    @Column(name = "BRANDCORP")
    @Basic
    public String getBrandcorp() {
        return brandcorp;
    }

    public void setBrandcorp(String brandcorp) {
        this.brandcorp = brandcorp;
    }

    private String brandpic1;

    @Column(name = "BRANDPIC1")
    @Basic
    public String getBrandpic1() {
        return brandpic1;
    }

    public void setBrandpic1(String brandpic1) {
        this.brandpic1 = brandpic1;
    }

    private String brandpic2;

    @Column(name = "BRANDPIC2")
    @Basic
    public String getBrandpic2() {
        return brandpic2;
    }

    public void setBrandpic2(String brandpic2) {
        this.brandpic2 = brandpic2;
    }

    private Integer blacklistBit;

    @Column(name = "PHOTO_BLACKLIST_BIT")
    @Basic
    public Integer getBlacklistBit() {
        return blacklistBit;
    }

    public void setBlacklistBit(Integer blacklistBit) {
        this.blacklistBit = blacklistBit;
    }

    private Integer parentSid;

    @Column(name = "PARENT_SID")
    @Basic
    public Integer getParentSid() {
        return parentSid;
    }

    public void setParentSid(Integer parentSid) {
        this.parentSid = parentSid;
    }

    private Integer brandRootSid;

    @Column(name = "BRAND_ROOT_SID")
    @Basic
    public Integer getBrandRootSid() {
        return brandRootSid;
    }

    public void setBrandRootSid(Integer brandRootSid) {
        this.brandRootSid = brandRootSid;
    }

    private Integer endBit;

    @Column(name = "END_BIT")
    @Basic
    public Integer getEndBit() {
        return endBit;
    }

    public void setEndBit(Integer endBit) {
        this.endBit = endBit;
    }

    private String spell;

    @Column(name = "SPELL")
    @Basic
    public String getSpell() {
        return spell;
    }

    public void setSpell(String spell) {
        this.spell = spell;
    }

    private Integer optUserSid;

    @Column(name = "OPT_USER_SID")
    @Basic
    public Integer getOptUserSid() {
        return optUserSid;
    }

    public void setOptUserSid(Integer optUserSid) {
        this.optUserSid = optUserSid;
    }

    private String optRealName;

    @Column(name = "OPT_REAL_NAME")
    @Basic
    public String getOptRealName() {
        return optRealName;
    }

    public void setOptRealName(String optRealName) {
        this.optRealName = optRealName;
    }

    private Date optUpdateTime;

    @Column(name = "OPT_UPDATE_TIME")
    @Basic
    public Date getOptUpdateTime() {
        return optUpdateTime;
    }

    public void setOptUpdateTime(Date optUpdateTime) {
        this.optUpdateTime = optUpdateTime;
    }

    @Override
    public String toString() {
        return "Brand{" +
                "sid=" + sid +
                ", brandName='" + brandName + '\'' +
                ", pictureUrl='" + pictureUrl + '\'' +
                ", brandNameSecond='" + brandNameSecond + '\'' +
                ", brandActiveBit=" + brandActiveBit +
                ", brandno='" + brandno + '\'' +
                ", brandcorp='" + brandcorp + '\'' +
                ", brandpic1='" + brandpic1 + '\'' +
                ", brandpic2='" + brandpic2 + '\'' +
                ", blacklistBit=" + blacklistBit +
                ", parentSid=" + parentSid +
                ", endBit=" + endBit +
                ", spell='" + spell + '\'' +
                ", optUserSid=" + optUserSid +
                ", optRealName='" + optRealName + '\'' +
                ", optUpdateTime=" + optUpdateTime +
                '}';
    }

    private BrandDisplay brandDisplay;

    @OneToOne(mappedBy = "brand")
    public BrandDisplay getBrandDisplay() {
        return brandDisplay;
    }

    public void setBrandDisplay(BrandDisplay brandDisplay) {
        this.brandDisplay = brandDisplay;
    }


    private Set<PageLayoutBrand> pageLayoutBrands;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "brand")
    public Set<PageLayoutBrand> getPageLayoutBrands() {
        return pageLayoutBrands;
    }

    public void setPageLayoutBrands(Set<PageLayoutBrand> pageLayoutBrands) {
        this.pageLayoutBrands = pageLayoutBrands;
    }
}


/**
 * @Probject Name: business
 * @Path: net.shopin.entity.Promotions.java
 * @Create By jingpeng
 * @Create In 2013-7-9 上午10:38:45
 * TODO
 */
package net.shopin.entity;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 活动表
 * @Class Name Promotions
 * @Author jingpeng
 * @Create In 2013-7-9
 */
@Table(name = "PROMOTIONS")
@Entity
public class Promotions {
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
    

    private String promotionVpict;
    @Column(name = "PROMOTION_VPICT")
    @Basic
    public String getPromotionVpict() {
		return promotionVpict;
	}

	public void setPromotionVpict(String promotionVpict) {
		this.promotionVpict = promotionVpict;
	}
	
	private String promotionCpict;
    @Column(name = "PROMOTION_CPICT")
    @Basic
    public String getPromotionCpict() {
		return promotionCpict;
	}

	public void setPromotionCpict(String promotionCpict) {
		this.promotionCpict = promotionCpict;
	}


	private String promotionCgpict;
    
    @Column(name = "PROMOTION_CGPICT")
    @Basic
    public String getPromotionCgpict() {
		return promotionCgpict;
	}

	public void setPromotionCgpict(String promotionCgpict) {
		this.promotionCgpict = promotionCgpict;
	}


	private Integer pageLayoutSid;

    @Column(name = "PAGE_LAYOUT_SID",insertable=false, updatable=false)
    @Basic
    public Integer getPageLayoutSid() {
        return pageLayoutSid;
    }

    public void setPageLayoutSid(Integer pageLayoutSid) {
        this.pageLayoutSid = pageLayoutSid;
    }

    private Integer pageTemplateSid;

    @Column(name = "PAGE_TEMPLATE_SID",insertable=false, updatable=false)
    @Basic
    public Integer getPageTemplateSid() {
        return pageTemplateSid;
    }

    public void setPageTemplateSid(Integer pageTemplateSid) {
        this.pageTemplateSid = pageTemplateSid;
    }

    private String promotionTitle;

    @Column(name = "PROMOTION_TITLE")
    @Basic
    public String getPromotionTitle() {
        return promotionTitle;
    }

    public void setPromotionTitle(String promotionTitle) {
        this.promotionTitle = promotionTitle;
    }

    private String promotionLink;

    @Column(name = "PROMOTION_LINK")
    @Basic
    public String getPromotionLink() {
        return promotionLink;
    }

    public void setPromotionLink(String promotionLink) {
        this.promotionLink = promotionLink;
    }

    private String promotionDesc;

    @Column(name = "PROMOTION_DESC")
    @Basic
    public String getPromotionDesc() {
        return promotionDesc;
    }

    public void setPromotionDesc(String promotionDesc) {
        this.promotionDesc = promotionDesc;
    }

    private String promotionSpict;

    @Column(name = "PROMOTION_SPICT")
    @Basic
    public String getPromotionSpict() {
        return promotionSpict;
    }

    public void setPromotionSpict(String promotionSpict) {
        this.promotionSpict = promotionSpict;
    }

    private String promotionBpict;

    @Column(name = "PROMOTION_BPICT")
    @Basic
    public String getPromotionBpict() {
        return promotionBpict;
    }

    public void setPromotionBpict(String promotionBpict) {
        this.promotionBpict = promotionBpict;
    }

    private Integer promotionStatus;

    @Column(name = "PROMOTION_STATUS")
    @Basic
    public Integer getPromotionStatus() {
        return promotionStatus;
    }

    public void setPromotionStatus(Integer promotionStatus) {
        this.promotionStatus = promotionStatus;
    }

    private Timestamp promotionBeginTime;

    @Column(name = "PROMOTION_BEGIN_TIME")
    @Basic
    public Timestamp getPromotionBeginTime() {
        return promotionBeginTime;
    }

    public void setPromotionBeginTime(Timestamp promotionBeginTime) {
        this.promotionBeginTime = promotionBeginTime;
    }

    private Timestamp promotionEndTime;

    @Column(name = "PROMOTION_END_TIME")
    @Basic
    public Timestamp getPromotionEndTime() {
        return promotionEndTime;
    }

    public void setPromotionEndTime(Timestamp promotionEndTime) {
        this.promotionEndTime = promotionEndTime;
    }

    private Integer promotionTypeSid;

    @Column(name = "PROMOTION_TYPE_SID",insertable=false, updatable=false)
    @Basic
    public Integer getPromotionTypeSid() {
        return promotionTypeSid;
    }

    public void setPromotionTypeSid(Integer promotionTypeSid) {
        this.promotionTypeSid = promotionTypeSid;
    }

    private String seq;

    @Column(name = "SEQ")
    @Basic
    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    private PageLayout pageLayout;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "PAGE_LAYOUT_SID", referencedColumnName = "SID")
    public PageLayout getPageLayout() {
        return pageLayout;
    }

    public void setPageLayout(PageLayout pageLayout) {
        this.pageLayout = pageLayout;
    }

    private PromotionType promotionType;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "PROMOTION_TYPE_SID", referencedColumnName = "SID")
    public PromotionType getPromotionType() {
        return promotionType;
    }

    public void setPromotionType(PromotionType promotionType) {
        this.promotionType = promotionType;
    }

    private PageTemplate pageTemplate;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "PAGE_TEMPLATE_SID", referencedColumnName = "SID")
    public PageTemplate getPageTemplate() {
        return pageTemplate;
    }

    public void setPageTemplate(PageTemplate pageTemplate) {
        this.pageTemplate = pageTemplate;
    }

    private Set<ShopChannels> shopChannels;

    @ManyToMany(mappedBy = "promotions")
    public Set<ShopChannels> getShopChannels() {
        return shopChannels;
    }

    public void setShopChannels(Set<ShopChannels> shopChannels) {
        this.shopChannels = shopChannels;
    }
    
    private Collection<Navigation> navigations;
    @ManyToMany
    @JoinTable(name = "NAV_PROMOTION", joinColumns = {@JoinColumn( name = "PROMOTION_SID")}, inverseJoinColumns = {@JoinColumn( name = "NAV_SID")})
	public Collection<Navigation> getNavigations() {
		return navigations;
	}

	public void setNavigations(Collection<Navigation> navigations) {
		this.navigations = navigations;
	}
    
}
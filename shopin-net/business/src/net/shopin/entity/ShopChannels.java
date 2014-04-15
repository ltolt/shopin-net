package net.shopin.entity;

import javax.persistence.*;

import java.util.Collection;
import java.util.Set;

/**
 * 
 * @author jiangzhenxue
 *
 */
@Table(name = "SHOP_CHANNELS")
@Entity
public class ShopChannels {
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

    private String displayName;

    @Column(name = "DISPLAY_NAME")
    @Basic
    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    private String channelDesc;

    @Column(name = "CHANNEL_DESC")
    @Basic
    public String getChannelDesc() {
        return channelDesc;
    }

    public void setChannelDesc(String channelDesc) {
        this.channelDesc = channelDesc;
    }

    private String name;

    @Column(name = "NAME")
    @Basic
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    private Integer flag;

    @Column(name = "FLAG")
    @Basic
    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    private String channel_url;
    @Column(name="CHANNEL_URL")
    @Basic
    public String getChannel_url() {
		return channel_url;
	}

	public void setChannel_url(String channel_url) {
		this.channel_url = channel_url;
	}
    private Integer show;
    @Column(name="IS_SHOW")
    @Basic
	public Integer getShow() {
		return show;
	}

	public void setShow(Integer show) {
		this.show = show;
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ShopChannels that = (ShopChannels) o;

        if (pageLayoutSid != that.pageLayoutSid) return false;
        if (pageTemplateSid != that.pageTemplateSid) return false;
        if (sid != that.sid) return false;
        if (channelDesc != null ? !channelDesc.equals(that.channelDesc) : that.channelDesc != null) return false;
        if (displayName != null ? !displayName.equals(that.displayName) : that.displayName != null) return false;
        if (flag != null ? !flag.equals(that.flag) : that.flag != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (seq != null ? !seq.equals(that.seq) : that.seq != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sid;
        result = 31 * result + pageLayoutSid;
        result = 31 * result + pageTemplateSid;
        result = 31 * result + (displayName != null ? displayName.hashCode() : 0);
        result = 31 * result + (channelDesc != null ? channelDesc.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (seq != null ? seq.hashCode() : 0);
        result = 31 * result + (flag != null ? flag.hashCode() : 0);
        return result;
    }

    private Set<Promotions> promotions;
    @ManyToMany
    @JoinTable(name = "CHANNEL_PROMOTION", joinColumns = { @JoinColumn(name = "SHOP_CHANNEL_SID") }, inverseJoinColumns = { @JoinColumn(name = "PROMOTIONS_SID") })
    @OrderBy(" seq desc")
    public Set<Promotions> getPromotions() {
        return promotions;
    }

    public void setPromotions(Set<Promotions> promotions) {
        this.promotions = promotions;
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

    private PageLayout pageLayout;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "PAGE_LAYOUT_SID", referencedColumnName = "SID")
    public PageLayout getPageLayout() {
        return pageLayout;
    }

    public void setPageLayout(PageLayout pageLayout) {
        this.pageLayout = pageLayout;
    }

	//    private Set<ProductClass> productClasses;
//    @ManyToMany
//    @JoinTable(name = "CHANNEL_CLASS", joinColumns = { @JoinColumn(name = "SHOP_CHANNEL_SID") }, inverseJoinColumns = { @JoinColumn(name = "PRODUCT_CLASS_SID") })    
//    @OrderBy(" nodeSeq asc ")
//    public Set<ProductClass> getProductClasses() {
//        return productClasses;
//    }
//
//    public void setProductClasses(Set<ProductClass> productClasses) {
//        this.productClasses = productClasses;
//    }
//
    private Set<SecondaryChannel> secondaryChannels;
    @OneToMany(mappedBy="shopChannels")
    public Set<SecondaryChannel> getSecondaryChannels() {
        return secondaryChannels;
    }

    public void setSecondaryChannels(Set<SecondaryChannel> secondaryChannels) {
        this.secondaryChannels = secondaryChannels;
    }
//
//    private Collection<Users> users;
//
//    @ManyToMany
//    @JoinTable(name = "USER_CHANNEL", joinColumns = { @JoinColumn(name = "CHANNEL_SID") }, inverseJoinColumns = { @JoinColumn(name = "USERS_SID") })
//    public Collection<Users> getUsers() {
//        return users;
//    }
//
//    public void setUsers(Collection<Users> users) {
//        this.users = users;
//    }
}

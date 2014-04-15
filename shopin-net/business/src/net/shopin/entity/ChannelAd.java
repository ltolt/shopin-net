package net.shopin.entity;

import javax.persistence.*;

/**
 * 
 * @Class Name ChannelAd
 * @Author jiangzhenxue
 * @Create In 2013-7-9
 * 频道广告表
 */
@Table(name = "CHANNEL_AD")
@Entity
public class ChannelAd {
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

    private Integer shopChannelSid;

    @Column(name = "SHOP_CHANNEL_SID",insertable=false, updatable=false)
    @Basic
    public Integer getShopChannelSid() {
        return shopChannelSid;
    }

    public void setShopChannelSid(Integer shopChannelSid) {
        this.shopChannelSid = shopChannelSid;
    }

    private String positiotag;

    @Column(name = "POSITIOTAG")
    @Basic
    public String getPositiotag() {
        return positiotag;
    }

    public void setPositiotag(String positiotag) {
        this.positiotag = positiotag;
    }

    private String positioname;

    @Column(name = "POSITIONAME")
    @Basic
    public String getPositioname() {
        return positioname;
    }

    public void setPositioname(String positioname) {
        this.positioname = positioname;
    }

    private String pic;

    @Column(name = "PIC")
    @Basic
    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    private String link;

    @Column(name = "LINK")
    @Basic
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    private String memo;

    @Column(name = "MEMO")
    @Basic
    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ChannelAd channelAd = (ChannelAd) o;

        if (shopChannelSid != channelAd.shopChannelSid) return false;
        if (sid != channelAd.sid) return false;
        if (link != null ? !link.equals(channelAd.link) : channelAd.link != null) return false;
        if (memo != null ? !memo.equals(channelAd.memo) : channelAd.memo != null) return false;
        if (pic != null ? !pic.equals(channelAd.pic) : channelAd.pic != null) return false;
        if (positioname != null ? !positioname.equals(channelAd.positioname) : channelAd.positioname != null)
            return false;
        if (positiotag != null ? !positiotag.equals(channelAd.positiotag) : channelAd.positiotag != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sid;
        result = 31 * result + (shopChannelSid != null ? shopChannelSid.hashCode() : 0);
        result = 31 * result + (positiotag != null ? positiotag.hashCode() : 0);
        result = 31 * result + (positioname != null ? positioname.hashCode() : 0);
        result = 31 * result + (pic != null ? pic.hashCode() : 0);
        result = 31 * result + (link != null ? link.hashCode() : 0);
        result = 31 * result + (memo != null ? memo.hashCode() : 0);
        return result;
    }

    private ShopChannels shopChannels;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SHOP_CHANNEL_SID", referencedColumnName = "SID")
    public ShopChannels getShopChannels() {
        return shopChannels;
    }

    public void setShopChannels(ShopChannels shopChannels) {
        this.shopChannels = shopChannels;
    }
}
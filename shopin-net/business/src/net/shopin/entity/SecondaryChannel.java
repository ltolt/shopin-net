package net.shopin.entity;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-1-15
 * Time: 13:37:11
 * 二级频道表
 */
@Table(name = "SECONDARY_CHANNEL")
@Entity
public class SecondaryChannel {
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

    private String name;

    @Column(name = "NAME")
    @Basic
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    private Integer seq;

    @Column(name = "SEQ")
    @Basic
    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SecondaryChannel that = (SecondaryChannel) o;

        if (shopChannelSid != that.shopChannelSid) return false;
        if (sid != that.sid) return false;
        if (link != null ? !link.equals(that.link) : that.link != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (seq != null ? !seq.equals(that.seq) : that.seq != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sid;
        result = 31 * result + (shopChannelSid != null ? shopChannelSid.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (link != null ? link.hashCode() : 0);
        result = 31 * result + (seq != null ? seq.hashCode() : 0);
        return result;
    }

    private ShopChannels shopChannels;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "SHOP_CHANNEL_SID", referencedColumnName = "SID")
    public ShopChannels getShopChannels() {
        return shopChannels;
    }

    public void setShopChannels(ShopChannels shopChannels) {
        this.shopChannels = shopChannels;
    }
}

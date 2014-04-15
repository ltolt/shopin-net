package net.shopin.entity;

import javax.persistence.*;

import java.util.Set;
/**
 * 公告类型表
 * @Class Name NoticeType
 * @Author huyy
 * @Create In 2013-7-12
 */
@Table(name = "NOTICE_TYPE")
@Entity
public class NoticeType {
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

    private String name;

    @Column(name = "NAME")
    @Basic
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

        NoticeType that = (NoticeType) o;

        if (sid != that.sid) return false;
        if (memo != null ? !memo.equals(that.memo) : that.memo != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sid;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (memo != null ? memo.hashCode() : 0);
        return result;
    }

    private Set<ShopNotices> shopNotices;
    @OneToMany(mappedBy="noticeType")
    public Set<ShopNotices> getShopNotices() {
        return shopNotices;
    }

    public void setShopNotices(Set<ShopNotices> shopNotices) {
        this.shopNotices = shopNotices;
    }
}

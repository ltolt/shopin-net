/**
 * @Probject Name: business
 * @Path: net.shopin.entity.PageTemplate.java
 * @Create By jingpeng
 * @Create In 2013-7-9 上午10:40:02
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
 * 页面模版表
 * @Class Name PageTemplate
 * @Author jingpeng
 * @Create In 2013-7-9
 */
@Table(name="PAGE_TEMPLATE")
@Entity
public class PageTemplate {
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

    private String page;

    @Column(name = "PAGE")
    @Basic
    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
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

        PageTemplate that = (PageTemplate) o;

        if (sid != that.sid) return false;
        if (type != that.type) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (page != null ? !page.equals(that.page) : that.page != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sid;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (page != null ? page.hashCode() : 0);
        result = 31 * result + type;
        return result;
    }


    Set<ShopChannels> channels;
    
    @OneToMany(mappedBy="pageTemplate")
    public Set<ShopChannels> getChannels() {
        return channels;
    }

    public void setChannels(Set<ShopChannels> channels) {
        this.channels = channels;
    }

    Set<Promotions> promotions;

    @OneToMany(mappedBy="pageTemplate")
    public Set<Promotions> getPromotions() {
        return promotions;
    }

    public void setPromotions(Set<Promotions> promotions) {
        this.promotions = promotions;
    }
}

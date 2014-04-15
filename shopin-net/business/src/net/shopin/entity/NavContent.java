/**
 * @Probject Name: business
 * @Path: net.shopin.entity.NavContent.java
 * @Create By jiangzhenxue
 * @Create In 2013-7-22 下午2:06:09
 * TODO
 */
package net.shopin.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author jiangzhenxue
 * 
 */

@Table(name = "NAV_CONTENT")
@Entity
public class NavContent {
    private Long sid;
    private Long navSid;
    private String mainTitle;
    private String subTitle;
    private String link;
    private String pic;
    private Navigation navigation;

    @Column(name = "SID")
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Long getSid() {
	return sid;
    }

    public void setSid(Long sid) {
	this.sid = sid;
    }

    @Column(name = "NAV_SID", insertable = false, updatable = false)
    @Basic
    public Long getNavSid() {
	return navSid;
    }

    public void setNavSid(Long navSid) {
	this.navSid = navSid;
    }

    @Column(name = "MAIN_TITLE")
    @Basic
    public String getMainTitle() {
	return mainTitle;
    }

    public void setMainTitle(String mainTitle) {
	this.mainTitle = mainTitle;
    }

    @Column(name = "SUB_TITLE")
    @Basic
    public String getSubTitle() {
	return subTitle;
    }

    public void setSubTitle(String subTitle) {
	this.subTitle = subTitle;
    }

    @Column(name = "LINK")
    @Basic
    public String getLink() {
	return link;
    }

    public void setLink(String link) {
	this.link = link;
    }

    @Column(name = "PIC")
    @Basic
    public String getPic() {
	return pic;
    }

    public void setPic(String pic) {
	this.pic = pic;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "NAV_SID", referencedColumnName = "SID")
    public Navigation getNavigation() {
	return navigation;
    }

    public void setNavigation(Navigation navigation) {
	this.navigation = navigation;
    }
}

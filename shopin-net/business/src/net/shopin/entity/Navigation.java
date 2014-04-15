/**
 * @Probject Name: business
 * @Path: net.shopin.entity.Navigation.java
 * @Create By jingpeng
 * @Create In 2013-7-22 上午11:29:10
 * TODO
 */
package net.shopin.entity;

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
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @Class Name Navigation
 * @Author jingpeng
 * @Create In 2013-7-22
 */
@Table(name = "NAVIGATION")
@Entity
public class Navigation {
	private Long sid;
	private String classSid;
	private Long navSid;
	private String name;
	private String link;
	private String icon;
	private String linkBrand;
	private Integer seq;
	private Integer	flag;
	private Integer navLevel;
	private Integer show;
	private Integer channelSid;
	

	@Column(name = "IS_SHOW")
	@Basic
	public Integer getShow() {
		return show;
	}
	public void setShow(Integer show) {
		this.show = show;
	}
	@Column(name = "SID")
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Long getSid() {
		return sid;
	}
	
	@Column(name = "CLASS_SID")
	@Basic
	public String getClassSid() {
		return classSid;
	}
	public void setClassSid(String classSid) {
		this.classSid = classSid;
	}
	
	@Column(name = "LINK_BRAND")
	@Basic
	public String getLinkBrand() {
		return linkBrand;
	}
	public void setLinkBrand(String linkBrand) {
		this.linkBrand = linkBrand;
	}
	public void setSid(Long sid) {
		this.sid = sid;
	}
	
	@Column(name = "NAME")
	@Basic
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "LINK")
	@Basic
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	@Column(name = "ICON")
	@Basic
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	@Column(name = "SEQ")
	@Basic
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	
	@Column(name = "FLAG")
	@Basic
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
	@Column(name = "NAV_SID", insertable= false, updatable = false)
	@Basic
	public Long getNavSid() {
		return navSid;
	}
	public void setNavSid(Long navSid) {
		this.navSid = navSid;
	}
	
	@Column(name = "NAV_LEVEL")
	@Basic
	public Integer getNavLevel() {
		return navLevel;
	}
	public void setNavLevel(Integer navLevel) {
		this.navLevel = navLevel;
	}

	@Column(name = "CHANNEL_SID")
	@Basic
	public Integer getChannelSid() {
		return channelSid;
	}
	public void setChannelSid(Integer channelSid) {
		this.channelSid = channelSid;
	}
	
	private Set<Navigation> childrenNavigation;
	
	@OneToMany(mappedBy = "navigation")
	public Set<Navigation> getChildrenNavigation() {
		return childrenNavigation;
	}
	public void setChildrenNavigation(Set<Navigation> childrenNavigation) {
		this.childrenNavigation = childrenNavigation;
	}
	
	private Set<NavBrand> navBrands;
	
	@OneToMany(mappedBy = "navigation")
	public Set<NavBrand> getNavBrands() {
		return navBrands;
	}
	public void setNavBrands(Set<NavBrand> navBrands) {
		this.navBrands = navBrands;
	}

	private Navigation navigation;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NAV_SID", referencedColumnName = "SID")
	public Navigation getNavigation() {
		return navigation;
	}
	public void setNavigation(Navigation navigation) {
		this.navigation = navigation;
	}
	
	private Collection<Promotions> promotions;

	@ManyToMany
	@JoinTable(name = "NAV_PROMOTION", joinColumns = { @JoinColumn( name = "NAV_SID")}, inverseJoinColumns = { @JoinColumn( name = "PROMOTION_SID")})
	public Collection<Promotions> getPromotions() {
		return promotions;
	}
	public void setPromotions(Collection<Promotions> promotions) {
		this.promotions = promotions;
	}
	
}

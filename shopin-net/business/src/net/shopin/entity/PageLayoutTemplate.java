/**
 * @Probject Name: business
 * @Path: net.shopin.entity.PageLayoutTemplate.java
 * @Create By wangdg
 * @Create In 2013-7-9 上午10:37:24
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
import javax.persistence.OrderBy;
import javax.persistence.Table;

/**
 * @Class Name PageLayoutTemplate
 * @Author wangdg
 * @Create In 2013-7-9
 */
@Table(name = "PAGE_LAYOUT_TEMPLATE")
@Entity
public class PageLayoutTemplate {

	private Integer sid;

	@Column(name = "SID")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
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

	private String template;

	@Column(name = "TEMPLATE")
	@Basic
	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
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

	private Integer minProQuantity;

	@Column(name = "MIN_PRO_QUANTITY")
	@Basic
	public Integer getMinProQuantity() {
		return minProQuantity;
	}

	public void setMinProQuantity(Integer minProQuantity) {
		this.minProQuantity = minProQuantity;
	}

	private Integer maxProQuantity;

	@Column(name = "MAX_PRO_QUANTITY")
	@Basic
	public Integer getMaxProQuantity() {
		return maxProQuantity;
	}

	public void setMaxProQuantity(Integer maxProQuantity) {
		this.maxProQuantity = maxProQuantity;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		PageLayoutTemplate that = (PageLayoutTemplate) o;

		if (sid != that.sid) return false;
		if (memo != null ? !memo.equals(that.memo) : that.memo != null)	return false;
		if (name != null ? !name.equals(that.name) : that.name != null)	return false;
		if (template != null ? !template.equals(that.template) : that.template != null)	return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = sid;
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (template != null ? template.hashCode() : 0);
		result = 31 * result + (memo != null ? memo.hashCode() : 0);
		return result;
	}

	private Set<PageLayout> pageLayouts;

	@OneToMany(mappedBy = "pageLayoutTemplate")
	@OrderBy(" seq asc")
	public Set<PageLayout> getPageLayouts() {
		return pageLayouts;
	}

	public void setPageLayouts(Set<PageLayout> pageLayouts) {
		this.pageLayouts = pageLayouts;
	}
}

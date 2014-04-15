package net.shopin.entity;

import org.hibernate.annotations.Where;

import javax.persistence.*;

import java.util.Set;

/**
 * 
 * @Description： 排行分类表
 * @ClassName:RankType
 * @author： huyy
 * @date: 2013-7-9
 */
@Table(name = "RANK_TYPE")
@Entity
public class RankType {
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

	private String displayOrder;

	@Column(name = "DISPLAY_ORDER")
	@Basic
	public String getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(String displayOrder) {
		this.displayOrder = displayOrder;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		RankType rankType = (RankType) o;

		if (sid != rankType.sid)
			return false;
		if (displayOrder != null ? !displayOrder.equals(rankType.displayOrder)
				: rankType.displayOrder != null)
			return false;
		if (name != null ? !name.equals(rankType.name) : rankType.name != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = sid;
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result
				+ (displayOrder != null ? displayOrder.hashCode() : 0);
		return result;
	}

	private Set<Brand> brands;

	@OneToMany
	@JoinTable(name = "BRAND_RANK", joinColumns = { @JoinColumn(name = "RANK_TYPE_SID") }, inverseJoinColumns = { @JoinColumn(name = "BRAND_SID") })
	// @OrderBy(" SALES_NUM desc")
	public Set<Brand> getBrands() {
		return brands;
	}

	public void setBrands(Set<Brand> brands) {
		this.brands = brands;
	}

	private Set<BrandRank> brandRanks;

	@OneToMany(mappedBy = "rankType")
	@OrderBy(" salesNum desc")
	public Set<BrandRank> getBrandRanks() {
		return brandRanks;
	}

	public void setBrandRanks(Set<BrandRank> brandRanks) {
		this.brandRanks = brandRanks;
	}
}

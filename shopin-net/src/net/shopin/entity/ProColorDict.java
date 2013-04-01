package net.shopin.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 颜色字典表
 * 
 * @author Administrator
 * 
 */
@Table(name = "PRO_COLOR_DICT")
@Entity
public class ProColorDict {

	private Integer sid;
	private String proColor;
	private String proColorDesc;
	private Integer proColorBit;
	private Integer brandSid;

	@Column(name = "SID")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	@Column(name = "PRO_COLOR")
	@Basic
	public String getProColor() {
		return proColor;
	}

	public void setProColor(String proColor) {
		this.proColor = proColor;
	}

	@Column(name = "PRO_COLOR_DESC")
	@Basic
	public String getProColorDesc() {
		return proColorDesc;
	}

	public void setProColorDesc(String proColorDesc) {
		this.proColorDesc = proColorDesc;
	}

	@Column(name = "PRO_COLOR_BIT")
	@Basic
	public Integer getProColorBit() {
		return proColorBit;
	}

	public void setProColorBit(Integer proColorBit) {
		this.proColorBit = proColorBit;
	}

	@Column(name = "BRAND_SID")
	@Basic
	public Integer getBrandSid() {
		return brandSid;
	}

	public void setBrandSid(Integer brandSid) {
		this.brandSid = brandSid;
	}

	@Override
	public String toString() {
		return String
				.format("ProColorDict :{sid:'%s', proColor:'%s', proColorDesc:'%s', proColorBit:'%s', brandSid:'%s'}",
						sid, proColor, proColorDesc, proColorBit, brandSid);
	}

	
}

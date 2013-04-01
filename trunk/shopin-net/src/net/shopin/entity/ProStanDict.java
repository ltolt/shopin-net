package net.shopin.entity;

import java.math.BigInteger;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 规格字典表
 * 
 * @author Administrator
 * 
 */
@Table(name = "PRO_STAN_DICT")
@Entity
public class ProStanDict {
	private Integer sid;
	private Integer proClassDictSid;
	private String proStanName;
	private Integer brandSid;
	private BigInteger proStanBit;

	@Column(name = "SID")
	@Id
	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	@Column(name = "PRO_CLASS_DICT_SID")
	@Basic
	public Integer getProClassDictSid() {
		return proClassDictSid;
	}

	public void setProClassDictSid(Integer proClassDictSid) {
		this.proClassDictSid = proClassDictSid;
	}

	@Column(name = "PRO_STAN_NAME")
	@Basic
	public String getProStanName() {
		return proStanName;
	}

	public void setProStanName(String proStanName) {
		this.proStanName = proStanName;
	}

	@Column(name = "BRAND_SID")
	@Basic
	public Integer getBrandSid() {
		return brandSid;
	}

	public void setBrandSid(Integer brandSid) {
		this.brandSid = brandSid;
	}

	@Column(name = "PRO_STAN_BIT")
	@Basic
	public BigInteger getProStanBit() {
		return proStanBit;
	}

	public void setProStanBit(BigInteger proStanBit) {
		this.proStanBit = proStanBit;
	}

}

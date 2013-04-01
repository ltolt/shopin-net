package net.shopin.entity;

import java.math.BigInteger;

import javax.annotation.Generated;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品分类字典表
 * 
 * @author Administrator
 * 
 */
@Table(name = "PRO_CLASS_DICT")
@Entity
public class ProClassDict {
	private Integer sid;
	private String proClassNum;
	private String proClassDesc;
	private Integer classMasterSid;
	private BigInteger proBit;
	private Integer proLevel;
	private String classMasterNum;

	private BigInteger proClassBit;

	@Column(name = "SID")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	@Column(name = "PRO_CLASS_NUM")
	@Basic
	public String getProClassNum() {
		return proClassNum;
	}

	public void setProClassNum(String proClassNum) {
		this.proClassNum = proClassNum;
	}

	@Column(name = "PRO_CLASS_DESC")
	@Basic
	public String getProClassDesc() {
		return proClassDesc;
	}

	public void setProClassDesc(String proClassDesc) {
		this.proClassDesc = proClassDesc;
	}

	/**
	 * 父节点
	 * 
	 * @return
	 */
	@Column(name = "CLASS_MASTER_SID")
	@Basic
	public Integer getClassMasterSid() {
		return classMasterSid;
	}

	public void setClassMasterSid(Integer classMasterSid) {
		this.classMasterSid = classMasterSid;
	}

	@Column(name = "PRO_BIT")
	@Basic
	public BigInteger getProBit() {
		return proBit;
	}

	public void setProBit(BigInteger proBit) {
		this.proBit = proBit;
	}

	@Column(name = "PRO_LEVEL")
	@Basic
	public Integer getProLevel() {
		return proLevel;
	}

	public void setProLevel(Integer proLevel) {
		this.proLevel = proLevel;
	}

	@Column(name = "CLASS_MASTER_NUM")
	@Basic
	public String getClassMasterNum() {
		return classMasterNum;
	}

	public void setClassMasterNum(String classMasterNum) {
		this.classMasterNum = classMasterNum;
	}

	@Column(name = "PRO_CLASS_BIT")
	@Basic
	public BigInteger getProClassBit() {
		return proClassBit;
	}

	public void setProClassBit(BigInteger proClassBit) {
		this.proClassBit = proClassBit;
	}

	@Override
	public String toString() {
		return String
				.format("ProClassDict :{sid:'%s', proClassNum:'%s', proClassDesc:'%s', classMasterSid:'%s', proBit:'%s', proLevel:'%s', classMasterNum:'%s', proClassBit:'%s}",
						sid, proClassNum, proClassDesc, classMasterSid, proBit,
						proLevel, classMasterNum, proClassBit);
	}
	
	

}

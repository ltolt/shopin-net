package net.shopin.entity;

import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

/**
 * 网站商品分类表
 * 
 * @author Administrator
 * 
 */
@Table(name = "PRODUCT_CLASS")
@Entity
public class ProductClass {

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

	private String serialNumber;

	@Column(name = "SERIAL_NUMBER")
	@Basic
	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	private String nodeName;

	@Column(name = "NODE_NAME")
	@Basic
	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	private Integer fatherNodeSid;

	@Column(name = "FATHER_NODE_SID", insertable = false, updatable = false)
	@Basic
	public Integer getFatherNodeSid() {
		return fatherNodeSid;
	}

	public void setFatherNodeSid(Integer fatherNodeSid) {
		this.fatherNodeSid = fatherNodeSid;
	}

	private Integer isLeaf;

	@Column(name = "IS_LEAF")
	@Basic
	public Integer getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(Integer leaf) {
		isLeaf = leaf;
	}

	private Integer rootNodeSid;

	@Column(name = "ROOT_NODE_SID")
	@Basic
	public Integer getRootNodeSid() {
		return rootNodeSid;
	}

	public void setRootNodeSid(Integer rootNodeSid) {
		this.rootNodeSid = rootNodeSid;
	}

	private Integer nodeLevel;

	@Column(name = "NODE_LEVEL")
	@Basic
	public Integer getNodeLevel() {
		return nodeLevel;
	}

	public void setNodeLevel(Integer nodeLevel) {
		this.nodeLevel = nodeLevel;
	}

	private String nodeSeq;

	@Column(name = "NODE_SEQ")
	@Basic
	public String getNodeSeq() {
		return nodeSeq;
	}

	public void setNodeSeq(String nodeSeq) {
		this.nodeSeq = nodeSeq;
	}

	private Integer isDisplay;

	@Column(name = "IS_DISPLAY")
	@Basic
	public Integer getIsDisplay() {
		return isDisplay;
	}

	public void setIsDisplay(Integer display) {
		isDisplay = display;
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
	
	private ProductClass fatherProductClass;

	@ManyToOne
	@JoinColumn(name = "FATHER_NODE_SID",referencedColumnName = "SID")
	public ProductClass getFatherProductClass() {
		return fatherProductClass;
	}

	public void setFatherProductClass(ProductClass fatherProductClass) {
		this.fatherProductClass = fatherProductClass;
	}

	private Set<ProductClass> childProductClasses;

	@OneToMany(mappedBy = "fatherProductClass")
	@OrderBy("nodeSeq asc")
	public Set<ProductClass> getChildProductClasses() {
		return childProductClasses;
	}

	public void setChildProductClasses(Set<ProductClass> childProductClasses) {
		this.childProductClasses = childProductClasses;
	}

	private Set<ProductList> productLists;
	
	
	
	@ManyToMany(mappedBy = "productClasses")
	public Set<ProductList> getProductLists() {
		return productLists;
	}

	public void setProductLists(Set<ProductList> productLists) {
		this.productLists = productLists;
	}

	@Override
	public String toString() {
		return "ProductClass [sid=" + sid + ", serialNumber=" + serialNumber
				+ ", nodeName=" + nodeName + ", fatherNodeSid=" + fatherNodeSid
				+ ", isLeaf=" + isLeaf + ", rootNodeSid=" + rootNodeSid
				+ ", nodeLevel=" + nodeLevel + ", nodeSeq=" + nodeSeq
				+ ", isDisplay=" + isDisplay + ", memo=" + memo+ "]";
	}
	
	
	
	

}

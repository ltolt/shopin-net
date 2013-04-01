package net.shopin.view;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;
import java.util.TreeMap;

/**
 * 实体类 :productClass
 * 
 * @author Administrator
 * 
 */
public class ProductCateVO implements Serializable {
	private Integer sid;
	private String serialNumber;// 分类编码
	private String nodeName;// 节点名称
	private String fatherNodeSid;// 父节点
	private String rootNodeSid;// 第一级节点
	private String nodeSeq;//
	private String isDisplay;// 是否显示
	private String nodeLevel;
	private String memo; // 备注
	private int productCount; // 品类商品数量

	private ProductCateVO parentCate; // 父分类

	private Map<String, ProductCateVO> childCatesMap = new TreeMap<String, ProductCateVO>();// 子品类

	private Collection<ProductCateVO> childCates;// 子品类列表

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public String getFatherNodeSid() {
		return fatherNodeSid;
	}

	public void setFatherNodeSid(String fatherNodeSid) {
		this.fatherNodeSid = fatherNodeSid;
	}

	public String getRootNodeSid() {
		return rootNodeSid;
	}

	public void setRootNodeSid(String rootNodeSid) {
		this.rootNodeSid = rootNodeSid;
	}

	public String getNodeSeq() {
		return nodeSeq;
	}

	public void setNodeSeq(String nodeSeq) {
		this.nodeSeq = nodeSeq;
	}

	public String getIsDisplay() {
		return isDisplay;
	}

	public void setIsDisplay(String isDisplay) {
		this.isDisplay = isDisplay;
	}

	public String getNodeLevel() {
		return nodeLevel;
	}

	public void setNodeLevel(String nodeLevel) {
		this.nodeLevel = nodeLevel;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public ProductCateVO getParentCate() {
		return parentCate;
	}

	public void setParentCate(ProductCateVO parentCate) {
		this.parentCate = parentCate;
	}

	public Map<String, ProductCateVO> getChildCatesMap() {
		return childCatesMap;
	}

	public void setChildCatesMap(Map<String, ProductCateVO> childCatesMap) {
		this.childCatesMap = childCatesMap;
	}

	public Collection<ProductCateVO> getChildCates() {
		return childCates;
	}

	public void setChildCates(Collection<ProductCateVO> childCates) {
		this.childCates = childCates;
	}

	@Override
	public String toString() {
		return "ProductCateVO [sid=" + sid + ", serialNumber=" + serialNumber
				+ ", nodeName=" + nodeName + ", fatherNodeSid=" + fatherNodeSid
				+ ", rootNodeSid=" + rootNodeSid + ", nodeSeq=" + nodeSeq
				+ ", isDisplay=" + isDisplay + ", nodeLevel=" + nodeLevel
				+ ", memo=" + memo + ", productCount=" + productCount + "]";
	}

}

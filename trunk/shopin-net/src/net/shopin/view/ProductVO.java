package net.shopin.view;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Lucas kong 商品VO 对应实体entity ProductList
 * 
 */
public class ProductVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 商品Sid
	private String sid;
	// 品牌Sid
	private String brandSid;
	// sku
	private String proSku;

	// 商品描述
	private String proDesc;
	// 是否启用0未启用 1启用 默认 1
	private String proActiveBit;
	// 是否上架0未上架 1上架 默认 0
	private String proSelling;
	// 商品类型（是否是正式商品） 0 非正式商品 1 正式商品
	private String proType;
	// 商品名称,默认值 款式+材质(显示名称)+2及分类+sku
	private String productName;
	 /*上架时间，数据库新增*/
	private Date proSellingTime;
	//品牌
	private BrandVO brand;
	
	
	
	public BrandVO getBrand() {
		return brand;
	}

	public void setBrand(BrandVO brand) {
		this.brand = brand;
	}

	public Date getProSellingTime() {
		return proSellingTime;
	}

	public void setProSellingTime(Date proSellingTime) {
		this.proSellingTime = proSellingTime;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getBrandSid() {
		return brandSid;
	}

	public void setBrandSid(String brandSid) {
		this.brandSid = brandSid;
	}

	public String getProSku() {
		return proSku;
	}

	public void setProSku(String proSku) {
		this.proSku = proSku;
	}

	public String getProDesc() {
		return proDesc;
	}

	public void setProDesc(String proDesc) {
		this.proDesc = proDesc;
	}

	public String getProActiveBit() {
		return proActiveBit;
	}

	public void setProActiveBit(String proActiveBit) {
		this.proActiveBit = proActiveBit;
	}

	public String getProSelling() {
		return proSelling;
	}

	public void setProSelling(String proSelling) {
		this.proSelling = proSelling;
	}

	public String getProType() {
		return proType;
	}

	public void setProType(String proType) {
		this.proType = proType;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "ProductVO [sid=" + sid + ", brandSid=" + brandSid + ", proSku="
				+ proSku + ", proDesc=" + proDesc + ", proActiveBit="
				+ proActiveBit + ", proSelling=" + proSelling + ", proType="
				+ proType + ", productName=" + productName
				+ ", proSellingTime=" + proSellingTime + ", brand=" + brand
				+ "]";
	}


	

	
	
	

}

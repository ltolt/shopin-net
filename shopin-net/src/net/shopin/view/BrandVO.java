package net.shopin.view;

import java.io.Serializable;
/**
 *  品牌View
 * @author Lucas k
 *
 */
public class BrandVO implements Serializable
{
	//品牌id
	private String sid;
	//品牌名称
	private String brandName;
	//别名
	private String brandNameSecond;
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getBrandNameSecond() {
		return brandNameSecond;
	}
	public void setBrandNameSecond(String brandNameSecond) {
		this.brandNameSecond = brandNameSecond;
	}
	@Override
	public String toString() {
		return "BrandVO [sid=" + sid + ", brandName=" + brandName
				+ ", brandNameSecond=" + brandNameSecond + "]";
	}
	
	
	
	
	

}

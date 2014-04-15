package net.shopin.web.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 用于在商品页面展示销售记录
 * @Class Name OrderRecord
 * @Author liheng
 * @Create In 2013-12-25
 */
public class OrderRecordVO implements Serializable {
	/**
	 * @Field long serialVersionUID 
	 */
	private static final long serialVersionUID = 3834950452410789558L;
	private String saleTime;//购买时间
	private String memberEmail; //会员邮箱
    private  String proSize ; // 商品规格
    private  String proColor ; // 商品色码
    private  Integer saleSum ; // 销售数量

	
	
	
	public String getSaleTime() {
		return saleTime;
	}
	public void setSaleTime(String saleTime) {
		this.saleTime = saleTime;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getProSize() {
		return proSize;
	}
	public void setProSize(String proSize) {
		this.proSize = proSize;
	}
	public String getProColor() {
		return proColor;
	}
	public void setProColor(String proColor) {
		this.proColor = proColor;
	}
	public Integer getSaleSum() {
		return saleSum;
	}
	public void setSaleSum(Integer saleSum) {
		this.saleSum = saleSum;
	}

}

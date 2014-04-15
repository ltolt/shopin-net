package net.shopin.web.vo;

import java.util.List;

public class PayTypeVO {
	
	private Long sid;
	private String name;
	private List<PaymentTypeDetail> paymentTypeList ;
	public Long getSid() {
		return sid;
	}
	public void setSid(Long sid) {
		this.sid = sid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<PaymentTypeDetail> getPaymentTypeList() {
		return paymentTypeList;
	}
	public void setPaymentTypeList(List<PaymentTypeDetail> paymentTypeList) {
		this.paymentTypeList = paymentTypeList;
	}
	
	

}

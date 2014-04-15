/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.entity.PaymentType.java
 * @Create By jingpeng
 * @Create In 2013-6-13 下午6:55:40
 * TODO
 */
package net.shopin.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 支付方式表
 * @Class Name PaymentType
 * @Author huyy
 * @Create In 2013-7-12
 */
@Table(name = "PAYMENT_TYPE")
@Entity
public class PaymentType {

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

	private String memo;

	@Column(name = "MEMO")
	@Basic
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	private Integer show;

	@Column(name = "IS_SHOW")
	@Basic
	public Integer getShow() {
		return show;
	}

	public void setShow(Integer show) {
		this.show = show;
	}

	private String url;

	@Column(name = "URL")
	@Basic
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	private Integer seq;

	@Column(name = "SEQ")
	@Basic
	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	private Integer paymentTypeClassSid;

	@Column(name = "PAYMENT_TYPE_CLASS_SID", insertable = false, updatable = false)
	@Basic
	public Integer getPaymentTypeClassSid() {
		return paymentTypeClassSid;
	}

	public void setPaymentTypeClassSid(Integer paymentTypeClassSid) {
		this.paymentTypeClassSid = paymentTypeClassSid;
	}

	private PaymentTypeClass paymentTypeClass;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PAYMENT_TYPE_CLASS_SID", referencedColumnName = "SID")
	public PaymentTypeClass getPaymentTypeClass() {
		return paymentTypeClass;
	}

	public void setPaymentTypeClass(PaymentTypeClass paymentTypeClass) {
		this.paymentTypeClass = paymentTypeClass;
	}

}

/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.entity.PaymentTypeClass.java
 * @Create By jingpeng
 * @Create In 2013-6-13 下午4:00:06
 * TODO
 */
package net.shopin.entity;

import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 支付方式类表
 * @Class Name PaymentTypeClass
 * @Author huyy
 * @Create In 2013-7-12
 */
@Table(name = "PAYMENT_TYPE_CLASS")
@Entity
public class PaymentTypeClass {

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

	private Integer seq;

	@Column(name = "SEQ")
	@Basic
	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
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

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		PaymentTypeClass that = (PaymentTypeClass) o;

		if (sid != that.sid)
			return false;
		if (name != null ? !name.equals(that.name) : that.name != null)
			return false;
		if (show != null ? !show.equals(that.show) : that.show != null)
			return false;
		if (seq != null ? !seq.equals(that.seq) : that.seq != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = sid;
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (show != null ? show.hashCode() : 0);
		result = 31 * result + seq;
		return result;
	}

	private Set<PaymentType> paymentTypes;

	@OneToMany(mappedBy = "paymentTypeClass", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	public Set<PaymentType> getPaymentTypes() {
		return paymentTypes;
	}

	public void setPaymentTypes(Set<PaymentType> paymentTypes) {
		this.paymentTypes = paymentTypes;
	}

}

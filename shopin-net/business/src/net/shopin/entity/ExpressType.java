/**
 * @Probject Name: business
 * @Path: net.shopin.entity.ExpressType.java
 * @Create By jingpeng
 * @Create In 2013-7-10 下午2:05:45
 * TODO
 */
package net.shopin.entity;

import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 邮费类型表
 * @Class Name ExpressType
 * @Author jingpeng
 * @Create In 2013-7-10
 */
@Table(name = "EXPRESS_TYPE")
@Entity
public class ExpressType {
    private Long sid;

    @Column(name = "SID")
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)

    public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	private String expressName;
	
	@Column(name = "EXPRESS_NAME")
    @Basic
    public String getExpressName() {
        return expressName;
    }

    public void setExpressName(String expressName) {
        this.expressName = expressName;
    }

    private String expressMemo;

    @Column(name = "EXPRESS_MEMO")
    @Basic
    public String getExpressMemo() {
        return this.expressMemo;
    }

    public void setExpressMemo(String expressMemo) {
        this.expressMemo = expressMemo;
    }

    private Set<ExpressCharge> expressCharges;

    @OneToMany(mappedBy="expressType")
    public Set<ExpressCharge> getExpressCharges() {
        return this.expressCharges;
    }

    public void setExpressCharges(Set<ExpressCharge> expressCharges) {
        this.expressCharges = expressCharges;
    }
}


/**
 * @Probject Name: business
 * @Path: net.shopin.entity.ExpressCharge.java
 * @Create By jingpeng
 * @Create In 2013-7-10 下午2:05:12
 * TODO
 */
package net.shopin.entity;

import java.math.BigDecimal;

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
 * 邮费表
 * @Class Name ExpressCharge
 * @Author jingpeng
 * @Create In 2013-7-10
 */
@Table(name = "EXPRESS_CHARGE")
@Entity
public class ExpressCharge {
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

    private Long deliCitySid;
    
    @Column(name = "DELI_CITY_SID",insertable=false, updatable=false)
    @Basic
    public Long getDeliCitySid() {
        return deliCitySid;
    }

    public void setDeliCitySid(Long deliCitySid) {
        this.deliCitySid = deliCitySid;
    }

    private Long expressTypeSid;
    
    @Column(name = "EXPRESS_TYPE_SID",insertable=false, updatable=false)
    @Basic
    public Long getExpressTypeSid() {
        return expressTypeSid;
    }

    public void setExpressTypeSid(Long expressTypeSid) {
        this.expressTypeSid = expressTypeSid;
    }

    private BigDecimal expressCharge;
    
    @Column(name = "EXPRESS_CHARGE")
    @Basic
    public BigDecimal getExpressCharge() {
        return expressCharge;
    }

    public void setExpressCharge(BigDecimal expressCharge) {
        this.expressCharge = expressCharge;
    }

    private ExpressType expressType;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "EXPRESS_TYPE_SID", referencedColumnName = "SID")
    public ExpressType getExpressType() {
        return expressType;
    }

    public void setExpressType(ExpressType expressType) {
        this.expressType = expressType;
    }

    private DeliCity deliCity;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "DELI_CITY_SID", referencedColumnName = "SID")
    public DeliCity getDeliCity() {
        return deliCity;
    }

    public void setDeliCity(DeliCity deliCity) {
        this.deliCity = deliCity;
    }
}

/**
 * @Probject Name: business
 * @Path: net.shopin.entity.DeliCity.java
 * @Create By jingpeng
 * @Create In 2013-7-10 下午2:04:38
 * TODO
 */
package net.shopin.entity;

import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 地市表
 * @Class Name DeliCity
 * @Author jingpeng
 * @Create In 2013-7-10
 */
@Table(name = "DELI_CITY")
@Entity
public class DeliCity {
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
    
    private String city;

	@Column(name = "CITY")
    @Basic
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
    private String zipcode;
    
    @Column(name = "ZIPCODE")
    @Basic
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	private Long deliProvinceSid;
	
	@Column(name = "DELI_PROVINCE_SID", insertable=false, updatable=false)
	@Basic
    public Long getDeliProvinceSid() {
		return deliProvinceSid;
	}

	public void setDeliProvinceSid(Long deliProvinceSid) {
		this.deliProvinceSid = deliProvinceSid;
	}
    
    private DeliProvince deliProvince;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "DELI_PROVINCE_SID", referencedColumnName = "SID")
    public DeliProvince getDeliProvince() {
        return deliProvince;
    }

    public void setDeliProvince(DeliProvince deliProvince) {
        this.deliProvince = deliProvince;
    }

    private Set<ExpressCharge> expressCharges;

    @OneToMany(mappedBy="deliCity")
    public Set<ExpressCharge> getExpressCharges() {
        return expressCharges;
    }

    public void setExpressCharges(Set<ExpressCharge> expressCharges) {
        this.expressCharges = expressCharges;
    }
}

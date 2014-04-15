/**
 * @Probject Name: business
 * @Path: net.shopin.entity.DeliProvince.java
 * @Create By jingpeng
 * @Create In 2013-7-10 下午2:03:56
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
 * 省市表
 * @Class Name DeliProvince
 * @Author jingpeng
 * @Create In 2013-7-10
 */
@Table(name = "DELI_PROVINCE")
@Entity
public class DeliProvince {
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

    private String province;

	@Column(name = "PROVINCE")
    @Basic
    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DeliProvince that = (DeliProvince) o;

        if (sid != that.sid) return false;
        if (province != null ? !province.equals(that.province) : that.province != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = new Long(sid).intValue();
        result = 31 * result + (province != null ? province.hashCode() : 0);
        return result;
    }

    private Set<DeliCity> deliCities;
    
    @OneToMany(mappedBy="deliProvince")
    public Set<DeliCity> getDeliCities() {
        return deliCities;
    }

    public void setDeliCities(Set<DeliCity> deliCities) {
        this.deliCities = deliCities;
    }
}

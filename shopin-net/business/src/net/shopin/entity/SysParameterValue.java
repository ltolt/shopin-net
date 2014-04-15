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
 * Created by IntelliJ IDEA.
 * User: jiangzhenxue
 * Date: 2013-07-10
 * Time: 13:37:21
 * 系统参数表
 */
@Table(name = "SYS_PARAMETER_VALUE")
@Entity
public class SysParameterValue {
    private Integer sid;

    @Column(name="SID")
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)      
    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    private Integer sysParameterTypeSid;

    @Column(name = "SYS_PARAMETER_TYPE_SID",insertable=false, updatable=false)
    @Basic
    public Integer getSysParameterTypeSid() {
        return sysParameterTypeSid;
    }

    public void setSysParameterTypeSid(Integer sysParameterTypeSid) {
        this.sysParameterTypeSid = sysParameterTypeSid;
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

    private String value;

    @Column(name = "VALUE")
    @Basic
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SysParameterValue that = (SysParameterValue) o;

        if (sid != that.sid) return false;
        if (sysParameterTypeSid != that.sysParameterTypeSid) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (value != null ? !value.equals(that.value) : that.value != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sid;
        result = 31 * result + sysParameterTypeSid;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (value != null ? value.hashCode() : 0);
        return result;
    }

    private SysParameterType sysParameterType;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "SYS_PARAMETER_TYPE_SID", referencedColumnName = "SID")
    public SysParameterType getSysParameterType() {
        return sysParameterType;
    }

    public void setSysParameterType(SysParameterType sysParameterType) {
        this.sysParameterType = sysParameterType;
    }
}

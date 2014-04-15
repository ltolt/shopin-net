package net.shopin.entity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: jiangzhenxue
 * Date: 2013-7-10
 * Time: 13:37:20
 * 系统参数类型表
 */
@Table(name = "SYS_PARAMETER_TYPE")
@Entity
public class SysParameterType {
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

    private String code;

    @Column(name = "CODE")
    @Basic
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    private String type;

    @Column(name = "TYPE")
    @Basic
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SysParameterType that = (SysParameterType) o;

        if (sid != that.sid) return false;
        if (code != null ? !code.equals(that.code) : that.code != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sid;
        result = 31 * result + (code != null ? code.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }

    private Set<SysParameterValue> sysParameterValues;
    @OneToMany(mappedBy="sysParameterType")
    public Set<SysParameterValue> getSysParameterValues() {
        return sysParameterValues;
    }

    public void setSysParameterValues(Set<SysParameterValue> sysParameterValues) {
        this.sysParameterValues = sysParameterValues;
    }
}

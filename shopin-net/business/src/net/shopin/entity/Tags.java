package net.shopin.entity;

import javax.persistence.*;

/**
 * 网站商品标记表
 * @Class Name Tags
 * @Author huyy
 * @Create In 2013-7-12
 */
@Table(name = "tags")
@Entity
public class Tags {
    private Integer sid;

    @Column(name = "SID")
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)      
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

    private Integer num;

    @Column(name = "NUM")
    @Basic
    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Tags tags = (Tags) o;

        if (num != tags.num) return false;
        if (sid != tags.sid) return false;
        if (name != null ? !name.equals(tags.name) : tags.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sid;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + num;
        return result;
    }
}

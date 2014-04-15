package net.shopin.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

/**
 * 退货原因表 字典表。
 * 
 * @author minxr
 * 
 */
@Entity
@Table(name = "REFUNDRESON")
public class Refundreson implements java.io.Serializable {

    private Integer sid;
    // 退货原因 一般是自定以的，供用户来选择的
    private String reson;
    // 是否需要上传图片 0不是必须要上传图片 1必须要上传图片 默认为0
    private Integer imgrequire;
    private Set<Refundapplyinfo> refundapplyinfos = new HashSet<Refundapplyinfo>(
	    0);
    private Integer resonType;// 原因类型，是退货？还是维修？默认退货，是0 维修为1

    @Column(name = "SID")
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Integer getsid() {
	return this.sid;
    }

    public void setsid(Integer sid) {
	this.sid = sid;
    }

    @Column(name = "RESON")
    public String getReson() {
	return this.reson;
    }

    public void setReson(String reson) {
	this.reson = reson;
    }

    @Column(name = "IMGREQUIRE")
    public Integer getImgrequire() {
	return this.imgrequire;
    }

    public void setImgrequire(Integer imgrequire) {
	this.imgrequire = imgrequire;
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "refundreson")
    public Set<Refundapplyinfo> getRefundapplyinfos() {
	return this.refundapplyinfos;
    }

    public void setRefundapplyinfos(Set<Refundapplyinfo> refundapplyinfos) {
	this.refundapplyinfos = refundapplyinfos;
    }

    @Basic
    @Column(name = "RESONTYPE")
    public Integer getResonType() {
	return resonType;
    }

    public void setResonType(Integer resonType) {
	this.resonType = resonType;
    }
}
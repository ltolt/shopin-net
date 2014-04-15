package net.shopin.entity;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;

/**
 * 退货申请信息表。 和用户退货相关。
 * 
 * @author minxr
 * 
 */
@Entity
@Table(name = "REFUNDAPPLYINFO")
public class Refundapplyinfo implements java.io.Serializable {

    // Fields

    private Integer sid;
    private LeaveMessage leaveMessage;
    private String orderid;
    private String description;
    private Refundreson refundreson;
    private String picurls;
    private String productName;// 退货商品名称
    private Integer proCount; // 退货商品数量
    private String proNo;// 商品编号
    private Double price; // 价格

    // Property accessors
    @Column(name = "SID")
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Integer getSid() {
	return this.sid;
    }

    public void setSid(Integer sid) {
	this.sid = sid;
    }

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MSGID")
    public LeaveMessage getLeaveMessage() {
	return this.leaveMessage;
    }

    public void setLeaveMessage(LeaveMessage leaveMessage) {
	this.leaveMessage = leaveMessage;
    }

    @Column(name = "ORDERID")
    public String getOrderid() {
	return this.orderid;
    }

    public void setOrderid(String orderid) {
	this.orderid = orderid;
    }

    @Column(name = "DESCRIPTION")
    public String getDescription() {
	return this.description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "RSID")
    public Refundreson getRefundreson() {
	return this.refundreson;
    }

    public void setRefundreson(Refundreson refundreson) {
	this.refundreson = refundreson;
    }

    @Column(name = "PRONO")
    public String getProNo() {
	return proNo;
    }

    public void setProNo(String proNo) {
	this.proNo = proNo;
    }

    @Column(name = "PRICE")
    public Double getPrice() {
	return price;
    }

    public void setPrice(Double price) {
	this.price = price;
    }

    @Column(name = "PRODUCTNAME")
    public String getProductName() {
	return productName;
    }

    public void setProductName(String productName) {
	this.productName = productName;
    }

    @Column(name = "PROCOUNT")
    public Integer getProCount() {
	return proCount;
    }

    public void setProCount(Integer proCount) {
	this.proCount = proCount;
    }

    @Column(name = "PICURLS")
    public String getPicurls() {
	return this.picurls;
    }

    public void setPicurls(String picurls) {
	this.picurls = picurls;
    }

}
/**
 * @Probject Name: business
 * @Path: net.shopin.entity.WoMai.java
 * @Create By jingpeng
 * @Create In 2014-1-12 上午10:08:00
 * TODO
 */
package net.shopin.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @Class Name WoMai
 * @Author jingpeng
 * @Create In 2014-1-12
 */
@Table(name = "WOMAI")
@Entity
public class WoMai {
	
	private Long sid;
	private String cardNo;
	private String cardPassword;
	private Integer flag;
	
    @Column(name = "SID")
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	public Long getSid() {
		return sid;
	}
	public void setSid(Long sid) {
		this.sid = sid;
	}
	
    @Column(name = "card_no")
    @Basic
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	
    @Column(name = "card_password")
    @Basic
	public String getCardPassword() {
		return cardPassword;
	}
	public void setCardPassword(String cardPassword) {
		this.cardPassword = cardPassword;
	}
	
    @Column(name = "flag")
    @Basic
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
}

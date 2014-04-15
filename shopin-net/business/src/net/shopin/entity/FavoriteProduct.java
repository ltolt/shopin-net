/**
 * @Probject Name: business
 * @Path: net.shopin.entity.FavoriteProduct.java
 * @Create By kongm
 * @Create In 2013-8-5 上午11:34:42
 * TODO
 */
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
 * @Class Name FavoriteProduct
 * @Author kongm
 * @Create In 2013-8-5
 */
@Table(name = "FAVORITE_PRODUCTS")
@Entity
public class FavoriteProduct {

	private Long sid;
	private Long favorotesSid;
	private Long ssdProductSid;
	private String productName;
	private Double originalPrice;
	private Double promotionPrice;
	private String picUrl;

	@Column(name = "SID")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	@Column(name="FAVORITES_SID", insertable = false, updatable = false)
    @Basic
	public Long getFavorotesSid() {
		return favorotesSid;
	}

	public void setFavorotesSid(Long favorotesSid) {
		this.favorotesSid = favorotesSid;
	}

	@Column(name="PRODUCT_SID")
    @Basic
	public Long getSsdProductSid() {
		return ssdProductSid;
	}

	public void setSsdProductSid(Long ssdProductSid) {
		this.ssdProductSid = ssdProductSid;
	}
	@Column(name="PRODUCT_NAME")
    @Basic
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Column(name="ORIGINAL_PRICE")
    @Basic
	public Double getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(Double originalPrice) {
		this.originalPrice = originalPrice;
	}
	@Column(name="PROMOTION_PRICE")
    @Basic
	public Double getPromotionPrice() {
		return promotionPrice;
	}

	public void setPromotionPrice(Double promotionPrice) {
		this.promotionPrice = promotionPrice;
	}
	@Column(name="PIC_URL")
    @Basic
	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	private Favorites favorites;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "FAVORITES_SID",referencedColumnName = "SID")
	public Favorites getFavorites() {
		return favorites;
	}

	public void setFavorites(Favorites favorites) {
		this.favorites = favorites;
	}
	
	
	
	

}

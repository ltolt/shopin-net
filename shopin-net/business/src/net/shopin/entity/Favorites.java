/**
 * @Probject Name: business
 * @Path: net.shopin.entity.Favorites.java
 * @Create By jiangzhenxue
 * @Create In 2013-7-9 下午4:13:05
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
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Table(name = "FAVORITES")
@Entity
public class Favorites {
    private Long sid;
    private Integer memberSid;
    private String favoritesName;

    @Column(name="SID")
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO) 
    public Long getSid() {
	return sid;
    }

    public void setSid(Long sid) {
	this.sid = sid;
    }

    @Column(name="MEMBER_SID")
    @Basic
    public Integer getMemberSid() {
	return memberSid;
    }

    public void setMemberSid(Integer memberSid) {
	this.memberSid = memberSid;
    }

    @Column(name="FAVORITES_NAME")
    @Basic
    public String getFavoritesName() {
	return favoritesName;
    }

    public void setFavoritesName(String favoritesName) {
	this.favoritesName = favoritesName;
    }
    
    
    private Set<FavoriteProduct> products;

    @OneToMany(mappedBy = "favorites")
    @OrderBy(" sid asc")
	public Set<FavoriteProduct> getProducts() {
		return products;
	}

	public void setProducts(Set<FavoriteProduct> products) {
		this.products = products;
	}
    
    
    
    
    
    
    
    
    
    
    
    

}

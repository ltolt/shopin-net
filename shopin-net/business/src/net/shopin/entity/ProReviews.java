/**
 * @Probject Name: business
 * @Path: net.shopin.entity.ProReviews.java
 * @Create By admin
 * @Create In 2013-7-10 上午9:40:40
 * TODO
 */
package net.shopin.entity;

import java.sql.Timestamp;
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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Table(name = "PRO_REVIEWS")
@Entity
public class ProReviews {
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

    private Integer membersSid;

    @Column(name = "MEMBERS_SID",insertable=false, updatable=false)
    @Basic
    public Integer getMembersSid() {
        return membersSid;
    }

    public void setMembersSid(Integer membersSid) {
        this.membersSid = membersSid;
    }

    private Integer productListSid;

    @Column(name = "PRODUCT_LIST_SID",insertable=false, updatable=false)
    @Basic
    public Integer getProductListSid() {
        return productListSid;
    }

    public void setProductListSid(Integer productListSid) {
        this.productListSid = productListSid;
    }

    private Integer proReviewsSid;

    @Column(name = "PRO_REVIEWS_SID",insertable=false, updatable=false)
    @Basic
    public Integer getProReviewsSid() {
        return proReviewsSid;
    }

    public void setProReviewsSid(Integer proReviewsSid) {
        this.proReviewsSid = proReviewsSid;
    }

    private String content;

    @Column(name = "CONTENT")
    @Basic
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    private Integer reviewsStatus;

    @Column(name = "REVIEWS_STATUS")
    @Basic
    public Integer getReviewsStatus() {
        return reviewsStatus;
    }

    public void setReviewsStatus(Integer reviewsStatus) {
        this.reviewsStatus = reviewsStatus;
    }

    private Timestamp contentTime;

    @Column(name = "CONTENT_TIME")
    @Basic
    public Timestamp getContentTime() {
        return contentTime;
    }

    public void setContentTime(Timestamp contentTime) {
        this.contentTime = contentTime;
    }

    private String ipAddr;

    @Column(name = "IP_ADDR")
    @Basic
    public String getIpAddr() {
        return ipAddr;
    }

    public void setIpAddr(String ipAddr) {
        this.ipAddr = ipAddr;
    }

    private Members members;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "MEMBERS_SID", referencedColumnName = "SID")
    public Members getMembers() {
        return members;
    }

    public void setMembers(Members members) {
        this.members = members;
    }

//    private ProductList productLists;
//
//    @ManyToOne(fetch=FetchType.LAZY)
//    @JoinColumn(name = "PRODUCT_LIST_SID", referencedColumnName = "SID")
//    public ProductList getProductLists() {
//        return productLists;
//    }
//
//    public void setProductLists(ProductList productLists) {
//        this.productLists = productLists;
//    }

    private ProReviews proReviews;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "PRO_REVIEWS_SID", referencedColumnName = "SID")
    public ProReviews getProReviews() {
        return proReviews;
    }

    public void setProReviews(ProReviews proReviews) {
        this.proReviews = proReviews;
    }

    private Set<ProReviews> replies;
    @OneToMany(mappedBy="proReviews")
    public Set<ProReviews> getReplies() {
        return replies;
    }

    public void setReplies(Set<ProReviews> replies) {
        this.replies = replies;
    }
}


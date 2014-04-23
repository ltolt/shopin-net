package net.shopin.wms.domain.entity;

import java.util.Date;

public class ProConSearchMql {
    private Integer sid;

    private Integer saleCodeSid;

    private String proSku;

    private Double offMin;

    private Double offMax;

    private Double priceMin;

    private Double priceMax;

    private Date proBeginTime;

    private Date proEndTime;

    private Integer brandSid;

    private Integer productClassSid;

    private Integer pageLayoutSid;

    private Integer proStockNum;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getSaleCodeSid() {
        return saleCodeSid;
    }

    public void setSaleCodeSid(Integer saleCodeSid) {
        this.saleCodeSid = saleCodeSid;
    }

    public String getProSku() {
        return proSku;
    }

    public void setProSku(String proSku) {
        this.proSku = proSku == null ? null : proSku.trim();
    }

    public Double getOffMin() {
        return offMin;
    }

    public void setOffMin(Double offMin) {
        this.offMin = offMin;
    }

    public Double getOffMax() {
        return offMax;
    }

    public void setOffMax(Double offMax) {
        this.offMax = offMax;
    }

    public Double getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(Double priceMin) {
        this.priceMin = priceMin;
    }

    public Double getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(Double priceMax) {
        this.priceMax = priceMax;
    }

    public Date getProBeginTime() {
        return proBeginTime;
    }

    public void setProBeginTime(Date proBeginTime) {
        this.proBeginTime = proBeginTime;
    }

    public Date getProEndTime() {
        return proEndTime;
    }

    public void setProEndTime(Date proEndTime) {
        this.proEndTime = proEndTime;
    }

    public Integer getBrandSid() {
        return brandSid;
    }

    public void setBrandSid(Integer brandSid) {
        this.brandSid = brandSid;
    }

    public Integer getProductClassSid() {
        return productClassSid;
    }

    public void setProductClassSid(Integer productClassSid) {
        this.productClassSid = productClassSid;
    }

    public Integer getPageLayoutSid() {
        return pageLayoutSid;
    }

    public void setPageLayoutSid(Integer pageLayoutSid) {
        this.pageLayoutSid = pageLayoutSid;
    }

    public Integer getProStockNum() {
        return proStockNum;
    }

    public void setProStockNum(Integer proStockNum) {
        this.proStockNum = proStockNum;
    }
}
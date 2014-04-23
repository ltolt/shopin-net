package net.shopin.wms.domain.entity;

import java.util.Date;

public class TRuleDetailMql {
    private Integer sid;

    private Integer ruleSid;

    private Integer brandSid;

    private Integer productClassSid;

    private String productClassName;

    private String brandName;

    private Double offMin;

    private Double offMax;

    private Long priceMin;

    private Long priceMax;

    private Integer stockMin;

    private Integer stockMax;

    private Integer shopSid;

    private String shopName;

    private String saleCode;

    private Integer saleSum;

    private Date priceUpdateTime;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getRuleSid() {
        return ruleSid;
    }

    public void setRuleSid(Integer ruleSid) {
        this.ruleSid = ruleSid;
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

    public String getProductClassName() {
        return productClassName;
    }

    public void setProductClassName(String productClassName) {
        this.productClassName = productClassName == null ? null : productClassName.trim();
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName == null ? null : brandName.trim();
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

    public Long getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(Long priceMin) {
        this.priceMin = priceMin;
    }

    public Long getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(Long priceMax) {
        this.priceMax = priceMax;
    }

    public Integer getStockMin() {
        return stockMin;
    }

    public void setStockMin(Integer stockMin) {
        this.stockMin = stockMin;
    }

    public Integer getStockMax() {
        return stockMax;
    }

    public void setStockMax(Integer stockMax) {
        this.stockMax = stockMax;
    }

    public Integer getShopSid() {
        return shopSid;
    }

    public void setShopSid(Integer shopSid) {
        this.shopSid = shopSid;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName == null ? null : shopName.trim();
    }

    public String getSaleCode() {
        return saleCode;
    }

    public void setSaleCode(String saleCode) {
        this.saleCode = saleCode == null ? null : saleCode.trim();
    }

    public Integer getSaleSum() {
        return saleSum;
    }

    public void setSaleSum(Integer saleSum) {
        this.saleSum = saleSum;
    }

    public Date getPriceUpdateTime() {
        return priceUpdateTime;
    }

    public void setPriceUpdateTime(Date priceUpdateTime) {
        this.priceUpdateTime = priceUpdateTime;
    }
}
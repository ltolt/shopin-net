package net.shopin.wms.domain.entity;

public class PromotionType {
    private Integer sid;

    private String promotionTypeName;

    private String promotionTypeMemo;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getPromotionTypeName() {
        return promotionTypeName;
    }

    public void setPromotionTypeName(String promotionTypeName) {
        this.promotionTypeName = promotionTypeName == null ? null : promotionTypeName.trim();
    }

    public String getPromotionTypeMemo() {
        return promotionTypeMemo;
    }

    public void setPromotionTypeMemo(String promotionTypeMemo) {
        this.promotionTypeMemo = promotionTypeMemo == null ? null : promotionTypeMemo.trim();
    }
}
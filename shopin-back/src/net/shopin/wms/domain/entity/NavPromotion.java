package net.shopin.wms.domain.entity;

public class NavPromotion {
    private Long navSid;

    private Integer promotionSid;

    public Long getNavSid() {
        return navSid;
    }

    public void setNavSid(Long navSid) {
        this.navSid = navSid;
    }

    public Integer getPromotionSid() {
        return promotionSid;
    }

    public void setPromotionSid(Integer promotionSid) {
        this.promotionSid = promotionSid;
    }
}
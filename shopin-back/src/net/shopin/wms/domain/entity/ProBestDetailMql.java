package net.shopin.wms.domain.entity;

public class ProBestDetailMql {
    private Integer sid;

    private Integer productListSid;

    private Integer pageLayoutSid;

    private Integer orderNumber;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getProductListSid() {
        return productListSid;
    }

    public void setProductListSid(Integer productListSid) {
        this.productListSid = productListSid;
    }

    public Integer getPageLayoutSid() {
        return pageLayoutSid;
    }

    public void setPageLayoutSid(Integer pageLayoutSid) {
        this.pageLayoutSid = pageLayoutSid;
    }

    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }
}
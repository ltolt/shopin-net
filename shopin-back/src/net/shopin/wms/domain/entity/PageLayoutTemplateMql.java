package net.shopin.wms.domain.entity;

public class PageLayoutTemplateMql {
    private Integer sid;

    private String name;

    private String memo;

    private Integer minProQuantity;

    private Integer maxProQuantity;

    private String template;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public Integer getMinProQuantity() {
        return minProQuantity;
    }

    public void setMinProQuantity(Integer minProQuantity) {
        this.minProQuantity = minProQuantity;
    }

    public Integer getMaxProQuantity() {
        return maxProQuantity;
    }

    public void setMaxProQuantity(Integer maxProQuantity) {
        this.maxProQuantity = maxProQuantity;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template == null ? null : template.trim();
    }
}
package net.shopin.web.vo;

/**
 * Created by IntelliJ IDEA.
 * User: kongming
 * Date: 12-9-24
 *
 * Time: 下午5:27
 * To change this template use File | Settings | File Templates.
 */
public class ProductConditionVO {

    private int isPage;

    public int getIsPage(){
        return isPage;
    }
    public void setIsPage(int isPage){
        this.isPage=isPage;
    }


    private int pageSize;
	private int nowPage;

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }

    private Integer start;

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getStart() {

        return start;
    }

    private String keyword;
    private String firstCategory;
    private String secondCategory;
    private String thirdCategory;
    private String premium;
    private String price;
    private Integer brandSid;
    private String sortField;//排序字段
    private int order;//排序    0：升序，1降序

    private String   sex ;
    private String   age ;
    private String   season ;
    private String   materialStyle ;
    private String   occasionWear ;





    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getAge() {
        return age;
    }
    public void setAge(String age) {
        this.age = age;
    }
    public String getSeason() {
        return season;
    }
    public void setSeason(String season) {
        this.season = season;
    }
    public String getMaterialStyle() {
        return materialStyle;
    }
    public void setMaterialStyle(String materialStyle) {
        this.materialStyle = materialStyle;
    }
    public String getOccasionWear() {
        return occasionWear;
    }
    public void setOccasionWear(String occasionWear) {
        this.occasionWear = occasionWear;
    }
    public String getSortField() {
        return sortField;
    }
    public void setSortField(String sortField) {
        this.sortField = sortField;
    }
    public int getOrder() {
        return order;
    }
    public void setOrder(int order) {
        this.order = order;
    }
    public String getPrice() {
        return price;
    }
    public void setPrice(String price) {
        this.price = price;
    }
    public String getKeyword() {
        return keyword;
    }
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }


    public Integer getBrandSid() {
        return brandSid;
    }
    public void setBrandSid(Integer brandSid) {
        this.brandSid = brandSid;
    }
    public String getPremium() {
        return premium;
    }
    public void setPremium(String premium) {
        this.premium = premium;
    }
    public String getFirstCategory() {
        return firstCategory;
    }
    public void setFirstCategory(String firstCategory) {
        this.firstCategory = firstCategory;
    }
    public String getSecondCategory() {
        return secondCategory;
    }
    public void setSecondCategory(String secondCategory) {
        this.secondCategory = secondCategory;
    }
    public String getThirdCategory() {
        return thirdCategory;
    }
    public void setThirdCategory(String thirdCategory) {
        this.thirdCategory = thirdCategory;
    }

	    





}

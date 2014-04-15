/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.condProConSearchCond.java
 * @Create By k
 * @Create In 2013-5-9 下午3:01:27
 * TODO
 */
package net.shopin.back.entity.cond;

import java.util.Date;

import net.shopin.back.entity.po.ProConSearch;

import com.framework.AbstractCondtion;
import com.utils.JsonUtil;

/**
 * @Class Name ProConSearchCond
 * @Author K
 * @Create In 2013-5-9
 */
public class ProConSearchCond extends AbstractCondtion{

    private String saleCodeSid;
	
	private String proSku;
	
	private Double offMin;
	
	private Double offMax;
	
	private Double priceMin;
	
	private Double priceMax;
	
	private Date proBeginTime;
	
	private Date proEndTime;
   
    private Integer brandSid;

    private Integer productClassSid;
	
    private Integer proStockNum;
    
    private Integer pageLayoutSid;

    private ProConSearch proConSearch;
    
    private String proConSearchJson;
    
    
    
    
	public String getProConSearchJson() {
		return proConSearchJson;
	}

	public void setProConSearchJson(String proConSearchJson) {
		this.proConSearchJson = proConSearchJson;
		if(proConSearchJson!=null && !"".equals(proConSearchJson)){
			this.proConSearch = JsonUtil.Json2Object(proConSearchJson, ProConSearch.class);
		}
	}

	public ProConSearch getProConSearch() {
		return proConSearch;
	}

	public void setProConSearch(ProConSearch proConSearch) {
		if(proConSearch != null)
		this.proConSearch = proConSearch;
	}

	public String getSaleCodeSid() {
		return saleCodeSid;
	}

	public void setSaleCodeSid(String saleCodeSid) {
		this.saleCodeSid = saleCodeSid;
	}

	public String getProSku() {
		return proSku;
	}

	public void setProSku(String proSku) {
		this.proSku = proSku;
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

	public Integer getProStockNum() {
		return proStockNum;
	}

	public void setProStockNum(Integer proStockNum) {
		this.proStockNum = proStockNum;
	}

	public Integer getPageLayoutSid() {
		return pageLayoutSid;
	}

	public void setPageLayoutSid(Integer pageLayoutSid) {
		this.pageLayoutSid = pageLayoutSid;
	}


	
	
	


	
	
	
	
	
	
	
	
}

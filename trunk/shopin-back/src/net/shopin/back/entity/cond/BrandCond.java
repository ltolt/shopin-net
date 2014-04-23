/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.condBrandCond.java
 * @Create By wangdg
 * @Create In 2013-5-13 上午10:02:15
 * TODO
 */
package net.shopin.back.entity.cond;

import java.sql.Date;

import com.framework.AbstractCondtion;
import com.utils.JsonUtil;

import net.shopin.back.entity.po.Brand;

/**
 * @Class Name BrandCond
 * @Author wangdg
 * @Create In 2013-5-13
 */
public class BrandCond extends AbstractCondtion {

	private Long sid;
	private String brandName;
	private String pictureUrl;
	private String brandNameSecond;
	private Integer brandActiveBit;
	private String brandNO;
	private String brandCorp;
	private String brandPic1;
	private String brandPic2;
	private Integer photoBlacklistBit;
	private Integer parentSid;
	private Integer endBit;
	private String spell;
	private Integer optUserSid;
	private String optRealName;
	private Date optUpdateTime;
	private Integer brandRootSid;

	private Brand brand;
	private String brandJson;

	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public String getBrandNameSecond() {
		return brandNameSecond;
	}

	public void setBrandNameSecond(String brandNameSecond) {
		this.brandNameSecond = brandNameSecond;
	}

	public Integer getBrandActiveBit() {
		return brandActiveBit;
	}

	public void setBrandActiveBit(Integer brandActiveBit) {
		this.brandActiveBit = brandActiveBit;
	}

	public String getBrandNO() {
		return brandNO;
	}

	public void setBrandNO(String brandNO) {
		this.brandNO = brandNO;
	}

	public String getBrandCorp() {
		return brandCorp;
	}

	public void setBrandCorp(String brandCorp) {
		this.brandCorp = brandCorp;
	}

	public String getBrandPic1() {
		return brandPic1;
	}

	public void setBrandPic1(String brandPic1) {
		this.brandPic1 = brandPic1;
	}

	public String getBrandPic2() {
		return brandPic2;
	}

	public void setBrandPic2(String brandPic2) {
		this.brandPic2 = brandPic2;
	}

	public Integer getPhotoBlacklistBit() {
		return photoBlacklistBit;
	}

	public void setPhotoBlacklistBit(Integer photoBlacklistBit) {
		this.photoBlacklistBit = photoBlacklistBit;
	}

	public Integer getParentSid() {
		return parentSid;
	}

	public void setParentSid(Integer parentSid) {
		this.parentSid = parentSid;
	}

	public Integer getEndBit() {
		return endBit;
	}

	public void setEndBit(Integer endBit) {
		this.endBit = endBit;
	}

	public String getSpell() {
		return spell;
	}

	public void setSpell(String spell) {
		this.spell = spell;
	}

	public Integer getOptUserSid() {
		return optUserSid;
	}

	public void setOptUserSid(Integer optUserSid) {
		this.optUserSid = optUserSid;
	}

	public String getOptRealName() {
		return optRealName;
	}

	public void setOptRealName(String optRealName) {
		this.optRealName = optRealName;
	}

	public Date getOptUpdateTime() {
		return optUpdateTime;
	}

	public void setOptUpdateTime(Date optUpdateTime) {
		this.optUpdateTime = optUpdateTime;
	}

	public Integer getBrandRootSid() {
		return brandRootSid;
	}

	public void setBrandRootSid(Integer brandRootSid) {
		this.brandRootSid = brandRootSid;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		if (brand != null)
			this.brand = brand;
	}

	public String getBrandJson() {
		return brandJson;
	}

	public void setBrandJson(String brandJson) {
		this.brandJson = brandJson;
		if (brandJson != null && "".equals(brandJson)) {
			this.brand = JsonUtil.Json2Object(brandJson, Brand.class);
		}
	}

}

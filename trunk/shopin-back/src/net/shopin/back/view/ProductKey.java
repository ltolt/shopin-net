/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.viewProductKey.java
 * @Create By kongm
 * @Create In 2013-5-10 下午3:18:05
 * TODO
 */
package net.shopin.back.view;

import java.io.Serializable;

/**
 * 说明: 
 *      网站后台(backWeb)商品查询关键字
 * @Class Name ProductKey
 * @Author kongm
 * @Create In 2013-5-10
 */
public class ProductKey implements Serializable{
	//====modify by kongm start (新增关键字字段)
	private String shopName;//所在门店
	private String shopSid;//门店sid
    private String stockMin;//最小库存
    private String stockMax;//最大库存
    private String brandName;
    private String saleCode;
    private String saleSumMin;//最小销售数量
    private String saleSumMax;//最大销售数量
    private String proSellingBeginTime;
    private String proSellingEndTime; 
    private String saleMoneyMin;//最小销售金额
   
	private String saleMoneyMax;//最大销售金额
    //======modify by kongm  end 
	
	public String saleCodeSid;// 销售编码
	public String productClassSid;// 商品品类sid
	public String brandSid;// 商品品类sid
	public String offMin;// 折扣开始值
	public String offMax;// 折扣结束值
	public String priceMin;// 价格开始值
	public String priceMax;// 价格结束值
	public String proBeginTime;// 变价开始时间
	public String proEndTime;// 变价结束时间
	public String proSku;// 商品sku
	public String proStockNum;// 商品最小库存
	public String pageLayoutSid;// 栏目id
	public String nodeName;// 品类名称
	public String startUpDay;// 商品描述
	public String endUpDay;// 商品描述
	public String proDesc;// 商品描述
	public Boolean checked;// 无任何品类

	public String getStartUpDay() {
		return startUpDay;
	}

	public void setStartUpDay(String startUpDay) {
		this.startUpDay = startUpDay;
	}

	public String getEndUpDay() {
		return endUpDay;
	}

	public void setEndUpDay(String endUpDay) {
		this.endUpDay = endUpDay;
	}

	public Boolean isChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public String getProDesc() {
		return proDesc;
	}

	public void setProDesc(String proDesc) {
		this.proDesc = proDesc;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopSid() {
		return shopSid;
	}

	public void setShopSid(String shopSid) {
		this.shopSid = shopSid;
	}

	public String getStockMin() {
		return stockMin;
	}

	public void setStockMin(String stockMin) {
		this.stockMin = stockMin;
	}

	public String getStockMax() {
		return stockMax;
	}

	public void setStockMax(String stockMax) {
		this.stockMax = stockMax;
	}

	public String getSaleCodeSid() {
		return saleCodeSid;
	}

	public void setSaleCodeSid(String saleCodeSid) {
		this.saleCodeSid = saleCodeSid;
	}

	public String getProductClassSid() {
		return productClassSid;
	}

	public void setProductClassSid(String productClassSid) {
		this.productClassSid = productClassSid;
	}

	public String getBrandSid() {
		return brandSid;
	}

	public void setBrandSid(String brandSid) {
		this.brandSid = brandSid;
	}

	public String getOffMin() {
		return offMin;
	}

	public void setOffMin(String offMin) {
		this.offMin = offMin;
	}

	public String getOffMax() {
		return offMax;
	}

	public void setOffMax(String offMax) {
		this.offMax = offMax;
	}

	public String getPriceMin() {
		return priceMin;
	}

	public void setPriceMin(String priceMin) {
		this.priceMin = priceMin;
	}

	public String getPriceMax() {
		return priceMax;
	}

	public void setPriceMax(String priceMax) {
		this.priceMax = priceMax;
	}

	public String getProBeginTime() {
		return proBeginTime;
	}

	public void setProBeginTime(String proBeginTime) {
		this.proBeginTime = proBeginTime;
	}

	public String getProEndTime() {
		return proEndTime;
	}

	public void setProEndTime(String proEndTime) {
		this.proEndTime = proEndTime;
	}

	public String getProSku() {
		return proSku;
	}

	public void setProSku(String proSku) {
		this.proSku = proSku;
	}

	public String getProStockNum() {
		return proStockNum;
	}

	public void setProStockNum(String proStockNum) {
		this.proStockNum = proStockNum;
	}

	public String getPageLayoutSid() {
		return pageLayoutSid;
	}

	public void setPageLayoutSid(String pageLayoutSid) {
		this.pageLayoutSid = pageLayoutSid;
	}

	 public String getBrandName() {
			return brandName;
		}

		public void setBrandName(String brandName) {
			this.brandName = brandName;
		}

		public String getSaleCode() {
			return saleCode;
		}

		public void setSaleCode(String saleCode) {
			this.saleCode = saleCode;
		}

		public String getSaleSumMin() {
			return saleSumMin;
		}

		public void setSaleSumMin(String saleSumMin) {
			this.saleSumMin = saleSumMin;
		}

		public String getSaleSumMax() {
			return saleSumMax;
		}

		public void setSaleSumMax(String saleSumMax) {
			this.saleSumMax = saleSumMax;
		}

		public String getProSellingBeginTime() {
			return proSellingBeginTime;
		}

		public void setProSellingBeginTime(String proSellingBeginTime) {
			this.proSellingBeginTime = proSellingBeginTime;
		}

		public String getProSellingEndTime() {
			return proSellingEndTime;
		}

		public void setProSellingEndTime(String proSellingEndTime) {
			this.proSellingEndTime = proSellingEndTime;
		}

		public String getSaleMoneyMin() {
			return saleMoneyMin;
		}

		public void setSaleMoneyMin(String saleMoneyMin) {
			this.saleMoneyMin = saleMoneyMin;
		}

		public String getSaleMoneyMax() {
			return saleMoneyMax;
		}

		public void setSaleMoneyMax(String saleMoneyMax) {
			this.saleMoneyMax = saleMoneyMax;
		}

		@Override
		public String toString() {
			return "ProductKey :{shopName:'" + shopName + "', shopSid:'"
					+ shopSid + "', stockMin:'" + stockMin + "', stockMax:'"
					+ stockMax + "', brandName:'" + brandName + "', saleCode:'"
					+ saleCode + "', saleSumMin:'" + saleSumMin
					+ "', saleSumMax:'" + saleSumMax
					+ "', proSellingBeginTime:'" + proSellingBeginTime
					+ "', proSellingEndTime:'" + proSellingEndTime
					+ "', saleMoneyMin:'" + saleMoneyMin + "', saleMoneyMax:'"
					+ saleMoneyMax + "', saleCodeSid:'" + saleCodeSid
					+ "', productClassSid:'" + productClassSid
					+ "', brandSid:'" + brandSid + "', offMin:'" + offMin
					+ "', offMax:'" + offMax + "', priceMin:'" + priceMin
					+ "', priceMax:'" + priceMax + "', proBeginTime:'"
					+ proBeginTime + "', proEndTime:'" + proEndTime
					+ "', proSku:'" + proSku + "', proStockNum:'" + proStockNum
					+ "', pageLayoutSid:'" + pageLayoutSid + "', nodeName:'"
					+ nodeName + "', startUpDay:'" + startUpDay
					+ "', endUpDay:'" + endUpDay + "', proDesc:'" + proDesc
					+ "', checked:'" + checked + "}";
		}

	
		
	  
	
	
}

/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.utilRequestUtil.java
 * @Create By kongm
 * @Create In 2013-5-16 下午8:31:54
 * TODO
 */
package net.shopin.back.util;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import net.shopin.back.view.ProductKey;

import org.springframework.util.Assert;

import com.sun.xml.internal.bind.v2.TODO;

/**
 * @Class Name RequestUtil
 * @Author kongm
 * @Create In 2013-5-16
 */
public class RequestUtil {

	/**
	 * @Methods Name getRequestParaMap
	 * @Create In 2013-5-16 By kongm
	 * @param productKey
	 * @return Map
	 */
	public static Map getRequestParaMap(ProductKey productKey) {
		Assert.notNull(productKey,"productkey can not be null");
		Map resultMap = new HashMap();
		String saleCode = productKey.getSaleCode();
		if(saleCode!=null && !"".equals(saleCode)){
			resultMap.put("saleCode",saleCode);	
		}
	    String proSku =	productKey.getProSku();
		if(proSku!=null && !"".equals(proSku)){
			resultMap.put("proSku", proSku);
		}
		String offMin = productKey.getOffMin();
		if(offMin != null && !"".equals(offMin)){
			resultMap.put("offMin", offMin);
		}
		String offMax = productKey.getOffMax();
		if(offMax != null && !"".equals(offMax)){
			resultMap.put("offMax", offMax);
		}
		String brandName = productKey.getBrandName();
		if(brandName != null && !"".equals(brandName)){
			resultMap.put("brandName", brandName);
		}
		String stockMin = productKey.getStockMin();
		if(stockMin != null && !"".equals(stockMin)){
			resultMap.put("stockMin", stockMin);
		}
		String stockMax = productKey.getStockMax();
		if(stockMax != null && !"".equals(stockMax)){
			resultMap.put("stockMax", stockMax);
		}
		String priceMin = productKey.getPriceMin();
		if(priceMin != null && !"".equals(priceMin)){
			resultMap.put("priceMin", priceMin);
		}
		String priceMax = productKey.getPriceMax();
		if(priceMax != null && !"".equals(priceMax)){
			resultMap.put("priceMax", priceMax);
		}
		String saleMoneyMin = productKey.getSaleMoneyMin();
		if(saleMoneyMin != null && !"".equals(saleMoneyMin)){
			resultMap.put("saleMoneyMin", saleMoneyMin);
		}
		String saleMoneyMax = productKey.getSaleMoneyMax();
		if(saleMoneyMax != null && !"".equals(saleMoneyMax)){
			resultMap.put("saleMoneyMax", saleMoneyMax);
		}
		String proSellingBeginTime = productKey.getProSellingBeginTime();
		if(proSellingBeginTime != null && !"".equals(proSellingBeginTime)){
			resultMap.put("proSellingBeginTime", proSellingBeginTime);
		}
		
		String proSellingEndTime = productKey.getProSellingEndTime();
		if(proSellingEndTime != null && !"".equals(proSellingEndTime)){
			resultMap.put("proSellingEndTime", proSellingEndTime);
		}
		String proBeginTime = productKey.getProBeginTime();
		if(proBeginTime != null && !"".equals(proBeginTime)){
			resultMap.put("proBeginTime", proBeginTime);
		}
		String proEndTime = productKey.getProEndTime();
		if(proEndTime != null && !"".equals(proEndTime)){
			resultMap.put("proEndTime", proEndTime);
		}
		String productClassSid = productKey.getProductClassSid();
		if(productClassSid!=null && !"".equals(productClassSid)){
			resultMap.put("productClassSid", productClassSid);
		}
		String shopName = productKey.getShopName();
		if(shopName!=null && !"".equals(shopName)){
			resultMap.put("shopName", shopName);
		}
		
		
		return resultMap;
	}

}

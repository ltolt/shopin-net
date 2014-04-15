/**
 * 说明:
 *     Web Tier Validator
 *     web层验证拦截器 
 * @Probject Name: web
 * @Path: net.shopin.web.util.WebUtil.java
 * @Create By kongm
 * @Create In 2013-8-13 下午1:47:24
 * TODO
 */
package net.shopin.web.util;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import net.shopin.view.Cart;
import net.shopin.view.CartItem;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @Class Name WebUtil
 * @Author kongm
 * @Create In 2013-8-13
 */
public class WebUtil {
	
	//单例模式实现
	private WebUtil(){
		throw new AssertionError("单例模式防止创建新实例");
	}
	

	private static final Log log = LogFactory.getLog(WebUtil.class);

	/**
	 * 说明：
	 * 		根据商品明细sid 获取商品销编
	 * @Methods Name getSaleCodeSid
	 * @Create In 2013-9-10 By jingpeng
	 * @param proDetailSid
	 * @return Integer
	 */
	public static Integer getSaleCodeSid(String proDetailSid) {
		Integer saleCodeSid = -1;
		Map parmMap = new HashMap();
		parmMap.put("detailSid", proDetailSid);
		String result = HttpUtil.HttpPost(SystemConstants.SSD_system, "/web/getSaleCodeSidByDetailSid.html", parmMap);
		saleCodeSid = WebUtil.JsonToSaleCodeSid(result);
		return saleCodeSid;
	}
	
	/**
	 * 说明 ：
	 * 		将ssd返回的json格式数据进行解析
	 * @Methods Name JsonToSaleCodeSid
	 * @Create In 2013-9-10 By jingpeng
	 * @param json
	 * @return int
	 */
	public static int JsonToSaleCodeSid(String json) {
		int saleCodeSid = -1;
		JSONObject jsonObj = JSONObject.fromObject(json);
		boolean flag = Boolean.parseBoolean(jsonObj.get("success").toString());
		if(flag) {
			if(jsonObj.get("result") != null) {
				saleCodeSid = Integer.parseInt(jsonObj.get("result").toString());
			}
		}
		return saleCodeSid;
	}
	/**
	 * 
	 * @Methods Name updateFlashSale
	 * @Create In 2013-10-31 By jingpeng
	 * @param memberSid
	 * @param item
	 * @return String  true:修改闪购库存成功;false:修改闪购库存失败
	 */
	public static String updateFlashSale(String memberSid,CartItem item, int addQuantity) {
		Map parmMap = new HashMap();
		parmMap.put("fromSystem", SystemConstants.FORM_SYSTEM);
		parmMap.put("memberSid", memberSid);
		
		//2版数据supplyInfoSid, shopSid不是必需的，saleCodeSid是必需的
		//3版数据supplyInfoSid, shopSid 是必需的， saleCodeSid不是必需的
		//2版 start
		parmMap.put("supplyInfoSid", "");
		parmMap.put("shopSid", "");
//		int saleCodeSid = WebUtil.getSaleCodeSid(item.getSid());
		int saleCodeSid = Integer.parseInt((String) (item.getSaleCodeSid() != null ? item.getSaleCodeSid() : 0));
		parmMap.put("saleCodeSid", saleCodeSid);
		//2版 end
		
		//3版 start
		//....
		//3版 end
		
		parmMap.put("proDetailSid", item.getSid());
//		parmMap.put("saleSum", item.getQty());
		parmMap.put("saleSum", addQuantity);
		parmMap.put("saleMax", 2);
		parmMap.put("promotionPrice", item.getPromotionPrice());
		JSONObject json = JSONObject.fromObject(parmMap);
		String jsonStr = json.toString();
		parmMap.clear();
		parmMap.put("flashSaleJson", jsonStr);
		String result = "false";
		if(saleCodeSid > 0) {
			String resultJson = HttpUtil.HttpPost(SystemConstants.FLASH_SALE_URL, "/flashSale/createFlashSale.html", parmMap);
			result = JSONObject.fromObject(resultJson).get("success").toString();
		}
		return result;
	}

	/**
	 * 说明: 验证字符串非空非null的方法
	 * 
	 * @Methods Name validateStr
	 * @Create In 2013-8-19 By kongm
	 * @param str
	 * @return boolean
	 */
	public static boolean validateStr(String str) {
		return (str != null) && (!"".equals(str));
	}

	/**
	 * 说明: 针对路径中含有PathVariable的url Web Tier 验证路径中参数有效性的 工具类,主要针对null,"",非纯数字字符串
	 * 验证失败说明路径无效,页面路由到404页面,
	 * 
	 * @Methods Name validatePath
	 * @Create In 2013-8-13 By kongm
	 * @param pathVariable
	 * @return boolean
	 */
	public static boolean validatePath(String pathVariable) {
		if (pathVariable == null || "".equals(pathVariable.trim()))
			return false;
		// 类型转换失败
		try {
			Integer.parseInt(pathVariable.trim());
		} catch (Exception e) {
			log.warn("path variable error input :" + pathVariable);
			return false;
		}
		return true;
	}

	/**
	 * 说明:
	 *     封装装配获取最终购物车的算法
	 *     cartItemSids切分协议'|'
	 * @Methods Name handleCart
	 * @Create In 2013-8-19 By kongm
	 * @param cart
	 * @param cartItemSids
	 * @return Cart
	 */
	public static Cart handleCart(Cart cart, String cartItemSids) {
		String[] str = cartItemSids.split(URLEncoder.encode("|"));
		if ((str != null) && (str[0] != "")) {
			List newList = new ArrayList();
			List<CartItem> list = cart.getItemList();

			for (int i = 0; i < str.length; i++) {
				for (CartItem item : list) {
					if (item.getSid().equals(str[i])) {
						newList.add(item);
					}
				}
			}

			cart.setItemList(newList);
		}
		return cart;
	}

	/**
	 * 说明:
	 *     调用SSO系统获取地址信息
	 * @Methods Name handleAddressList
	 * @Create In 2013-8-19 By kongm
	 * @param uid
	 * @return List
	 */
	public static List handleAddressList(String uid){
		List addresslist = new ArrayList();
		
		return addresslist;
	}
	
	public static void main(String[] args)	{
		Integer saleCodeSid = -1;
		Map parmMap = new HashMap();
		parmMap.put("sid", 1841);
		parmMap.put("pageSize", 6);
		parmMap.put("pageNo", 2);
		String result = HttpUtil.HttpPost("http://192.168.1.114", "/mobile/getProductsByPromotionSids.html", parmMap);
		System.out.println(result);
		
	}
	
	
	
}

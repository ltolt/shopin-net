/**
 * @Probject Name: backendWeb_ssd
 * @Path: net.shopin.util.JsonUtil.java
 * @Create By kongm
 * @Create In 2013-6-18 下午8:25:03
 * TODO
 */
package net.shopin.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.shopin.entity.Navigation;
import net.shopin.view.BrandVO;
import net.shopin.view.CartItem;
import net.shopin.view.NavigationVO;
import net.shopin.view.ProColorDetailVO;
import net.shopin.view.ProductPicVO;
import net.shopin.view.SsdBrandDisplay;
import net.shopin.view.SsdProductVO;
import net.shopin.view.WebProductVO;

/**
 * @Class Name JsonUtil
 * @Author kongm
 * @Create In 2013-6-18
 */
public class JsonUtil {

	/**
	 * 
	 * @Methods Name jsonToProductsVO
	 * @Create In 2013-6-19 By wangdg
	 * @param sid
	 * @param resultJson
	 * @return List<ProductsVO>
	 */
	public static List<WebProductVO> jsonToProductsVO(String resultJson) {
		JSONObject jsonObject = null;
		List<WebProductVO> voList = new ArrayList<WebProductVO>();
		jsonObject = JSONObject.fromObject(resultJson);
		String successe = jsonObject.get("success").toString();
		if (!"false".equals(successe)) {
			JSONArray jsonArray = jsonObject.getJSONArray("result");
			// voList = jsonArray.toList(jsonArray, WebProductVO.class);
			voList = JSONArray.toList(jsonArray, new WebProductVO(),
					new JsonConfig());

			return voList;
		} else {
			return voList;
		}
	}

	/**
	 * 
	 * @param resultJson
	 * @return
	 */
	public static List<BrandVO> jsonToBrandVO(String resultJson) {
		JSONObject jsonObject = null;
		List<BrandVO> voList = new ArrayList<BrandVO>();
		jsonObject = JSONObject.fromObject(resultJson);
		String successe = jsonObject.get("success").toString();
		if (!"false".equals(successe)) {
			JSONArray jsonArray = jsonObject.getJSONArray("result");
			// voList = jsonArray.toList(jsonArray, BrandVO.class);
			voList = JSONArray.toList(jsonArray, new BrandVO(),
					new JsonConfig());

			return voList;
		} else {
			return voList;
		}
	}

	public static List<NavigationVO> getSubList(List<Navigation> navigations) {
		List<NavigationVO> navigationVOs = new ArrayList<NavigationVO>();
		StringBuffer stringBuffer = new StringBuffer();

		if (navigations != null && navigations.size() > 0) {
			stringBuffer.append("[");
			for (Navigation navigation : navigations) {

				stringBuffer.append("{");
				stringBuffer.append("\"sid\":");
				stringBuffer.append("\"");
				stringBuffer.append(navigation.getSid());
				stringBuffer.append("\",");
				stringBuffer.append("\"classSid\":");
				stringBuffer.append("\"");
				stringBuffer.append(navigation.getClassSid());
				stringBuffer.append("\"");
				stringBuffer.append("}");
				stringBuffer.append(",");

			}

			stringBuffer.substring(0, stringBuffer.length() - 1);
			stringBuffer.append("]");
			String str = stringBuffer.toString();
			Map parmMap = new HashMap();
			parmMap.put("param", str);
			String resultJson = "";
			resultJson = HttpUtil.HttpPost(Constants.SSD_SYSTEM,
					"/web/displayCates.html", parmMap);
			JSONObject jsonObject = null;
			jsonObject = JSONObject.fromObject(resultJson);
			JSONArray jsonArray = jsonObject.getJSONArray("result");
			Map map = new HashMap();
			map.put("subList", NavigationVO.class);
			JSONArray array = JSONArray.fromObject(jsonArray);
			navigationVOs = JSONArray.toList(array, NavigationVO.class, map);
			for (int i = 0; i < navigationVOs.size(); i++) {
				String[] names = navigationVOs.get(i).getName().split("、");
				String navName = "";
				List<NavigationVO> navList = new ArrayList<NavigationVO>();
				for (int j = 0; j < names.length; j++) {
					navName = names[j];
					NavigationVO nav = new NavigationVO();
					nav.setName(navName);
					navList.add(nav);
				}
				for(Navigation na : navigations) {
					int sid = navigationVOs.get(i).getSid(); 
					if(sid == na.getSid()) {
						navigationVOs.get(i).setIcon(na.getIcon() !=null ? na.getIcon():"");
						navigationVOs.get(i).setBrandLink(na.getLinkBrand() != null ? na.getLinkBrand() : "");
					}
				}
				navigationVOs.get(i).setNavList(navList);
			}
		}
		return navigationVOs;
	}

	/**
	 * 
	 * @Methods Name jsonToSsdProductVO
	 * @Create In 2013-8-1 By wangdg
	 * @param json
	 * @return SsdProductVO
	 */
	public static SsdProductVO jsonToSsdProductVO(String json) {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
				.create();
		SsdProductVO vo = null;
		JSONObject jsonObject = JSONObject.fromObject(json);
		String successe = jsonObject.get("success").toString();
		if (!"false".equals(successe)) {
			jsonObject = (JSONObject) jsonObject.get("result");

			json = gson.toJson(jsonObject);
			vo = gson.fromJson(json, SsdProductVO.class);

			return vo;
		} else {
			return vo;
		}

	}

	public static List<SsdBrandDisplay> jsonToMap(String json) {
		List<SsdBrandDisplay> list = new ArrayList<SsdBrandDisplay>();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
				.create();
		JSONObject jsonObject = JSONObject.fromObject(json);
		String successe = jsonObject.get("success").toString();
		if (!"false".equals(successe)) {
			JSONArray jsonArray = (JSONArray) jsonObject.get("result");
			for (int i = 0; i < jsonArray.size(); i++) {
				json = gson.toJson(jsonArray.get(i));
				SsdBrandDisplay vo = gson.fromJson(json, SsdBrandDisplay.class);
				list.add(vo);
			}
			return list;
		} else {
			return list;
		}

	}

	public static CartItem getCartItemByDetail(String proDetailSid,String promotionPrice) {
		String resultJson = "";
		Map map = new HashMap();
		map.put("proDetailSid", proDetailSid);
		map.put("price", promotionPrice);
		resultJson = HttpUtil.HttpPost(Constants.SSD_SYSTEM,
				"/web/cartItem.html", map);
		JSONObject jsonObject = null;
		jsonObject = (JSONObject) JSONObject.fromObject(resultJson).get(
				"result");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
				.create();
		resultJson = gson.toJson(jsonObject);
		CartItem cartItem = gson.fromJson(resultJson, CartItem.class);
		return cartItem;
	}

	/**
	 * 
	 * @Methods Name jsonToCartItem
	 * @Create In 2013-8-1 By wangdg
	 * @param json
	 * @return CartItem
	 */
	public static CartItem jsonToCartItem(String json) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
				.create();
		JSONObject jsonObject = JSONObject.fromObject(json);
		jsonObject = (JSONObject) jsonObject.get("result");

		json = gson.toJson(jsonObject);
		CartItem cartItem = gson.fromJson(json, CartItem.class);

		return cartItem;
	}

	public static Long jsonToLong(String json) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
				.create();
		JSONObject jsonObject = JSONObject.fromObject(json);
		Long stock = Long.valueOf(jsonObject.getInt("result"));

		return stock;
	}
}

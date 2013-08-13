/**
 * @Probject Name: framework
 * @Path: base.framework.json.JsonUtil.java
 * @Create By kongm
 * @Create In 2013-7-15 下午2:54:06
 * TODO
 */
/**
 * 说 明     : Json 工具类
 * author: 陆湘星
 * data  : 2011-5-26
 * email : xiangxingchina@163.com
 **/
package base.framework.json;
/**
 * 说 明     : Json 工具类
 * author: 陆湘星
 * data  : 2011-5-26
 * email : xiangxingchina@163.com
 **/

import java.util.Collection;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class JsonUtil {
	public static String Object2Json(Object obj) {
		String jsonStr = "";
		if (obj != null) {
			if (isArray(obj)) {
				JSONArray jsonArray = JSONArray.fromObject(obj);
				jsonStr = jsonArray.toString();
			} else {
				JSONObject jsonObject = JSONObject.fromObject(obj);
				jsonStr = jsonObject.toString();
			}
		}
		return jsonStr;
	}

	public static String Object2JsonFilterNull(Object obj) {
		return Object2JsonFilter(obj);
		// return MyJsonUtil.toJson(obj);
		// return JsonUtils.objectToJson(obj);
	}

	/**
	 * 说明：增加日期过滤
	 * @author Soyona 
	 * @param obj
	 * @return
	 */
	public static String Object2JsonFilter(Object obj) {
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new JsonPropertyFilter());
		config.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		String jsonStr = "";
		if (obj != null) {
			if (isArray(obj)) {
				JSONArray jsonArray = JSONArray.fromObject(obj, config);
				jsonStr = jsonArray.toString();
			} else {
				JSONObject jsonObject = JSONObject.fromObject(obj, config);
				jsonStr = jsonObject.toString();
			}
		}
		return jsonStr;
	}

	public static void Json2Object(String jsonStr, Object target) {
		if (target != null && jsonStr.length() > 0 && jsonStr.charAt(0) == '[') {
			JSONArray jsonArray = JSONArray.fromObject(jsonStr);
			if (target.getClass().isArray()) {
				JSONArray.toArray(jsonArray, target, new JsonConfig());
			} else {
				JSONArray.toList(jsonArray, target, new JsonConfig());
			}

		} else {
			JSONObject jsonObject = JSONObject.fromObject(jsonStr);
			JSONObject.toBean(jsonObject, target, new JsonConfig());
		}
	}

	private static boolean isArray(Object obj) {
		return obj instanceof Collection || obj.getClass().isArray();
	}

}

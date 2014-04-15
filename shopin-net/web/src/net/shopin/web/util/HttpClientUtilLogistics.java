package net.shopin.web.util;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.view.OrderVO;

import org.apache.commons.lang.StringUtils;

import com.shopin.core.util.DataConvertUtil;

import common.Logger;

public class HttpClientUtilLogistics {
	
	private static final Logger log = Logger.getLogger(HttpClientUtilLogistics.class);

	private static final String LOGISTICS_GET_SENDCOST_URL = LoadProperties.readValue("logistics_get_sendcost_url");
	private static final String LOGISTICS_GET_SENTTYPE_URL = LoadProperties.readValue("logistics_get_senttype_url");
	
	
	
	/**
	 * 获取配送方式
	 * @return
	 */
	public static Map<String, String> getSentType(OrderVO order){
		// 调用物流接口查询配送方式
		Map<String, String> sentTypeMap = new TreeMap<String, String>();
		String str="{\"SID\":\"\",\"CARRIER_NAME\":\""+order.getInceptProvinceSid()+"\",\"CANAL\":\"WEB\"}";
		String json = HttpUtil.HttpPostForLogistics(LOGISTICS_GET_SENTTYPE_URL, "GetDispatchInfoByDsid", str);
		log.info("调用物流查询配送方式接口返回结果：" + json);
		if (StringUtils.isNotBlank(json)) {
			JSONObject jo = JSONObject.fromObject(json);
			JSONObject jsonObject = jo.getJSONObject("GetDispatchInfoByDsidResult");
			if (jsonObject.containsKey("success") && "true".equals(jsonObject.getString("success"))) {
				JSONArray jsonArray = jsonObject.getJSONArray("list");
				for (int i = 0; i < jsonArray.size(); i++) {
					JSONObject js = (JSONObject) jsonArray.get(i);
					// 货到付款的配货方式在页面上不显示出来
					/*if ("4".equals(js.getString("SID"))) {
						continue;
					}*/
					sentTypeMap.put(js.getString("SID"), js.getString("CARRIER_NAME"));
				}
			}
		}
		return sentTypeMap;
	}
	
	/**
	 * 根据配送城市和配送方式获取邮费
	 * @param cityId
	 * @param expressTypeId
	 * @return
	 */
	public static BigDecimal getSendCost(String cityId, String expressTypeId){
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("cityId", cityId);
		paramMap.put("expressTypeId", expressTypeId);
		String paramJson = DataConvertUtil.converBeanToJson(paramMap);
		String sendCostjson = HttpUtil.HttpPostForLogistics(LOGISTICS_GET_SENDCOST_URL, "GetDispatch", paramJson);
		log.info("查运费的url=" + LOGISTICS_GET_SENDCOST_URL + ", 参数：" + paramJson);
		log.info("物流系统查询运费返回结果：" + sendCostjson);
		BigDecimal sendCost = null;
		if (StringUtils.isNotBlank(sendCostjson)) {
			JSONObject costjo = JSONObject.fromObject(sendCostjson);
			JSONObject moneyjo = costjo.getJSONObject("GetDispatchResult");
			String money = moneyjo.getString("Money");
			if (StringUtils.isNotBlank(money)) {
				sendCost = new BigDecimal(money);
			}
		}
		//return new BigDecimal(10);
		return sendCost;
	}
}

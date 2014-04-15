package net.shopin.web.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.view.OrderDetailVO;
import net.shopin.view.OrderVO;
import net.shopin.view.WebProductVO;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.shopin.core.util.DataConvertUtil;

/**
 * 说明:
 * @author guansq
 * @date 2013-4-25 上午10:33:48
 * @modify 
 */
public class OrderUtil {
	private static final String REMOTE_ORDEROMS_URL = LoadProperties.readValue("remote_orderOMS_url");
	public static final String SSD_SYSTEM = LoadProperties.readValue("SSD_system");
	private static final Logger log = Logger.getLogger(OrderUtil.class);
	
	public static void main(String[] args) {
		//getOrderByNO4OMS("20131024458878");
		//getOrderDetailsByOrderNo("20131024458878");
		getTJProducts();
	}
		/**
	 * 根据订单号查询订单主表的信息(不包含明细信息)
	 * @param orderNo
	 * @return
	 */
	public static OrderVO getOrderByNO(String orderNo, boolean needDetails) {
		OrderVO order = null;
		try {
			JSONObject params = new JSONObject();
			params.put("fromSystem", "web");
			params.put("orderNo", orderNo);
			log.info("调用 order/getOrderByOrderNo , 参数：" + params.toString());
			String json = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "order/getOrderByOrderNo", params.toString());
			log.info("调用 order/getOrderByOrderNo , 结果：" + json);
			if (StringUtils.isNotBlank(json)) {
				JSONObject jo = JSONObject.fromObject(json);
				if("true".equals(jo.getString("success"))) {
					JSONObject orderJo = jo.getJSONObject("obj");
					order = DataConvertUtil.convertJsonToBean(OrderVO.class, orderJo+"", new HashMap());
					if (needDetails) {
						List<OrderDetailVO> odVOList = getOrderDetailsByOrderNo(orderNo);
						order.setOrderDetails(odVOList);
					}
				}
			}
		} catch (Exception e) {
			log.error("调用order/getOrderByOrderNo 获取订单主数据失败");
			e.printStackTrace();
		}
		return order;
	}
	
	
	/**
	 * 根据订单号查询订单明细信息
	 * @param orderNo
	 * @return
	 */
	public static List<OrderDetailVO> getOrderDetailsByOrderNo(String orderNo){
		List<OrderDetailVO> orderDetails = new ArrayList<OrderDetailVO>();
		try {
			JSONObject params = new JSONObject();
			params.put("fromSystem", "web");
			params.put("orderNo", orderNo);
			log.info("调用 orderDetail/selectOrderDetailListByOrderSid , 参数：" + params.toString());
			String json = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "orderDetail/selectOrderDetailListByOrderSid", params.toString());
			log.info("调用orderDetail/selectOrderDetailListByOrderSid , 结果：" + json);
			if (StringUtils.isNotBlank(json)) {
				JSONObject jo = JSONObject.fromObject(json);
				if("true".equals(jo.getString("success"))) {
					JSONArray jsonArray = jo.getJSONArray("list");
					for (int i = 0; i < jsonArray.size(); i++) {
						JSONObject detailJo = jsonArray.getJSONObject(i);
						OrderDetailVO orderDetailvo = DataConvertUtil.convertJsonToBean(OrderDetailVO.class, detailJo+"", new HashMap());
						orderDetails.add(orderDetailvo);
					}
				}
			}
		} catch (Exception e) {
			log.error("调用orderDetail/selectOrderDetailListByOrderSid 获取订单明细数据失败");
			e.printStackTrace();
		}
		return orderDetails;
	}
	
	public static Double getOrderWaitPaySum(String orderNo) {
		Double waitPaySum = 0d;
		try{
			log.info("开始调用order/getOrderByOrderNo 参数：orderNo=" +orderNo);
			String json = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "order/getOrderByOrderNo", "{'fromSystem':'web','orderNo':'"+orderNo+"'}");
			log.info("调用返回结果：" + json);
			JSONObject jo = JSONObject.fromObject(json);
			JSONObject orderJo = (JSONObject)jo.get("obj");
			waitPaySum = orderJo.getDouble("needSaleMoneySum");
		}catch(Exception e){
			log.error("调用接口：order/getOrderByOrderNo ， 参数：orderNo=" +orderNo +", 出错。");
		}
		return waitPaySum;
	}
	
	public static OrderVO getOrderBySid(String orderSid) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("orderSid", orderSid);
		//String json = HttpUtil.HttpPost(REMOTE_ORDERDP_URL, "dpOrderService/getOrderBySid", paramMap);
		String json = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "order/getOrderByOrderSid",
				"{'fromSystem':'WEB','orderSid':'" + orderSid + "'}");
		JSONObject jo = JSONObject.fromObject(json);
		OrderVO order = null;
		if("true".equals(jo.getString("success"))) {
			order = (OrderVO)JSONObject.toBean((JSONObject)jo.get("obj"), OrderVO.class);
			
			List<OrderDetailVO> odVOList = new ArrayList<OrderDetailVO>();
			JSONObject orderJo = (JSONObject)jo.get("obj");
			
			order.setPaymentModeSid(orderJo.getString("paymentTypeSid"));
			order.setOrderId(orderJo.getString("sid"));
			String orderNo = orderJo.getString("orderNo");
			String detailJson = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "orderDetail/selectOrderDetailListByOrderSid",
					"{'fromSystem':'WEB','orderNo':'" + orderNo + "'}");
			JSONObject detailJo = JSONObject.fromObject(detailJson);
			
			JSONArray odVOArray = detailJo.getJSONArray("list");
			for(int i = 0; i < odVOArray.size(); i++) {
				OrderDetailVO odVO = (OrderDetailVO)JSONObject.toBean((JSONObject)odVOArray.getJSONObject(i), OrderDetailVO.class);
				odVOList.add(odVO);
			}
			order.setOrderDetails(odVOList);
		}
		return order;
	}
	
	public static Long getOrderCount(String memberSid) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("memberSid", memberSid);
		paramMap.put("orderStatus", "2");
		String json = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL, "orderService/getOrdersCountByParam", paramMap);
		JSONObject jo = JSONObject.fromObject(json);
		Long count = jo.getLong("totalCounts");
		return count;
	}
	
	/**
	 * 订单支付成功后，获取商品推荐列表
	 * @return
	 */
	public static List<WebProductVO> getTJProducts(){
		List<WebProductVO> webProductVOList = new ArrayList<WebProductVO>();
		try {
			Map<String, String> parmMap = new HashMap<String, String>();
			parmMap.put("size", "4");
			String proDetailJsonStr = HttpUtil.HttpPost(SystemConstants.SSD_system, "/web/randomProducts.html", parmMap);
			JSONObject proDetailJson = JSONObject.fromObject( "{'prodetaillist':"+proDetailJsonStr+"}");
			log.info("调用web/randomProducts.html查询商品推荐信息返回参数结果为:"+proDetailJsonStr);
			JSONArray array = proDetailJson.getJSONArray("prodetaillist");
			for (int i = 0; i < array.size(); i++) {
				WebProductVO wdv = new WebProductVO();
				JSONObject jb = array.getJSONObject(i);
				wdv.setId(jb.getString("id"));
				wdv.setProductImages(jb.getString("productImages"));
				wdv.setProCurPrice(jb.getString("proCurPrice"));
				wdv.setProductName(jb.getString("productName"));
				wdv.setOffValue(Double.parseDouble(jb.getString("offValue")));
				webProductVOList.add(wdv);
			}
		} catch (Exception e) {
			log.error("获取推荐商品失败");
			e.printStackTrace();
		}
	       return webProductVOList;
	}
	
}

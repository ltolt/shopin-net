package net.shopin.web.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;


/**
 * Created by IntelliJ IDEA.
 * User: wchao
 * Date: 12-11-29
 * Time: 下午7:14
 * To change this template use File | Settings | File Templates.
 */
public class OrderPaymentUtil {

    protected static final Logger logger = Logger.getLogger(OrderPaymentUtil.class);
    private static final String REMOTE_ORDEROMS_URL = LoadProperties.readValue("remote_orderOMS_url");
    private static final String REMOTE_MMS_URL = LoadProperties.readValue("amq_url");

    public static String orderPayment(String orderNO, String totalFee, String tradeNo, String discount) {
        /*Map paramMap = new HashMap();

        paramMap.put("msgMethod", "orderPayment");
        paramMap.put("msgSource", "web");

        paramMap.put("orderNo", orderNO);
        paramMap.put("orderStatus", "3");
        paramMap.put("tradeNo", tradeNo);
        paramMap.put("totalFee", totalFee);
        paramMap.put("discount", discount);
        logger.info("----------------------------CALL PAY----------------------------");
        String result = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL, "orderService/sendSynOrderInfoMessage", paramMap);
        logger.info("------------------------OrerNo=" + orderNO + "------------------------");
        logger.info("------------------------CALL PAY SUCCESS------------------------");
        return result;*/
    	
    	Map paramMap = new HashMap();
    	String content = createContentJson(orderNO, tradeNo, totalFee, discount);
     	paramMap.put("queueType", "queue");
        paramMap.put("queueGroup", "oms");
        paramMap.put("queueBackURL", REMOTE_ORDEROMS_URL + "/pay/payOrder");
        paramMap.put("messageSource", "web");
        paramMap.put("callMethod", "post");
        paramMap.put("paramMethod", "b");
        paramMap.put("encoded", "utf-8");
        paramMap.put("queueContent", content);
 
        logger.info("----------------------------CALL PAY----------------------------");
        //String result = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL, "orderInfoMsgSyn/sendSynOrderInfoMessage", paramMap);
        String result = HttpUtil.HttpPost(REMOTE_MMS_URL, "/sendMessage.json", paramMap);
        logger.info("------------------------OrerNo=" + orderNO + "------------------------");
        logger.info("------------------------CALL PAY SUCCESS------------------------");
        return result;
        
        
        /*logger.info("支付成功，发送消息回调oms支付接口：" + content);
        try {
			//MessageUtil.sendOrderMessageToOMS("orderPayment", content);
			MessageUtil.sendOrderMessageToOMS("pay/payOrder", content);
		} catch (Exception e) {
			logger.error("支付成功时向oms发送消息失败！");
		}*/
    }
    
    /**
     * 拼装发送消息的参数
     * @param orderNo
     * @param tradeNo
     * @param totalFee
     * @param discount
     * @return
     */
    private static String createContentJson(String orderNo, String tradeNo, String totalFee, String discount) {
		if(StringUtils.isEmpty(tradeNo) && StringUtils.isEmpty(totalFee) && StringUtils.isEmpty(discount)) {
			return null;
		}
		StringBuffer json = new StringBuffer("{'fromSystem':'web',");
		json.append("'orderNo':" + (StringUtils.isNotEmpty(orderNo) ? "'" + orderNo + "'," : "'',"));
		json.append("'tradeNo':" + (StringUtils.isNotEmpty(tradeNo) ? "'" + tradeNo + "'," : "'',"));
		json.append("'totalFee':" + (StringUtils.isNotEmpty(totalFee) ? "'" + totalFee + "'," : "'',"));
		//json.append("'discount':" + (StringUtils.isNotEmpty(discount) ? "'" + discount + "'" : "''"));
		json.append("'discount':'0'");//默认为0，已经废掉
		json.append("}");
		return json.toString();
	}
}

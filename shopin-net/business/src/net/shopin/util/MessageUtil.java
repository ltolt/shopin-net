package net.shopin.util;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

/**
 * 消息发送工具类<BR>
 * 代理发送商品上下架的消息。
 * 
 * @author wangmeng
 * 
 */
public class MessageUtil {

	public static String MSG_TYPE_SELLING = "3";
	public static String MSG_TYPE_UNSELLING = "4";

	private static String BUSINESS_NEW_URL = LoadProperties.readValue("business_new_url");

    public static void sendUpdatePriceIndexMsg(String contentJson) {
        try {
            //1.构造http参数
            MultiValueMap<String, String> paraMap = new LinkedMultiValueMap<String, String>();
            paraMap.add("msgs", contentJson);
            System.out.println(contentJson);
            RestTemplate restTemplate = new RestTemplate();
            restTemplate.postForObject(BUSINESS_NEW_URL + "/proUpdatePrice.json", paraMap, String.class);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    public static void sendSellingIndexMsg(Integer proSid) {
		sendIndexMsg(proSid, MSG_TYPE_SELLING);
	}

	public static void sendUnsellingIndexMsg(Integer proSid) {
		sendIndexMsg(proSid, MSG_TYPE_UNSELLING);
	}

	public static void sendIndexMsg(Integer proSid, String msgType) {
		try {
			// 1.构造http参数
			MultiValueMap<String, String> parmMap = new LinkedMultiValueMap<String, String>();

			parmMap.add("proSid", proSid.toString());
			RestTemplate restTemplate = new RestTemplate();
			// 3.发送http请求。
			if (MSG_TYPE_SELLING.equals(msgType)) {
				restTemplate.postForObject(BUSINESS_NEW_URL + "/proSelling.json", parmMap,
						String.class);
			} else {
				restTemplate.postForObject(BUSINESS_NEW_URL + "/proUnSelling.json", parmMap,
						String.class);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

package net.shopin.web.util;

import net.shopin.message.api.DefaultMessageClient;
import net.shopin.message.api.IMessageClient;
import net.shopin.message.request.SendMessageRequest;

/**
 * Created by IntelliJ IDEA.
 * User: kongm
 * Date: 13-6-5
 * Time: 下午2:42
 * To change this template use File | Settings | File Templates.
 */
public class MessageUtil {


    public static String MSG_TYPE_SELLING = "3";
    public static String MSG_TYPE_UNSELLING = "4";

    private static String OMS_QUEUE_SENDING_URL = LoadProperties.readValue("amq_url");
    private static String SSD_QUEUE_SENDING_URL = LoadProperties.readValue("ssd_queue_sending_url");

    private static String ORDER_BACK_URL = LoadProperties.readValue("order_back_url");

    private static String SSD_INDEX_RETURN_URL_SJ = LoadProperties.readValue("ssd_queue_return_url_sj");
    private static String SSD_INDEX_RETURN_URL_XJ = LoadProperties.readValue("ssd_queue_return_url_xj");

    private static String THIRD_RETURN_URL_XJ = LoadProperties.readValue("third_queue_return_url_xj");

    public static void sendMsgForThird(String proSid, String msgType) throws Exception {

        try {
            // 设置mms服务器的发送地址
            IMessageClient client = new DefaultMessageClient(SSD_QUEUE_SENDING_URL);

            SendMessageRequest request = new SendMessageRequest();
            // 设置对队列类型，默认值queue，可以省略。
            request.setQueueType("queue");
            request.setQueueGroup("thirdPrice");
            request.setSubType("third");
            // 设置对队列分组，默认值fast，可以省略。
            // 设置消息处理接口的URL
            if (MSG_TYPE_SELLING.equals(msgType)) {

            } else if (MSG_TYPE_UNSELLING.equals(msgType)) {
                request.setMessageSource("web_proUnSelling");
                request.setQueueBackURL(THIRD_RETURN_URL_XJ);
            }

            // 设置消息内容,可以使任意字符串，推荐使用JSON格式。
            String proIndexJson = "{item:{'proListSid':'"+ proSid +"'}}";
            request.setQueueContent(proIndexJson);

            client.execute(request);

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

    }


    public static void sendIndexMsgForSSD(String proSid, String msgType) throws Exception {
        try {
            // 设置mms服务器的发送地址
            IMessageClient client = new DefaultMessageClient(SSD_QUEUE_SENDING_URL);

            SendMessageRequest request = new SendMessageRequest();
            // 设置对队列类型，默认值queue，可以省略。
            request.setQueueType("queue");
            request.setQueueGroup("ssd");
            request.setSubType("search");
            // 设置对队列分组，默认值fast，可以省略。
            // 设置消息处理接口的URL
            if (MSG_TYPE_SELLING.equals(msgType)) {
                request.setMessageSource("web");
                request.setQueueBackURL(SSD_INDEX_RETURN_URL_SJ);
            } else if (MSG_TYPE_UNSELLING.equals(msgType)) {
                request.setMessageSource("web");
                request.setQueueBackURL(SSD_INDEX_RETURN_URL_XJ);
            }

            // 设置消息内容,可以使任意字符串，推荐使用JSON格式。
            String proIndexJson = "[{\"productSid\":\"" + proSid + "\"}]";
            request.setQueueContent(proIndexJson);

            client.execute(request);

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
    
    
    /**
     * 支付成功后，会调用此方法发送消息
     * @param content
     * @throws Exception
     */
    public static void sendOrderMessageToOMS(String method, String content) throws Exception {
    	 try {
             // 设置mms服务器的发送地址
             IMessageClient client = new DefaultMessageClient(OMS_QUEUE_SENDING_URL);

             SendMessageRequest request = new SendMessageRequest();
             // 设置对队列类型，默认值queue，可以省略。
             request.setQueueType("queue");
             request.setQueueGroup("high");
             request.setMessageSource("web");
             request.setCallMethod("post");
             request.setSubType("");
             String queueBackUrl = ORDER_BACK_URL + "/" + method;
             request.setQueueBackURL(queueBackUrl);
             request.setQueueContent(content);
             client.execute(request);
         } catch (Exception e) {
             e.printStackTrace();
             throw e;
         }

    }

}

package net.shopin.web.conf;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;

/**
 * 名称:支付宝快捷支付主类
 * 功能：支付宝外部服务接口控制
 *
 *
 *
 * Created by IntelliJ IDEA.
 * User: kongming
 * Date: 12-7-24
 * Time: 上午10:52
 * To change this template use File | Settings | File Templates.
 */
public class AlipayKJPayment {

    /**
     * 生成SIGN的方法
     * @param paygateway
     * @param service
     * @param sign_type
     * @param out_trade_no
     * @param input_charset
     * @param partner
     * @param key
     * @param show_url
     * @param body
     * @param total_fee
     * @param payment_type
     * @param seller_email
     * @param subject
     * @param notify_url
     * @param return_url
     * @param paymethod
     * @param defaultbank
     * @param default_login
     * @return
     */
    public static String createURL(String paygateway, String service, String sign_type,
                                   String out_trade_no, String input_charset,
                                   String partner, String key, String show_url,
                                   String body, String total_fee, String payment_type,
                                   String seller_email, String subject, String notify_url,
                                   String return_url, String paymethod, String defaultbank,String default_login){

        Map params = new HashMap();
        params.put("service", service);
        params.put("partner", partner);
        params.put("subject", subject);
        params.put("body", body);
        params.put("out_trade_no", out_trade_no);
        params.put("total_fee", total_fee);
        params.put("show_url", show_url);
        params.put("payment_type", payment_type);
        params.put("seller_email", seller_email);
        params.put("return_url", return_url);
        params.put("notify_url", notify_url);
        params.put("paymethod", paymethod);
        params.put("defaultbank", defaultbank);
        params.put("_input_charset", input_charset);
        params.put("default_login",default_login);

        params = paraFilter(params);
        String sign = Md5Encrypt.md5(getContent(params, key));
        return sign;

    }
    /**
        * 除去数组中的空值和签名参数
        * @param sArray 签名参数组
        * @return 去掉空值与签名参数后的新签名参数组
        */
       public static Map<String, String> paraFilter(Map<String, String> sArray) {

           Map<String, String> result = new HashMap<String, String>();

           if (sArray == null || sArray.size() <= 0) {
               return result;
           }

           for (String key : sArray.keySet()) {
               String value = sArray.get(key);
               if (value == null || value.equals("") || key.equalsIgnoreCase("sign")
                   || key.equalsIgnoreCase("sign_type")) {
                   continue;
               }
               result.put(key, value);
           }

           return result;
       }

    


    public static void main(String [] args){


        System.out.println(AlipayKJPayment.createURL(
            "","create_direct_pay_by_user",
                "MD5",
                "20120724153718",
                "UTF-8",
                "2088101568355903",
                "ldpdr169a3e5n86i9f92sn3cznbyx72s",
                "http://www.xxx.com/order/myorder.jsp",
                "上品折扣",
                "0.01",
                "1",
                "alipay-test08@alipay.com",
                "上品折扣",
                "http://www.xxx.cn/create_direct_pay_by_user_jsp_utf8/notify_url.jsp",
                "http://127.0.0.1:8080/create_direct_pay_by_user_jsp_utf8/return_url.jsp",
                "expressGatewayDebit",
                null,
                "Y"
        ));
    }

     /**
     * 功能：将安全校验码和参数排序
     * 参数集合
     *
     * @param params     安全校验码
     * @param privateKey
     */
    private static String getContent(Map params, String privateKey) {
        List keys = new ArrayList(params.keySet());
        Collections.sort(keys);

        String prestr = "";

        for (int i = 0; i < keys.size(); i++) {
            String key = (String) keys.get(i);
            String value = (String) params.get(key);

            
            if (i == keys.size() - 1) {
                prestr = prestr + key + "=" + value;
            } else {
                prestr = prestr + key + "=" + value + "&";
            }
        }

        return prestr + privateKey;
    }



}

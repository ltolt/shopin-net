package net.shopin.web.userShare;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;

public class Payment {

    public static String CreateUrl(String paygateway, String service, String sign_type,
    		String input_charset,
    		String partner,String key,
    	
    		String return_url) {

        Map params = new HashMap();
        params.put("service", service);
        params.put("partner", partner);
        
        params.put("return_url", return_url);
        params.put("_input_charset", input_charset);

        String prestr = "";

        prestr = prestr + key;
        //System.out.println("prestr=" + prestr);

        String sign = Md5Encrypt.md5(getContent(params, key));

        String parameter = "";
        parameter = parameter + paygateway;

        List keys = new ArrayList(params.keySet());
        for (int i = 0; i < keys.size(); i++) {
            try {
                parameter = parameter + keys.get(i) + "="
                            + URLEncoder.encode((String) params.get(keys.get(i)), input_charset) + "&";
            } catch (UnsupportedEncodingException e) {

                e.printStackTrace();
            }
        }

        parameter = parameter + "sign=" + sign + "&sign_type=" + sign_type;

        return sign;

    }

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

    public static void main(String[] args) {
        System.out.println(CreateUrl("https://www.alipay.com/cooperate/gateway.do?","user_authentication","MD5","utf-8","2088002692486430","7e8zsuhffm3f8gdaolfexxdjau6d5mjz","http://www.shopin.net/alipayReturn/index.html"));
    }
}

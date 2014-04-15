package com.shopin.modules.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: liuqw
 * Date: 12-3-27
 * Time: 上午10:57
 * To change this template use File | Settings | File Templates.
 */
public class SendMessage {

    public static void main(String args[]) {
//        toSendByGet("sendDelStoreMessage","reduction_pad_from","net_021","STOREPROCEDURE","","3959983:2222","1","21","172.16.100.133");
//        toSendByPost("sendDelStoreMessage", "reduction_pad_from", "net_021", "STOREPROCEDURE", "", "3959983:001;3959982:11;3959983:2222;3959983:333", "1", "21", "172.16.100.133");
        List<String> details=new ArrayList<String>();
        details.add("4962714");
        System.out.println(getProperty(details));
    }

    public static String AMQ_URL = LoadServerProperties.readValue("AMQ_URL");
    public static String BACK_SERVER = LoadServerProperties.readValue("BACK_SERVER");
    public static String STORE_METHOD = LoadServerProperties.readValue("STORE_METHOD");
    public static String PRODUCT_TYPE = LoadServerProperties.readValue("PRODUCT_TYPE");
    public static String STOREPROCEDURE_TYPE = LoadServerProperties.readValue("STOREPROCEDURE_TYPE");
    public static String REDUCTION_NET_FROM = LoadServerProperties.readValue("REDUCTION_NET_FROM");
    public static String REDUCTION_TMALL_FROM = LoadServerProperties.readValue("REDUCTION_TMALL_FROM");
    public static String REDUCTION_TC_FROM = LoadServerProperties.readValue("REDUCTION_TC_FROM");
    public static String REDUCTION_PP_FROM = LoadServerProperties.readValue("REDUCTION_PP_FROM");

    public static String ADD_NET_FROM = LoadServerProperties.readValue("ADD_NET_FROM");
    public static String ADD_TMALL_from = LoadServerProperties.readValue("ADD_TMALL_from");
    public static String ADD_TC_from = LoadServerProperties.readValue("ADD_TC_from");
    public static String ADD_PP_from = LoadServerProperties.readValue("ADD_PP_from");


    //http get方式调用接口
    public static String toSendByGet(String method, String messageSource, String uuid, String messageType, String pdSid, String pdSids, String storeNum, String sourceNum, String ip) {
        InputStream is = null;
        BufferedReader in = null;
        HttpURLConnection conn = null;
        String url = AMQ_URL + method + ".html?messageSource=" + messageSource + "&uuid=" + uuid + "&messageType=" + messageType + "&pdSid=" + pdSid + "&pdSids=" + pdSids + "&storeNum=" + storeNum + "&sourceNum=" + sourceNum + "&ip=" + ip;
        //System.out.println("访问 = " + url);
        try {
            URL serverUrl = new URL(url);
            conn = (HttpURLConnection) serverUrl.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            conn.connect();
            is = conn.getInputStream();
            //转码成UTF-8
            in = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            StringBuffer buffer = new StringBuffer();
            String line = "";
            while ((line = in.readLine()) != null) {
                buffer.append(line);
            }
            String result = buffer.toString();
            conn.disconnect();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("请求出错啦");
            return "";
        } finally {
            is = null;
            in = null;
            if (conn != null) {
                conn.disconnect();
            }
            conn = null;
        }
    }

    //http post方式调用接口
    public static String toSendByPost(String method, String messageSource, String uuid, String messageType, String pdSid, String pdSids, String storeNum, String sourceNum, String ip) {
        InputStream is = null;
        BufferedReader in = null;
        HttpURLConnection conn = null;
        String url = AMQ_URL + method + ".html";
        System.out.println("访问 = " + url);
        try {
            URL serverUrl = new URL(url);
            conn = (HttpURLConnection) serverUrl.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            OutputStream os = conn.getOutputStream();
            String date = "messageSource=" + messageSource + "&uuid=" + uuid + "&messageType=" + messageType + "&pdSid=" + pdSid + "&pdSids=" + pdSids + "&storeNum=" + storeNum + "&sourceNum=" + sourceNum + "&ip=" + ip;
            os.write(date.getBytes());
            conn.connect();
            is = conn.getInputStream();
            //转码成UTF-8
            in = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            StringBuffer buffer = new StringBuffer();
            String line = "";
            while ((line = in.readLine()) != null) {
                buffer.append(line);
            }
            String result = buffer.toString();
            conn.disconnect();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("请求出错啦");
            return "";
        } finally {
            is = null;
            in = null;
            if (conn != null) {
                conn.disconnect();
            }
            conn = null;
        }
    }

    public static String getUUID() {
        String s = UUID.randomUUID().toString();
        return s.substring(0, 8) + s.substring(9, 13) + s.substring(14, 18) +
                s.substring(19, 23) + s.substring(24);
    }

    public static String getProperty(List<String> details) {
        StringBuilder sb = new StringBuilder();
        for (String detail : details) {
            sb.append(detail + ":" + "0;");
        }
        if (sb.length() > 1) {
            return sb.toString().substring(0, sb.toString().length() - 1);
        } else {
            return "";
        }
    }

}

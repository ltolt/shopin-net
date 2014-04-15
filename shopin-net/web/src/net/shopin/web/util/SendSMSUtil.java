package net.shopin.web.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 * 手机短信发送工具
 * Created by IntelliJ IDEA.
 * User: kongm
 * Date: 13-1-11
 * Time: 下午5:52
 * To change this template use File | Settings | File Templates.
 */
public class SendSMSUtil {

    public static void sendSms(String phone, String code) {
        String sms = "您好，您的验证码为：" + code + "【上品折扣网】.";
        URL U = null;
        try {
            String url = "http://114.255.71.158:8060/?username=spfz&password=spzkwz&message=" + URLEncoder.encode(sms, "GBK") + "&phone=" + phone + "&epid=108927&linkid=&subcode=";
            U = new URL(url);
            URLConnection connection = U.openConnection();
            connection.connect();
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));

            String line;
            while ((line = in.readLine()) != null) ;
            in.close();
        } catch (Exception e) {
            try {
                Thread.sleep(500L);
                String url = "http://114.255.71.158:8060/?username=spfz&password=spzkwz&message=" + URLEncoder.encode(sms, "GBK") + "&phone=" + phone + "&epid=108927&linkid=&subcode=";
                U = new URL(url);
                URLConnection connection = U.openConnection();
                connection.connect();
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String line;
                while ((line = in.readLine()) != null) ;
                in.close();
            } catch (Exception e1) {
                System.out.println(e1.getMessage());
            }
        }
    }
}

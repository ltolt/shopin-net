package net.shopin.web.conf.sinaConf;

import net.shopin.web.util.LoadProperties;
import weibo4j.Status;
import weibo4j.Weibo;
import weibo4j.WeiboException;
import weibo4j.http.AccessToken;
import weibo4j.http.RequestToken;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 11-7-4
 * Time: 下午1:31
 * To change this template use File | Settings | File Templates.
 */
public class Weboauth {
    private static String CONSUMER_KEY = LoadProperties.readValue("SINA_API_KEY");;
    private static String CONSUMER_SECRET = LoadProperties.readValue("SINA_API_SECRET");;

    public static RequestToken request(String backUrl) {
        try {
            System.setProperty("weibo4j.oauth.consumerKey", CONSUMER_KEY);
            System.setProperty("weibo4j.oauth.consumerSecret", CONSUMER_SECRET);

            Weibo weibo = new Weibo();
            RequestToken requestToken = weibo.getOAuthRequestToken(backUrl);

            //System.out.println("Got request token.");
            //System.out.println("Request token: " + requestToken.getToken());
            //System.out.println("Request token secret: "+ requestToken.getTokenSecret());
            return requestToken;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static AccessToken requstAccessToken(RequestToken requestToken,
                                                String verifier) {
        try {
            System.setProperty("weibo4j.oauth.consumerKey", CONSUMER_KEY);
            System.setProperty("weibo4j.oauth.consumerSecret",CONSUMER_SECRET);

            Weibo weibo = new Weibo();
            AccessToken accessToken = weibo.getOAuthAccessToken(requestToken
                    .getToken(), requestToken.getTokenSecret(), verifier);

            //System.out.println("Got access token.");
            //System.out.println("access token: " + accessToken.getToken());
            //System.out.println("access token secret: "+ accessToken.getTokenSecret());
            return accessToken;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void update(AccessToken access, String content) {
        try {
            Weibo weibo = new Weibo();
            weibo.setToken(access.getToken(), access.getTokenSecret());
            Status status = weibo.updateStatus(content);
            //System.out.println("Successfully updated the status to ["+ status.getText() + "].");
        } catch (WeiboException e) {
            e.printStackTrace();
        }
    }
}

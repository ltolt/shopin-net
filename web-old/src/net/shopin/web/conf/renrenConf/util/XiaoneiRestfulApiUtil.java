package net.shopin.web.conf.renrenConf.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import net.shopin.web.conf.renrenConf.model.User;
import net.shopin.web.util.LoadProperties;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.JSONArray;
import com.renren.api.client.RenrenApiClient;
import com.renren.api.client.RenrenApiConfig;

/**
 * 采用开放平台最新的java sdk包来调用restful api接口
 * 
 */
public class XiaoneiRestfulApiUtil {

	/**
	 * 传入access_token 获取session_key
	 */
	public static String getXiaonei_SessionKey_info(String access_token) {

		PostMethod method = new PostMethod(
				CommonConst.RENREN_API_SESSIONKEY_URL);
		method.addParameter("oauth_token", access_token);
		HttpClient client = new HttpClient();
		try {
			int statusCode = client.executeMethod(method);
			InputStream result = method.getResponseBodyAsStream();
			StringBuffer sessionkeyline = new StringBuffer();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					result, "UTF-8"));
			String line;
			while ((line = in.readLine()) != null) {
				sessionkeyline.append(line);
			}
			// 判断当前状态码是否是200
			if (statusCode == HttpStatus.SC_OK) {
				return sessionkeyline.toString();
			} else {// 有可能是accesstoken过期或是网络有问题
				try {
					JSONObject errormsg = new JSONObject(sessionkeyline
							.toString());
					if (errormsg.has("expired_token")) {// access_token超时
						return "expired_token";
					} else { // 不知道的网络错误
						return "error";
					}
				} catch (JSONException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	/*
	 * 从json串中获取session_key
	 */
	public static String getSessionKey(String obj) {
		JSONObject renren_token;
		try {
			renren_token = new JSONObject(obj);
			JSONObject sessionkey_obj = new JSONObject(renren_token
					.getString("renren_token"));
			return sessionkey_obj.getString("session_key");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return "";
	}

	/*
	 * 从json串中获取用户在人人网的id
	 */
	public static String getRenrenUserId(String obj) {
		JSONObject renren_userinfo;
		try {
			renren_userinfo = new JSONObject(obj);
			JSONObject sessionkey_obj = new JSONObject(renren_userinfo
					.getString("user"));
			return sessionkey_obj.getString("id");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return "";
	}

	/*
	 * 传入sessionkey json串，调用api 获取用户信息接口 把人人网 用户信息封装成本地user
	 */
	public static User getUserInfo(String sessionkey, String userid) {
		RenrenApiConfig.renrenApiKey = LoadProperties.readValue("RENREN_API_KEY");
		RenrenApiConfig.renrenApiSecret = LoadProperties.readValue("RENREN_API_SECRET");
		/*
		 * 调用JAVA SDK 传入参数sessionkey
		 */
		RenrenApiClient client = new RenrenApiClient(sessionkey);
		String fields = "id,name,sex,birthday,tinyurl,headurl,mainurl";
		/*
		 * 传入userid fields 获取用户信息 返回JSONArray 数据
		 */
		JSONArray renren_user = client.getUserService().getInfo(userid, fields);
		User user = new User();
		user.setHeadurl(((org.json.simple.JSONObject) renren_user.get(0)).get(
				"headurl").toString());
		user.setName(((org.json.simple.JSONObject) renren_user.get(0)).get(
				"name").toString());
		user.setId(Integer.valueOf(((org.json.simple.JSONObject) renren_user
				.get(0)).get("uid").toString()));

		return user;
	}
 
}

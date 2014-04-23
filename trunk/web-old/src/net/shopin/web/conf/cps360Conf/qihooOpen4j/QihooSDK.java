package net.shopin.web.conf.cps360Conf.qihooOpen4j;


/*
 Copyright (c) 2007-2009, Yusuke Yamamoto
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 * Neither the name of the Yusuke Yamamoto nor the
 names of its contributors may be used to endorse or promote products
 derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY Yusuke Yamamoto ``AS IS'' AND ANY
 EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL Yusuke Yamamoto BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.File;

import net.shopin.web.conf.cps360Conf.qihooOpen4j.http.AccessToken;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.http.HttpClient;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.http.PostParameter;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.http.Response;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.json.JSONException;
import net.shopin.web.conf.cps360Conf.qihooOpen4j.json.JSONObject;
import net.shopin.web.util.LoadProperties;

/**
 * Qihoo open sdk
 */
public class QihooSDK {
	public static String baseURL = "https://openapi.360.cn/";
	public static String authorizationURL = "https://openapi.360.cn/oauth2/authorize";
	public static String accessTokenURL = "https://openapi.360.cn/oauth2/access_token";
	public static String accessTokenURLssl = "https://openapi.360.cn/oauth2/access_token";
	public static String format = "json";

	protected HttpClient http = new HttpClient();
	protected AccessToken accessToken = null;

	private String consumerKey = LoadProperties.readValue("CLIENT_ID");
	private String consumerSecret =  LoadProperties.readValue("CLIENT_SECRET");
	private String RETURN_URL =  LoadProperties.readValue("360_RETURN_URL");
    String redirectUri = RETURN_URL.substring(0, RETURN_URL.length() - 1) + ".html";
	public void setRedirectUri(String aUri){
		redirectUri = aUri;
	}
	public void setConsumer(String aKey, String aSecret){
		consumerKey = aKey;
		consumerSecret = aSecret;
	}
	public String getAuthorizeURLforCode(String scope, String state,
			String display) {
		return getAuthorizeURL("code", scope, state, display);
	}

	public String getAuthorizeURLforToken(String scope, String state,
			String display) {
		return getAuthorizeURL("token", scope, state, display);
	}

	protected String getAuthorizeURL(String type, String scope, String state,
			String display) {
		PostParameter[] params = new PostParameter[6];
		params[1] = new PostParameter("response_type", type);
		params[0] = new PostParameter("client_id", consumerKey);
		params[2] = new PostParameter("redirect_uri", redirectUri);
		params[3] = new PostParameter("scope", scope);
		params[4] = new PostParameter("state", state);
		params[5] = new PostParameter("display", display);
		String query = HttpClient.encodeParameters(params);
		return authorizationURL + "?" + query;
	}

	public AccessToken getOAuthAccessTokenFromCode(String code)
			throws QihooException, KeyManagementException,
			NoSuchAlgorithmException {
		AccessToken oauthToken = null;
		try {
			PostParameter[] params = new PostParameter[5];
			params[0] = new PostParameter("grant_type", "authorization_code");
			params[1] = new PostParameter("client_id", consumerKey);
			params[2] = new PostParameter("client_secret", consumerSecret);
			params[3] = new PostParameter("code", code);
			params[4] = new PostParameter("redirect_uri", redirectUri);
			System.out.println(accessTokenURL);
			System.out.println(params);
			oauthToken = new AccessToken(http.get(accessTokenURL, params));
		} catch (QihooException te) {
			throw new QihooException(
					"The user has not given access to the account.", te, te
							.getStatusCode());
		}
		return oauthToken;
	}

	public AccessToken getOAuthAccessTokenFromPassword(String username,
			String password, String scope) throws QihooException,
			KeyManagementException, NoSuchAlgorithmException {
		AccessToken oauthToken = null;
		try {
			PostParameter[] params = new PostParameter[6];
			params[0] = new PostParameter("grant_type", "password");
			params[1] = new PostParameter("client_id", consumerKey);
			params[2] = new PostParameter("client_secret", consumerSecret);
			params[3] = new PostParameter("username", username);
			params[4] = new PostParameter("password", password);
			params[5] = new PostParameter("scope", scope);
			oauthToken = new AccessToken(http.get(accessTokenURLssl, params));
		} catch (QihooException te) {
			throw new QihooException(
					"The user has not given access to the account.", te, te
							.getStatusCode());
		}
		return oauthToken;
	}

	public AccessToken getOAuthAccessTokenFromRefreshtoken(
			String refresh_token, String scope) throws QihooException,
			KeyManagementException, NoSuchAlgorithmException {
		AccessToken oauthToken = null;
		try {
			PostParameter[] params = new PostParameter[5];
			params[0] = new PostParameter("grant_type", "refresh_token");
			params[1] = new PostParameter("client_id", consumerKey);
			params[2] = new PostParameter("client_secret", consumerSecret);
			params[3] = new PostParameter("refresh_token", refresh_token);
			params[4] = new PostParameter("scope", scope);
			oauthToken = new AccessToken(http.get(accessTokenURL, params));
		} catch (QihooException te) {
			throw new QihooException(
					"The user has not given access to the account.", te, te
							.getStatusCode());
		}
		return oauthToken;
	}

	public void setOAuthAccessToken(AccessToken accessToken) {
		this.accessToken = accessToken;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) {
			return true;
		}
		if (o == null || getClass() != o.getClass()) {
			return false;
		}

		QihooSDK qihooSDK = (QihooSDK) o;
		if (!http.equals(qihooSDK.http)) {
			return false;
		}
		if (!accessToken.equals(qihooSDK.accessToken)) {
			return false;
		}

		return true;
	}

	@Override
	public int hashCode() {
		int result = http.hashCode();
		result = 31 * result + accessToken.hashCode();
		return result;
	}

	@Override
	public String toString() {
		return "QihooSDK{" + "http=" + http + ", accessToken='" + accessToken
				+ '\'' + '}';
	}

	public User getMyInfo(String fields) throws QihooException,
			KeyManagementException, NoSuchAlgorithmException {
		PostParameter[] params = new PostParameter[2];
		params[0] = new PostParameter("access_token", this.accessToken
				.getToken());
		if (null == fields)
			fields = "";
		params[1] = new PostParameter("fields", fields);
		return new User(get("users/me", params).asJSONObject());
	}

	// --------------base method----------

	protected Response get(String api, PostParameter[] params)
			throws QihooException, KeyManagementException,
			NoSuchAlgorithmException {
		api = baseURL + api + "." + format;
		return http.get(api, params);
	}

	protected Response post(String api, PostParameter[] params)
			throws QihooException, KeyManagementException,
			NoSuchAlgorithmException {
		api = baseURL + api + "." + format;
		return http.post(api, params);
	}

	public User getUserMe(String token) throws QihooException,
			KeyManagementException, NoSuchAlgorithmException {
		PostParameter[] params = new PostParameter[1];
		params[0] = new PostParameter("access_token", token);
		return new User(get("user/me", params).asJSONObject());
	}
}

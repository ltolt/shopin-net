package net.shopin.web.conf.renrenConf.model;

/**
 * 专门给人人网AccessToken创建了一个model类，也可不建，主要是方便存取
 */

public class AccessToken {
	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String accessToken) {
		access_token = accessToken;
	}

	public int getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(int expiresIn) {
		expires_in = expiresIn;
	}

	public String getRefresh_token() {
		return refresh_token;
	}

	public void setRefresh_token(String refreshToken) {
		refresh_token = refreshToken;
	}

	private String access_token;
	private int expires_in;
	private String refresh_token;
}

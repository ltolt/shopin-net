package net.shopin.web.conf.cps360Conf.qihooOpen4j.http;


/*
 Copyright (c) 2007-2009, Yusuke Yamamoto
 All rights reserved.
 */

import java.io.Serializable;

import net.shopin.web.conf.cps360Conf.qihooOpen4j.QihooException;

/**
 * Representing authorized Access Token which is passed to the service provider
 * in order to access protected resources.<br>
 * the token and token secret can be stored into some persistent stores such as
 * file system or RDBMS for the further accesses.
 *
 * @author Yusuke Yamamoto - yusuke at mac.com
 */
public class AccessToken implements Serializable {
	private static final long serialVersionUID = -8344528374458826291L;
	private String access_token;
	private long expires_in;
	private String refresh_token;
	private String scope;
	private String state;

	String[] responseStr = null;

	public AccessToken(Response res) throws QihooException {
		this(res.asString());
	}

	// for test unit
	AccessToken(String str) {
		responseStr = str.split(",");
		access_token = getParameter("{\"access_token\"");
		String sexpires_in = getParameter("\"expires_in\"");
		expires_in = Long.parseLong(sexpires_in);
		refresh_token = getParameter("\"refresh_token\"");
		scope = getParameter("\"scope\"");
		state = getParameter("\"state\"");
	}

	public AccessToken(String access_token, String refresh_token) {
		this.access_token = access_token;
		this.refresh_token = refresh_token;
	}

	public String getToken() {
		return access_token;
	}

	public String getRefresh_Token() {
		return refresh_token;
	}

	public String getParameter(String parameter) {
		String value = null;
		for (String str : responseStr) {
			if (str.startsWith(parameter)) {
				value = str.split(":")[1];
				value = value.replace('"', (char) 0);
				value = value.replace('}', (char) 0);
				value = value.trim();
				break;
			}
		}
		return value;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (!(o instanceof AccessToken))
			return false;

		AccessToken that = (AccessToken) o;
		if (!access_token.equals(that.access_token))
			return false;
		if (!refresh_token.equals(that.refresh_token))
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = access_token.hashCode();
		result = 31 * result + (int) (expires_in ^ (expires_in >>> 32));
		result = 31 * result + refresh_token.hashCode();
		result = 31 * result + scope.hashCode();
		result = 31 * result + state.hashCode();
		return result;
	}

	@Override
	public String toString() {
		return "AccessToken{" + "access_token='" + access_token + '\''
				+ ", expires_in='" + Long.toString(expires_in) + '\''
				+ ", refresh_token='" + refresh_token + '\'' + ", scope='"
				+ scope + '\'' + ", state='" + state + '\'' + '}';
	}
}

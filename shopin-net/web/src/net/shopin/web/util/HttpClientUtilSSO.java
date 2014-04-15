package net.shopin.web.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import net.shopin.exception.SSORemoteException;
import net.shopin.member.utils.DESUtils;
import net.shopin.member.utils.DSAUtils;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

/**
 * Created by IntelliJ IDEA.
 * User: 51ibm
 * Date: 12-12-10
 * Time: 上午10:29
 * To change this template use File | Settings | File Templates.
 */
public class HttpClientUtilSSO {




	public static String SSOUrlContent(String webUrl, Map<String, String> paramMap) {
		//		if(StringUtils.isEmpty(SSO_ENCODING)) {
		////			SSO_ENCODING = "utf-8";
		//		}
		StringBuffer buff = new StringBuffer();
		paramMap.put("domainName", SystemConstants.DOMAIN_NAME);

		//String keyPath = HttpClientUtilSSO.class.getClassLoader().getResource("").getPath() + SystemConstants.KEY_NAME;

		String key=LoadProperties.readValue("web_private_key");
		byte[] keys=null;
		try {
			keys = DESUtils.hexStr2ByteArr(key);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sign = DSAUtils.sign(keys, paramMap);


		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod(webUrl);
		method.getParams().setParameter("http.protocol.cookie-policy", CookiePolicy.BROWSER_COMPATIBILITY);
		method.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, SystemConstants.SSO_CHARSET);
		method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(3, false));
		NameValuePair[] nameValues = new NameValuePair[paramMap.size() + 1];
		int i = 0;
		for (Map.Entry<String, String> entry : paramMap.entrySet()) {
			nameValues[i] = new NameValuePair(entry.getKey(), entry.getValue());
			i++;
		}
		nameValues[i] = new NameValuePair("sign", sign);
		method.setRequestBody(nameValues);
		try {
			//执行getMethod
			int statusCode = client.executeMethod(method);
			if (statusCode != HttpStatus.SC_OK) {
				System.err.println("Method failed: " + method.getStatusLine());
				throw new SSORemoteException(method.getStatusLine().toString());
			}
			//读取内容
			byte[] responseBody = method.getResponseBody();
			//处理内容
			buff.append(new String(responseBody, SystemConstants.SSO_ENCODING));

		} catch (HttpException e) {
			//发生致命的异常，可能是协议不对或者返回的内容有问题
			System.out.println("Please check your provided http address!");
			e.printStackTrace();
			throw new SSORemoteException(method.getStatusLine().toString());
		} catch (IOException e) {
			//发生网络异常
			e.printStackTrace();
			throw new SSORemoteException(method.getStatusLine().toString());
		} finally {
			//释放连接
			method.releaseConnection();
		}
		return buff.toString();
	}


	public static String getSign(String return_url) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("domainName", SystemConstants.DOMAIN_NAME);
		paramMap.put("return_url", return_url);
		String keyPath = HttpClientUtilSSO.class.getClassLoader().getResource("").getPath() +SystemConstants. KEY_NAME;
		return DSAUtils.sign(keyPath, paramMap);
	}




	public static String getSign(Map<String,String> paramMap) {

		String keyPath = HttpClientUtilSSO.class.getClassLoader().getResource("").getPath() + SystemConstants.KEY_NAME;
		return DSAUtils.sign(keyPath, paramMap);
	}

	public static void main(String[] args) {
		Map map = new HashMap();
		map.put("domainName", "www.shopin.net");

		map.put("realName", "1");
		String key="aced0005737200146a6176612e73656375726974792e4b6579526570bdf94fb3889aa5430200044c0009616c676f726974686d7400124c6a6176612f6c616e672f537472696e673b5b0007656e636f6465647400025b424c0006666f726d617471007e00014c00047479706574001b4c6a6176612f73656375726974792f4b657952657024547970653b7870740003445341757200025b42acf317f8060854e002000078700000014f3082014b0201003082012c06072a8648ce3804013082011f02818100fd7f53811d75122952df4a9c2eece4e7f611b7523cef4400c31e3f80b6512669455d402251fb593d8d58fabfc5f5ba30f6cb9b556cd7813b801d346ff26660b76b9950a5a49f9fe8047b1022c24fbba9d7feb7c61bf83b57e7c6a8a6150f04fb83f6d3c51ec3023554135a169132f675f3ae2b61d72aeff22203199dd14801c70215009760508f15230bccb292b982a2eb840bf0581cf502818100f7e1a085d69b3ddecbbcab5c36b857b97994afbbfa3aea82f9574c0b3d0782675159578ebad4594fe67107108180b449167123e84c281613b7cf09328cc8a6e13c167a8b547c8d28e0a3ae1e2bb3a675916ea37f0bfa213562f1fb627a01243bcca4f1bea8519089a883dfe15ae59f06928b665e807b552564014c3bfecf492a041602145d663896ac3e152493191dba0b81cd29e32e2cef740006504b435323387e7200196a6176612e73656375726974792e4b6579526570245479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074000750524956415445";
		byte[] keys=null;
		try {
			keys = DESUtils.hexStr2ByteArr(key);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(key);
		System.out.println(DSAUtils.sign(keys, map));;
	}

}

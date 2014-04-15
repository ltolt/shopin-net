package net.shopin.web.util;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.httpclient.ConnectionPoolTimeoutException;

/**
 * 通过程序发送Http请求的工具类。
 * 
 * @author keel2008
 * 
 */
public class HttpClientUtil {

	public static Long TIMEOUT = Long.valueOf(1000);

	public static String ENCODING = "UTF-8";
    /**
     * 
     * @Methods Name HttpPost
     * @Create In 2013-12-16 By liheng
     * @param url 请求url地址
     * @param method  方法名称
     * @param parmMap 请求参数 
     * @param suffix  方法后缀
     * @return String 返回结果字符串
     */
	public static String HttpPost(String url, String method,
			Map<String, String> parmMap, String suffix) {
		PostMethod postMethod = initHttpPostMethod(url, method, parmMap, suffix);

		StringBuffer sBuffer;
		try {
			// 构造HttpClient的实例
			HttpClient httpClient = new HttpClient();
			// 执行getMethod
			int statusCode = httpClient.executeMethod(postMethod);
			if (statusCode != HttpStatus.SC_OK) {
				System.err.println("Method failed: "
						+ postMethod.getStatusLine());
			}
			sBuffer = new StringBuffer(postMethod.getResponseBodyAsString());

			return sBuffer.toString();
		} catch (ConnectionPoolTimeoutException cpte) {
			System.out
					.println("ConnectionPoolTimeoutException, check your network environment!");
			cpte.printStackTrace();
		} catch (HttpException e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问题
			System.out.println("Please check your provided http address!");
			e.printStackTrace();
		} catch (IOException e) {
			// 发生网络异常
			e.printStackTrace();
		} finally {
			// 释放连接
			postMethod.releaseConnection();
		}
		return "error";
	}
	/**
	 * 
	 * @Methods Name initHttpPostMethod
	 * @Create In 2013-12-16 By liheng
	 * @param url 请求url
	 * @param method 请求方法名
	 * @param parmMap 请求参数
	 * @param suffix  方法后缀
	 * @return PostMethod  用于执行post请求的对象
	 */
	private static PostMethod initHttpPostMethod(String url, String method,
			Map<String, String> parmMap, String suffix) {

		String webUrl = url + "/" + method + "." + suffix;

		// 创建POS方法的实例
		NameValuePair[] pairs = null;
		PostMethod postMethod = new PostMethod(webUrl);

		if (parmMap != null) {
			pairs = new NameValuePair[parmMap.size()];

			int index = 0;
			for (String key : parmMap.keySet()) {
				pairs[index] = new NameValuePair(key.toString(),
						parmMap.get(key));
				index++;
			}

			postMethod.setRequestBody(pairs);
		}
		postMethod.getParams().setParameter(
				HttpMethodParams.HTTP_CONTENT_CHARSET, ENCODING);

		return postMethod;
	}


    /**
     * Get方式获取
     * @param webUrl    请求的url地址 
     * @param encoding  编码字符集
     * @return
     */
    public static String GetUrlContent(String webUrl,String encoding){
        if(encoding==null || "".equals(encoding)) encoding = "UTF-8";
        StringBuffer sBuffer = new StringBuffer();
         //构造HttpClient的实例
            HttpClient httpClient = new HttpClient();
            //创建GET方法的实例
            GetMethod getMethod = new GetMethod(webUrl);
            getMethod.addRequestHeader("Content-Type","text/html;charset="+encoding);
            //使用系统提供的默认的恢复策略
            getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
              new DefaultHttpMethodRetryHandler());
            try {
             //执行getMethod
             int statusCode = httpClient.executeMethod(getMethod);
             if (statusCode != HttpStatus.SC_OK) {
//	  	    System.err.println("Method failed: "	  	      + getMethod.getStatusLine());
             }
             //读取内容
             byte[] responseBody = getMethod.getResponseBody();
             //处理内容
             sBuffer.append(new String(responseBody,encoding));
            } catch (HttpException e) {
             //发生致命的异常，可能是协议不对或者返回的内容有问题
//	  	   System.out.println("Please check your provided http address!");
             e.printStackTrace();
            } catch (IOException e) {
             //发生网络异常
             e.printStackTrace();
            } finally {
             //释放连接
             getMethod.releaseConnection();
            }
            return sBuffer.toString();
    }


	/**
	 * 根据PageUrl获取Content
	 * @param webUrl 请求的url地址
	 * @param parameters 请求参数
	 * @param encoding  编码字符集
	 * @return
	 */
	public static String PostUrlContent(String webUrl,List<Parameter> parameters,String encoding){
		if(encoding==null || "".equals(encoding)) encoding = "UTF-8";
				StringBuffer sBuffer = new StringBuffer();
				//构造HttpClient的实例
			  	HttpClient httpClient = new HttpClient();
	  	  		//创建POS方法的实例

			  	NameValuePair[] pairs = null;
			  	PostMethod postMethod = new PostMethod(webUrl);
			  	if(parameters!=null && parameters.size()>0){
			  		pairs = new NameValuePair[parameters.size()];
			  		for (int i = 0; i < parameters.size(); i++) {
			  			Parameter parameter = parameters.get(i);
			  			pairs[i] = new NameValuePair(parameter.getKey(), parameter.getValue());
					}
			  		postMethod.setRequestBody(pairs);
			  	}
			  	postMethod.getParams().setParameter( HttpMethodParams.HTTP_CONTENT_CHARSET, encoding);

	  	  try {
	  	   //执行getMethod
	  	   int statusCode = httpClient.executeMethod(postMethod);
	  	   if (statusCode != HttpStatus.SC_OK) {
	  	    System.err.println("Method failed: " + postMethod.getStatusLine());
	  	   }
	  	   //读取内容
	  	   byte[] responseBody = postMethod.getResponseBody();
	  	   //处理内容
	  	   sBuffer.append(new String(responseBody,encoding));
	  	  } catch (HttpException e) {
	  	   //发生致命的异常，可能是协议不对或者返回的内容有问题
	  	   System.out.println("Please check your provided http address!");
	  	   e.printStackTrace();
	  	  } catch (IOException e) {
	  	   //发生网络异常
	  	   e.printStackTrace();
	  	  } finally {
	  	   //释放连接
	  		postMethod.releaseConnection();
	  	  }
	  	  return sBuffer.toString();
	}









}

/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.utilHttpUtil.java
 * @Create By kongm
 * @Create In 2013-5-17 上午10:18:21
 * TODO
 */
package net.shopin.wms.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

import com.constants.SystemConfig;
import com.google.gson.GsonBuilder;
//import com.shopin.core.util.DataConvertUtil;

/**
 * @Class Name HttpUtil
 * @Author kongm
 * @Create In 2013-5-17
 */
public class HttpUtil {
	
	public static void main(String[] args) {
		Map<String, String> paramMap = new HashMap<String, String>();
//		String json = HttpPostForLogistics("http://172.16.103.19:8001/PhotoMSService.svc", "GetUnexpirePlan", "");
//		System.out.println(json);
		paramMap.put("PlanID", "47");
		String parajson = new  GsonBuilder().create().toJson(paramMap);
//		parajson = DataConvertUtil.converBeanToJson(paramMap);
		System.out.println(parajson);
		String json = HttpPostForLogistics(SystemConfig.FLASH_PLAN, "GetUnexpirePlan","");
		System.out.println(json);
	}
	
	public static String HttpPostForLogistics(String url, String method, String str){
		String encoding="UTF-8";
		String webUrl=url+"/"+method;
		StringBuffer sBuffer = new StringBuffer();
		//构造HttpClient的实例
		HttpClient httpClient = new HttpClient();
		//创建POS方法的实例			  
		PostMethod postMethod = new PostMethod(webUrl);
		try {
			//postMethod.setRequestEntity(new ByteArrayRequestEntity(str.getBytes(),"application/json; charset=utf-8"));
			postMethod.setRequestBody(str);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		postMethod.getParams().setParameter( HttpMethodParams.HTTP_CONTENT_CHARSET, encoding); 
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(10000); //连接5秒超时
		httpClient.getHttpConnectionManager().getParams().setSoTimeout(30000);//读取30秒超时
		//postMethod.setRequestHeader("Content-type", "application/json; charset=utf-8");
		//postMethod.setDoAuthentication(false);
		//postMethod.addRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)");

		postMethod.setDoAuthentication(true);
		postMethod.addRequestHeader("Authorization", "Basic U0FQX0FNOkFubmllTWFvMTIzNA==");
		postMethod.setRequestHeader("Content-type", "application/json");
		try {
			//执行getMethod
			int statusCode = httpClient.executeMethod(postMethod);
			if (statusCode != HttpStatus.SC_OK) {
				System.err.println("Method failed: " + postMethod.getStatusLine());
				sBuffer=new StringBuffer();
			}else{
				sBuffer = new StringBuffer(postMethod.getResponseBodyAsString() + "");  
			}
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
	
	public static String HttpPost(String url, String method, Map parmMap) throws Exception{
		String encoding="UTF-8";
		String webUrl=url+"/"+method;
		if(encoding==null || "".equals(encoding)) encoding = "UTF-8";
				StringBuffer sBuffer = new StringBuffer();
				//构造HttpClient的实例
			  	HttpClient httpClient = new HttpClient();
	  	  		//创建POS方法的实例			  
			  	NameValuePair[] pairs = null;
			  	PostMethod postMethod = new PostMethod(webUrl);
			  	if(parmMap!=null){
			  		pairs = new NameValuePair[parmMap.size()];
					Set set= parmMap.keySet();
					Iterator it=set.iterator();
					int i=0;
					while(it.hasNext()){
						Object key=it.next();
						Object value=parmMap.get(key);
						pairs[i] = new NameValuePair(key.toString(), value.toString());
						i++;
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
	  	InputStream resStream = postMethod.getResponseBodyAsStream();
	  	sBuffer = new StringBuffer(postMethod.getResponseBodyAsString() + "");
	  	//modify by guanshiqiang at 2012-06-01 for 处理接收字符乱码bug end
	  	   //处理内容
	  	   //sBuffer.append(new String(responseBody,encoding));
	  	  } catch (HttpException e) {
	  	   //发生致命的异常，可能是协议不对或者返回的内容有问题
	  	   System.out.println("Please check your provided http address!");
	  	   e.printStackTrace();
	  	   throw e;
	  	  } catch (IOException e) {
	  	   e.printStackTrace();
	  	   throw e;
	  	  } finally {
	  	   //释放连接
	  		postMethod.releaseConnection();
	  	  }
	  	  return sBuffer.toString();
	}
	public static String HttpPostForJson(String url, String method, Map parmMap) {
		String encoding="UTF-8";
		String webUrl=url+"/"+method+".json";
		if(encoding==null || "".equals(encoding)) encoding = "UTF-8";
				StringBuffer sBuffer = new StringBuffer();
				//构造HttpClient的实例
			  	HttpClient httpClient = new HttpClient();
	  	  		//创建POS方法的实例			  
			  	NameValuePair[] pairs = null;
			  	PostMethod postMethod = new PostMethod(webUrl);
			  	if(parmMap!=null){
			  		pairs = new NameValuePair[parmMap.size()];
					Set set= parmMap.keySet();
					Iterator it=set.iterator();
					int i=0;
					while(it.hasNext()){
						Object key=it.next();
						Object value=parmMap.get(key);
						pairs[i] = new NameValuePair(key.toString(), value.toString());
						i++;
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
	  	InputStream resStream = postMethod.getResponseBodyAsStream();
	  	sBuffer = new StringBuffer(postMethod.getResponseBodyAsString() + "");
	  	//modify by guanshiqiang at 2012-06-01 for 处理接收字符乱码bug end
	  	   //处理内容
	  	   //sBuffer.append(new String(responseBody,encoding));
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
	public static String HttpPostForRest(String url, String method, Map parmMap) {
		String encoding="UTF-8";
		String webUrl=url+"/"+method+".rest";
		if(encoding==null || "".equals(encoding)) encoding = "UTF-8";
				StringBuffer sBuffer = new StringBuffer();
				//构造HttpClient的实例
			  	HttpClient httpClient = new HttpClient();
	  	  		//创建POS方法的实例			  
			  	NameValuePair[] pairs = null;
			  	PostMethod postMethod = new PostMethod(webUrl);
			  	if(parmMap!=null){
			  		pairs = new NameValuePair[parmMap.size()];
					Set set= parmMap.keySet();
					Iterator it=set.iterator();
					int i=0;
					while(it.hasNext()){
						Object key=it.next();
						Object value=parmMap.get(key);
						pairs[i] = new NameValuePair(key.toString(), value.toString());
						i++;
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
	  	InputStream resStream = postMethod.getResponseBodyAsStream();
	  	sBuffer = new StringBuffer(postMethod.getResponseBodyAsString() + "");
	  	//modify by guanshiqiang at 2012-06-01 for 处理接收字符乱码bug end
	  	   //处理内容
	  	   //sBuffer.append(new String(responseBody,encoding));
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
	//http post方式调用接口
//    public static String toSendMessageByPost(String method,String messageSource,String messageType,String pdSid,String pdSids,String storeNum,String sourceNum,String ip) {
//        InputStream is = null;
//        BufferedReader in = null;
//        HttpURLConnection conn = null;
//        String url=AppUtil.getPropertity("amq_url")+method+".html";
//        System.out.println("访问 = " + url);
//        System.out.println("访问 = " + pdSids);
//        try {
//            URL serverUrl = new URL(url);
//            conn = (HttpURLConnection) serverUrl.openConnection();
//            conn.setRequestMethod("POST");
//            conn.setDoOutput(true);
//            conn.setDoInput(true);
//            conn.setUseCaches(false);
//            OutputStream os = conn.getOutputStream();
//            String date="messageSource="+messageSource+"&uuid="+getUUID()+"&messageType="+messageType+"&pdSid="+pdSid+"&pdSids="+pdSids+"&storeNum="+storeNum+"&sourceNum="+sourceNum+"&ip="+ip;
//
//            os.write(date.getBytes());
//            conn.connect();
//            is = conn.getInputStream();
//            //转码成UTF-8
//            in = new BufferedReader(new InputStreamReader(is, "UTF-8"));
//            StringBuffer buffer = new StringBuffer();
//            String line = "";
//            while ((line = in.readLine()) != null) {
//                buffer.append(line);
//            }
//            String result = buffer.toString();
//            conn.disconnect();
//            return result;
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("请求出错啦");
//            return "";
//        } finally {
//            is = null;
//            in = null;
//            if (conn != null) {
//                conn.disconnect();
//            }
//            conn = null;
//        }
//    }


}

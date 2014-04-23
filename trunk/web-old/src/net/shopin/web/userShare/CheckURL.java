
package net.shopin.web.userShare;
import java.net.*;
import java.io.*;


public class CheckURL {
	   /**
     * 对字符串进行MD5加密
	 * @param myUrl
     *
     * @param url
     *
     * @return 获取url内容
     */
  public static String check(String urlvalue ) {


	  String inputLine="";

		try{
				URL url = new URL(urlvalue);

				HttpURLConnection urlConnection  = (HttpURLConnection)url.openConnection();

				BufferedReader in  = new BufferedReader(
			            new InputStreamReader(
			            		urlConnection.getInputStream()));

				inputLine = in.readLine().toString();
			}catch(Exception e){
				e.printStackTrace();
			}
			//System.out.println(inputLine);  系统打印出抓取得验证结果

	    return inputLine;
  }


  }
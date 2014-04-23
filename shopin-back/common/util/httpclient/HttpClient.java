/**
 * 说 明     : 
 * author: 陆湘星
 * data  : 2011-11-21
 * email : xiangxingchina@163.com
 **/
package util.httpclient;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import util.DateUtil;


public class HttpClient {
	private String url;
	private String encoding = "UTF-8";
	Map<String,Parameter> parametersMap = new HashMap<String,Parameter>();
	private Date start;
	
	public HttpClient(String url) {
		start = new Date();
		this.url = url;
	}
	public HttpClient(String url,String encoding) {
		start = new Date();
		this.url = url;
		this.encoding = encoding;
	}
	
	public void setParam(String key,String value){
		if(key!=null && !"".equals(key))
			parametersMap.put(key,new Parameter(key, value));
	}
	
	public void setParams(String params){
		if(params!=null && !"".equals(params)){
			String [] paramsArray = params.split("&");
			if(paramsArray!=null && paramsArray.length>1){
				for (int i = 0; i < paramsArray.length; i++) {
						String [] paramsVal = paramsArray[i].split("=");
						if(paramsVal!=null && paramsVal.length>1 && paramsVal[0]!=null && paramsVal[1]!=null && !"null".equals(paramsVal[1]) && paramsVal.length>0)
						parametersMap.put(paramsVal[0].trim(),new Parameter(paramsVal[0].trim(), paramsVal[1].trim()));
				}
			}else{
					String [] paramsVal = params.split("=");
					if(paramsVal!=null && paramsVal.length>1 && paramsVal[0]!=null && paramsVal[1]!=null && !"null".equals(paramsVal[1]) && paramsVal.length>0)
					parametersMap.put(paramsVal[0].trim(),new Parameter(paramsVal[0].trim(), paramsVal[1].trim()));
			}
		}
	}
	
	public String getGetResult(){
		String webUrl = url;
		Collection<Parameter> c = parametersMap.values();
        Iterator<Parameter> it = c.iterator();
        for (; it.hasNext();) {
            if(webUrl.indexOf("?")==-1)webUrl+="?"; 
			else webUrl+="&"; 
			Parameter parameter = it.next();
			webUrl +=parameter.getKey()+"="+parameter.getValue();
        }
		String result = HttpClientUtil.GetUrlContent(url, encoding);
		DateUtil.PrintTimeGap(webUrl, start, new Date());
		return result;
	}
	public String getPostResult(){
		String webUrl = url;
		List<Parameter> parameters =new ArrayList<Parameter>();
		
		Collection<Parameter> c = parametersMap.values();
        Iterator<Parameter> it = c.iterator();
        for (; it.hasNext();) {
        	Parameter parameter = it.next();
        	parameters.add(parameter);
        }
        
		String result = HttpClientUtil.PostUrlContent(url,parameters, encoding);
		String log = DateUtil.PrintTimeGap(webUrl, start, new Date());
		System.out.println(log);
		return result;
	}
	
}

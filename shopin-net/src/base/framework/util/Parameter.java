/**
 * @author luxiangxing
 * @time   2009-8-1
 * @email  xiangxingchina@163.com
 * @tel    13488766519
 */
 
package base.framework.util;

import java.util.HashMap;

public class Parameter {
	private static HashMap paras ;
	private static String  default_properties= "system.properties";
	
	public Parameter(String propfilepath) {
		ParameterUtil pUtil = new ParameterUtil();
		pUtil.setPropertiesFile(propfilepath);
	}
	
	public synchronized static String getValue(String key){
		if(paras==null) return "";
		return (String)paras.get(key)==null?"":(String)paras.get(key);
	}
	
	public static void InitSystemParameter(){
		InitSystemParameter(default_properties);
	}
	
	public static void InitSystemParameter(String propertiesFile){
		if(paras==null){ //只系统启动时，加载一次
			if(propertiesFile==null||"".equals(propertiesFile)){
				propertiesFile = default_properties;
			}
			 ParameterUtil pUtil = new ParameterUtil();
			 pUtil.setPropertiesFile(propertiesFile);
			 paras = pUtil.getAll();
		}
	}
	

	
}

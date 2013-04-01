/**
 * 说 明     : 
 * author: 陆湘星
 * data  : 2011-8-23
 * email : xiangxingchina@163.com
 **/
package base.framework.constants;

import base.framework.util.Parameter;


public class PropertiesLoad {
	//属性文件相关配置
	public final static String SYSTEM_PROPERTIES_DEPLOYTYPE_NAME = "deploy";
	//#版本号
	public final static String SYSTEM_PROPERTIES_VERSION_NAME = "version";
	//#部署类型   1:开发 （默认）  2:测试   3:部署web 4.部署为web任务机 -- 用于 日志显示
	public final static String SYSTEM_PROPERTIES_DEBUG_LEVEL = "debug";
	
	
	
	public static String getPropertiesDeploytypeName(){
		String deploytypeName = "3"; //默认为3
		Parameter.InitSystemParameter(SystemConfig.SYSTEM_PROPERTIES_FILE_NAME);
		String tempStr = Parameter.getValue(SYSTEM_PROPERTIES_DEPLOYTYPE_NAME);
		if(tempStr!=null && !"".equals(tempStr) ) deploytypeName = tempStr;
		return deploytypeName;
	}

	public static String getPropertiesVersionName(){
		String version = "1.0"; //默认为3
		Parameter.InitSystemParameter(SystemConfig.SYSTEM_PROPERTIES_FILE_NAME);
		String tempStr = Parameter.getValue(SYSTEM_PROPERTIES_VERSION_NAME);
		if(tempStr!=null && !"".equals(tempStr) ) version = tempStr;
		return version;
	}
	
	public static String getPropertiesDebugLevel(){
		String debugLevel = "2"; //默认为3
		Parameter.InitSystemParameter(SystemConfig.SYSTEM_PROPERTIES_FILE_NAME);
		String tempStr = Parameter.getValue(SYSTEM_PROPERTIES_DEBUG_LEVEL);
		if(tempStr!=null && !"".equals(tempStr) ) debugLevel = tempStr;
		return debugLevel;
	}

		
}

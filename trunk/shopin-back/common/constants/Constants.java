package constants;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;

import util.StringUtils;
/**
 * 说 明  : 定义相关常量公共类.
 * author: 陆湘星
 * data  : 2012-1-9
 * email : xiangxingchina@163.com
 **/

public class Constants {
	public static String MIDDLE_WARE_URL = "";
	public static String SETTING_DEPLOY = "2";
	public static String SETTING_DEBUG = "2";
	
	static{
		// 加载配置文件
		InputStream is = Constants.class.getClassLoader().getResourceAsStream("setting.properties");
		Properties p = new Properties();
		try {
			p.load(is);
			Constants.MIDDLE_WARE_URL = p.getProperty("setting.middleWareUrl");
			Constants.SETTING_DEPLOY = p.getProperty("setting.deploy");
			Constants.SETTING_DEBUG = p.getProperty("setting.debug");
		} catch (IOException e) {
			// 输出日志
			Logger logger = Logger.getLogger(Constants.class);
			logger.error(e.getLocalizedMessage(), e);
		}
	}
}

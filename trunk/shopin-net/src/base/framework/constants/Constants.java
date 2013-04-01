package base.framework.constants;

import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * 定义相关常量公共类.
 * <p>
 * 创建日期：2010-07-01<br>
 * 创建人：Xiyt<br>
 * 修改日期：<br>
 * 修改人：<br>
 * 修改内容：<br>
 * 
 * @author Xiyt
 * @version 1.0
 */
public class Constants {
	public static String PUBLIC_PRIVATE_KEY_PATH = "";
	public static String MAIN_WEB_URL = "http://www.shopin.net/";
	public static String MAIN_DEFAULT_URL="";
	/* QQ begin*/
	public static String QQ_API_KEY = "";
	public static String QQ_API_SECRET = "";
	public static String QQ_REDIRECT_URL = "";
	/* QQ end */
	/* Sina begin */
	public static String SINA_API_KEY = "";
	public static String SINA_API_SECRET = "";
	public static String SINA_REDIRECT_URL = "";
	/* Sina end */
	/* Ali begin */
	public static String ALIPAY_REDIRECT_URL = "";
	public static String ALIPAY_ADDRESS_URL = "";
	/* Ali end */
	/* bankconf begin */
	public static String BANK_PARTNER = "";
	public static String BANK_KEY = "";
	/* bankconf end */
	/* 139mail begin */
	public static String CM_139_CLICKSYSID = "";
	public static String CM_139_RTYPE = "";
	public static String CM_139_KEY = "";
	public static String CM_139_OPENIDTRANSFERURL = "";
	/* 139mail end */
	
	/* 360 begin */
	public static String CLIENT_ID = "";
	public static String CLIENT_SECRET = "";
	public static String CPS360_RETURN_URL = "";
	/* 360 end */
	
	/* sso begin */
	public static String SSO_CONTEXT_PATH = "";
	/* sso end */
	
	/** 每页显示最大件数 */
	public static final int PAGE_SIZE = 20;
	
	static {
		InputStream in = Constants.class.getClassLoader().getResourceAsStream("system.properties");
		Properties p = new Properties();
		try {
			p.load(in);
			Constants.PUBLIC_PRIVATE_KEY_PATH = p.getProperty("PUBLIC_PRIVATE_KEY_PATH");
			Constants.MAIN_WEB_URL = p.getProperty("MAIN_WEB_URL");
			Constants.MAIN_DEFAULT_URL= p.getProperty("MAIN_DEFAULT_URL");
			// QQ begin
			Constants.QQ_API_KEY = p.getProperty("QQ_API_KEY");
			Constants.QQ_API_SECRET = p.getProperty("QQ_API_SECRET");
			Constants.QQ_REDIRECT_URL = p.getProperty("QQ_REDIRECT_URL");
			// QQ end
			// Sina begin
			Constants.SINA_API_KEY = p.getProperty("SINA_API_KEY");
			Constants.SINA_API_SECRET = p.getProperty("SINA_API_SECRET");
			Constants.SINA_REDIRECT_URL = p.getProperty("SINA_REDIRECT_URL");
			// Sina end
			// Ali begin
			Constants.ALIPAY_ADDRESS_URL = p.getProperty("ALIPAY_ADDRESS_URL");
			Constants.ALIPAY_REDIRECT_URL = p.getProperty("ALIPAY_REDIRECT_URL");
			// Ali end
			// bankconf begin
			Constants.BANK_PARTNER = p.getProperty("BANK_PARTNER");
			Constants.BANK_KEY = p.getProperty("BANK_KEY");
			// bankconf end
			// 139mail begin
			Constants.CM_139_CLICKSYSID = p.getProperty("CM_139_CLICKSYSID");
			Constants.CM_139_KEY = p.getProperty("CM_139_KEY");
			Constants.CM_139_OPENIDTRANSFERURL = p.getProperty("CM_139_OPENIDTRANSFERURL");
			Constants.CM_139_RTYPE = p.getProperty("CM_139_RTYPE");
			// 139mail end
			
			// 360 begin 
			Constants.CLIENT_ID = p.getProperty("CLIENT_ID");
			Constants.CLIENT_SECRET = p.getProperty("CLIENT_SECRET");
			Constants.CPS360_RETURN_URL = p.getProperty("CPS360_RETURN_URL");
			//360 end
			
			//sso begin
			Constants.SSO_CONTEXT_PATH = p.getProperty("SSO_CONTEXT_PATH");
			//sso end
			
		} catch (Exception e) {
			Logger logger = Logger.getLogger(Constants.class);
			logger.error(e.getLocalizedMessage(), e);
		}
	}
}

/**
 * 说明:
 *     内部系统地址管理
 * @Probject Name: web
 * @Path: net.shopin.web.util.SystemConstants.java
 * @Create By kongm
 * @Create In 2013-8-12 上午10:28:12
 * TODO
 */
package net.shopin.web.util;

/**
 * @Class Name SystemConstants
 * @Author kongm
 * @Create In 2013-8-12
 */
public class SystemConstants {
	
	public static final String SSD_system = LoadProperties.readValue("SSD_system");
	public static final String FORM_SYSTEM = LoadProperties.readValue("FORM_SYSTEM");
	public static final String FLASH_SALE_URL = LoadProperties.readValue("FLASH_SALE_URL");
	
	public static final String PAGE_ROUTE_404 = LoadProperties.readValue("404_ROUTE_URL");

	public final static String REMOTE_SEARCH_URL = LoadProperties.readValue("REMOTE_SEARCH_URL");

	public final static String SSO_GETMEMBER_BYTICKET_URL = LoadProperties
			.readValue("SSO_GETMEMBER_BYTICKET_URL");
	public final static String SSO_LOGIN_URL = LoadProperties
			.readValue("SSO_LOGIN_URL");
	public final static String SSO_LOGIN_RETURN_URL = LoadProperties
			.readValue("SSO_LOGIN_RETURN_URL");
	/**
	 * 获取订单详细信息的地址
	 */
	public final static  String ORDER_DETAIL_URL = LoadProperties.readValue("ORDER_DETAIL_URL");
	/**
	 * 从订单系统获取销售记录的数量
	 */
	public final static  String FETCH_SIZE = LoadProperties.readValue("FETCH_SIZE");

	public final static String DOMAIN_NAME = LoadProperties
			.readValue("DOMAIN_NAME");
	public final static String SSO_REGISTER_RETURN_URL = LoadProperties
			.readValue("SSO_REGISTER_RETURN_URL");
	public final static String SSO_REGISTER_URL = LoadProperties
			.readValue("SSO_REGISTER_URL");
	public final static String SSO_LOGINOUT_URL = LoadProperties
			.readValue("SSO_LOGINOUT_URL");
	public final static String SSO_LOGINOUT_RETURN_URL = LoadProperties
			.readValue("SSO_LOGINOUT_RETURN_URL");
	public final static String SSO_URL = LoadProperties
			.readValue("SSO_URL");
	public final static String KEY_NAME = LoadProperties.readValue("KEY_NAME");

	public final static String SSO_ENCODING = LoadProperties.readValue("SSO_ENCODING");
	public final static String SSO_CHARSET = LoadProperties.readValue("SSO_CHARSET");
	public final static String SSO_MYSHOPIN_URL = LoadProperties.readValue("SSO_MYSHOPIN_URL");
	public static final String COMMON_CART = "0";
	public static final String VIP_CART  = "1";
	
	public final static String DOMAIN = LoadProperties.readValue("DOMAIN");
	public final static String QQ_FANLI_CONNECT_KEY1 = LoadProperties
			.readValue("QQ_FANLI_CONNECT_KEY1");
	public final static String QQ_FANLI_CONNECT_KEY2 = LoadProperties
			.readValue("QQ_FANLI_CONNECT_KEY2");
	public final static String QQ_API_SECRET = LoadProperties
			.readValue("QQ_API_SECRET");
	public final static String QQ_GETADDRESS = LoadProperties
			.readValue("QQ_GETADDRESS");

}

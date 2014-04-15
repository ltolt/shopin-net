/**
 * @Probject Name: backendWeb_ssd
 * @Path: net.shopin.util.Constants.java
 * @Create By wangdg
 * @Create In 2013-6-14 下午2:31:49
 * TODO
 */
package net.shopin.util;

import com.shopin.modules.utils.LoadServerProperties;

/**
 * @Class Name Constants
 * @Author wangdg
 * @Create In 2013-6-14
 */
public class Constants {
	
	 public static String SSD_SYSTEM = LoadProperties.readValue("SSD_system");
	 public static String ssd_system = LoadProperties.readValue("ssd_system");
	 
	 
	 public static final String COMMON_CART = LoadProperties.readValue("COMMON_CART");
	 public static final String VIP_CART  = LoadProperties.readValue("VIP_CART");
	 public static final String VIP_CART_INVALID = LoadProperties.readValue("VIP_CART_INVALID_TIME");
	 public static final String ACTIVE_FLAG = LoadProperties.readValue("ACTIVE_FLAG");
}

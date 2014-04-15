/**
 * @Probject Name: business
 * @Path: net.shopin.util.StringUtils.java
 * @Create By wangdg
 * @Create In 2013-7-12 上午10:29:52
 * TODO
 */
package net.shopin.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * @Class Name StringUtils
 * @Author wangdg
 * @Create In 2013-7-12
 */
public class StringUtils {
	
	/**
	 * 将字符串数组拼接成字符串
	 * @Methods Name listToString
	 * @Create In 2013-7-12 By jingpeng
	 * @param list
	 * @return String
	 */
	public static String listToString(List<String> list){
		if(list == null || list.size() < 0 || list.isEmpty()) {
			throw new IllegalArgumentException(new StringBuilder().append("list=").append(list).toString());
		}
		StringBuffer str = new StringBuffer();
		for(int i = 0 ; i <list.size(); i++){
			str.append(String.valueOf(list.get(i)) + ",");
		}
		
		return (str.toString()).substring(0, (str.toString()).length()-1);
	}
	
}

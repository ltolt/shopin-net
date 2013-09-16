package util;



/**
 * 字符串处理工具类.
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
public class StringUtils extends org.apache.commons.lang.StringUtils{
	
	/**
	 * 判断一个字符串是否为空
	 * 不包括："", "null"
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str){
		if(null!=str && str.length()>0 && !"null".equals(str)){
			return true;
		}else{
			return false;
		}
	}
	
	
	/**
	 * 判断一个字符串的编码格式
	 * @param str
	 * @return
	 * @throws Exception 
	 */
	public static String getEncoding(String str){
		if(StringUtils.isEmpty(str)) return str;
		String[] encodeArr = new String[]{"ISO-8859-1", "GB2312", "GBK", "UTF-8", "UTF-16"};
		try {
			for (String encode : encodeArr) {
				if(str.equals(new String(str.getBytes(encode), encode))){
					return encode;
				}
			}
		} catch (Exception e) {
			return null;
		}
		return null;
	}
}

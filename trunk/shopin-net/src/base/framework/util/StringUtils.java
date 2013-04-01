package base.framework.util;

import java.util.StringTokenizer;


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
	
	 /**
     * 此方法将给出的字符串source使用delim划分为单词数组。
     * @param source 需要进行划分的原字符串
     * @param delim 单词的分隔字符串
     * @return 划分以后的数组，如果source为null的时候返回以source为唯一元素的数组，
     *         如果delim为null则使用逗号作为分隔字符串。
     * @since  0.1
     */
    public static String[] split(String source, String delim) {
      String[] wordLists;
      if (source == null) {
        wordLists = new String[1];
        wordLists[0] = source;
        return wordLists;
      }
      if (delim == null) {
        delim = ",";
      }
      StringTokenizer st = new StringTokenizer(source, delim);
      int total = st.countTokens();
      wordLists = new String[total];
      for (int i = 0; i < total; i++) {
        wordLists[i] = st.nextToken();
      }
      return wordLists;
    } 
    
    
    public static String SubString(String source,int limit){
    	String result = source;
    	if(result==null ||"".equals(result)) result = "";
    	else  if(source.length()>limit ) result = result.substring(0, limit);
    	return result;
    }
    
	public String doLowerCase(String str){
		String strT = str.toLowerCase();
		while(strT.indexOf("_")!=-1){
			strT = strT.substring(0,strT.indexOf("_"))+strT.substring(strT.indexOf("_")+1,strT.indexOf("_")+2).toUpperCase()+strT.substring(strT.indexOf("_")+2);
		}
		return strT;
	}
}

/**
 * 说明: 
 *     测试json第三方jar包转化效率 
 *     json-lib包
 * @Probject Name: framework
 * @Path: base.framework.utils.json.JsonUtilTest.java
 * @Create By kongm
 * @Create In 2013-7-15 下午2:59:29
 * TODO
 */
package base.framework.utils.json;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import base.framework.beans.Demo;
import base.framework.json.JsonUtil;

/**
 * @Class Name JsonUtilTest
 * @Author kongm
 * @Create In 2013-7-15
 */
public class JsonUtilTest {
	public static void main(String[] args) {
		List<Demo> resultList = new ArrayList<Demo>();
		StringBuffer buffer = new StringBuffer();
		buffer.append("[");
		for(int i = 0;i < 1000;i++){
			buffer.append("{'id':"+ i + ",'name':'test"+ i +"'},");
		}
		buffer.deleteCharAt(buffer.length()-1);
		System.out.println("buffer :" + buffer.toString());
		buffer.append("]");
		long start = System.currentTimeMillis();
		JSONArray jsonArray = JSONArray.fromObject(buffer.toString());
		
		resultList = JSONArray.toList(jsonArray,new Demo(),new JsonConfig());
		long end = System.currentTimeMillis();
		System.out.println(resultList);
		System.out.println("cost time :" + (end - start) + " ms");
		
		
	}
}

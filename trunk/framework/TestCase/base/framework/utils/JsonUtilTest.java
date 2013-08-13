/**
 * @Probject Name: framework
 * @Path: base.framework.utils.JsonUtilTest.java
 * @Create By kongm
 * @Create In 2013-7-23 ÏÂÎç6:11:31
 * TODO
 */
package base.framework.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.junit.Test;

import base.framework.beans.Demo;
import base.framework.json.JsonUtil;

/**
 * @Class Name JsonUtilTest
 * @Author kongm
 * @Create In 2013-7-23
 */
public class JsonUtilTest {

	private static String json;
	
	//@Test
	public void test(){
		Demo  demo = new Demo();
		demo.setId("1");
		demo.setName("");
		demo.setTime(new Date());
		json = JsonUtil.Object2Json(demo);
		System.out.println(json);
		json = JsonUtil.Object2JsonFilter(demo);
		System.out.println(json);
	     
	}
	@Test
	public void testList(){
		List list = new ArrayList();
		for(int i=0;i<10;i++){
			Demo demo = new Demo();
			demo.setId(i+"");
			demo.setName("demo" + i);
			demo.setTime(new Date());
			list.add(demo);
		}
		json =  JsonUtil.Object2Json(list);
		System.out.println(json);
		json = JsonUtil.Object2JsonFilter(list);
		System.out.println(json);
	}
	
	@Test
	public void testJson2Obj(){
//		StringBuilder j = new StringBuilder();
//		j.append("{'id':'1','name':'demo'}");
//		Demo demo = new Demo();
//		JsonUtil.Json2Object(j.toString(),demo);
//		System.out.println(demo);
		StringBuffer buffer = new StringBuffer();
		buffer.append("[");
		for(int i=0;i<10;i++){
			buffer.append("{'id':" + i + ",'name':'demo" + i + "','flag':'"+ i +"','time':'20130723'},");
		}
		buffer.deleteCharAt(buffer.length() - 1);
		buffer.append("]");
		System.out.println("buffer:" + buffer.toString() );
		List<Demo> list = new ArrayList<Demo>();
		Collection col = Collections.emptyList();
		Demo[] array = {};
		long start = System.currentTimeMillis();
		list = JSONArray.toList(JSONArray.fromObject(buffer.toString()), new Demo(), new JsonConfig());
		System.out.println("list = " + list);
		long end = System.currentTimeMillis();
		System.out.println("cost time " + (end - start) + " ms");
		
		
		
	}
	
	
	
	public static void main(String[] args) {
		List list = new ArrayList();
		System.out.println(list.getClass().isArray());
		String[] array = {};
		System.out.println(array.getClass().isArray());
		Demo[] arr =  {};
	    System.out.println(arr.getClass().isArray());
		
		
	}
	
	
	
	
	

}

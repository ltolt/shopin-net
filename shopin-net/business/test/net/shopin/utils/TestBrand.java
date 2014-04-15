/**
 * @Probject Name: business
 * @Path: net.shopin.utils.TestBrand.java
 * @Create By kongm
 * @Create In 2013-8-2 下午2:40:41
 * TODO
 */
package net.shopin.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.google.gson.Gson;

import net.sf.json.JSONObject;
import net.shopin.entity.BrandDisplay;
import net.shopin.util.HttpUtil;
import net.shopin.view.SsdBrandDisplay;

/**
 * @Class Name TestBrand
 * @Author kongm
 * @Create In 2013-8-2
 */
public class TestBrand {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-2 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		String json = HttpUtil.HttpPost("http://172.16.100.90:8080/ssdservice/", "web/displayList.html", new HashMap());
		System.out.println(json);
//		JSONObject obj = JSONObject.fromObject(json);
		Gson gson = new Gson();
		Map mmmm=gson.fromJson(json, HashMap.class);
		
		
	}

}

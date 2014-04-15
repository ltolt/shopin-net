/**
 * @Probject Name: business
 * @Path: net.shopin.utils.TestJson.java
 * @Create By kongm
 * @Create In 2013-7-23 上午10:52:39
 * TODO
 */
package net.shopin.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.util.Constants;
import net.shopin.util.HttpUtil;
import net.shopin.view.NavigationVO;

/**
 * @Class Name TestJson
 * @Author kongm
 * @Create In 2013-7-23
 */
public class TestJson {

	/**
	 * @Methods Name main
	 * @Create In 2013-7-23 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		//[{'sid':'1','classSid':'1046'}, {'sid':'2','classSid':'1047'}]
//		String json = "[{'sid':'1','name':'女装',link:'www.shopin.net/keysearch.html',subList:[{'name':'连衣裙',link:'www.shopin.net/keysearch.html',subList:[{'name':'bra',link:'www.shopin.net/keysearch.html'},{'name':'b',link:'www.shopin.net/keysearch.html'}]},{'name':'bra',link:'www.shopin.net/keysearch.html'}]},{'sid':'2','name':'男装',subList:[{'name':'连衣裙',subList:[{'name':'bra'},{'name':'b'}]},{'name':'bra'}]}]";
//		Map map = new HashMap();
//		map.put("subList", NavigationVO.class);
//		JSONArray array = JSONArray.fromObject(json);
//		List list = JSONArray.toList(array, NavigationVO.class,map );
//		System.out.println(list);
		
		
		Map map = new HashMap();
		map.put("param", "827");
		String resultJson = HttpUtil.HttpPost("http://192.168.200.145/ssdservice/",
				"bw/getByBrandSids.html", map);
		System.out.println(resultJson);
//		JSONObject jsonObj = JSONObject.fromObject(json);
////		List sub = JSONArray.toList(jsonObj.getJSONArray("subList"),NavigationVO.class);
//		Map map = new HashMap();
//		map.put("subList", NavigationVO.class);
////		NavigationVO vo = (NavigationVO) JSONObject.toBean(jsonObj, NavigationVO.class, map);
////		NavigationVO vo = (NavigationVO) JSONObject.toBean(jsonObj, NavigationVO.class);
////		vo.setSubList(sub);
//		//System.out.println(vo);
//		System.out.println(vo.getSubList());

		
	}

}

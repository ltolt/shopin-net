/**
 * 说明:
 *     网站三版 搜索相关控制器
 * @Probject Name: web
 * @Path: net.shopin.web.controller.SearchController.java
 * @Create By kongm
 * @Create In 2013-8-12 上午10:51:09
 * TODO
 */
package net.shopin.web.controller;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;
import net.shopin.view.AjaxMessageVO;
import net.shopin.web.util.HttpClientUtilSearch;
import net.shopin.web.util.SystemConstants;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Class Name SearchController
 * @Author kongm
 * @Create In 2013-8-12
 */
@Controller
@Scope("prototype")
public class SearchController {
	

	@ResponseBody
	@RequestMapping(value = "/hotkey", method = RequestMethod.POST)
	public String hotkey(Model m, String key) {
		if(key == null || "".equals(key)) {
			m.addAttribute("result", new AjaxMessageVO("1", ""));
			return null;
		}
		String result = "";
		try {
			m.addAttribute("query", key);
			Map parmMap = new HashMap();
			parmMap.put("key", key);
			result = HttpClientUtilSearch.HttpPost(SystemConstants.REMOTE_SEARCH_URL, "/hotkey", parmMap, ".html");
			JSONObject json = JSONObject.fromObject(result);
			System.out.println(json.toString());
			String message = json.getJSONObject("result").getString("message");
			if("".equals(message)) {
				m.addAttribute("result", new AjaxMessageVO("1", ""));
				return null;
			}
			JSONObject JSONMessage = JSONObject.fromObject(message);
			String success = JSONMessage.getString("success");
			if ("true".equals(success)) {
				m.addAttribute("result", new AjaxMessageVO("1", JSONMessage.toString()));
				return null;
			}
			m.addAttribute("result", new AjaxMessageVO("1", ""));
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("result", new AjaxMessageVO("0", "系统异常请稍后重试"));
			return null;
		}
		return null;
	}

}

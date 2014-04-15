/**
 * @Probject Name: web
 * @Path: net.shopin.web.controller.HelpController.java
 * @Create By kongm
 * @Create In 2013-10-24 下午2:49:46
 * TODO
 */
package net.shopin.web.controller;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.web.util.HttpUtil;
import net.shopin.web.util.LoadProperties;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Class Name HelpController
 * @Author kongm
 * @Create In 2013-10-24
 */
@Controller
@Scope("prototype")
public class HelpController {

	private final Logger log = Logger.getLogger(this.getClass());
	private final static String REMOTE_ORDEROMS_URL = LoadProperties.readValue("REMOTE_ORDEROMS_URL");
	/**
	 * 说明:  
	 *     ali跳转 转发所有参数
	 * @Methods Name gotoAlipay
	 * @Create In 2013-11-27 By kongm
	 * @param m
	 * @param request
	 * @return String
	 */
	@RequestMapping(value = "/gotoalipay", method = RequestMethod.GET)
	public String gotoAlipay(Model m,HttpServletRequest request){
		m.addAttribute("url",request.getQueryString());
		return "pay/gotoalipay";
	}
	
	
	
	/**
	 * 说明: 
	 *     help目录下帮助页面跳转
	 * @Methods Name getHelp
	 * @Create In 2013-10-24 By kongm
	 * @param page
	 * @param m
	 * @return String
	 */
	@RequestMapping(value = "/help/{page}", method = RequestMethod.GET)
    public String getHelp(@PathVariable("page") String page,Model m) {
        return "help/"+page;
    }
	/**
	 * 说明: 
	 *     help目录页面跳转 只针对双十二活动
	 * @Methods Name getHelp
	 * @Create In 2013-12-14 By shenlingfei
	 * @param page
	 * @param m
	 * @return String
	 */
	@RequestMapping(value={"/help/2013shuang12cj"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
    public String getShuangShiErActive(HttpServletRequest req,Model m) {
		try{
			long start = System.currentTimeMillis();
			String res = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "order/selectOrderInfoToDouble","");
			long end = System.currentTimeMillis();
			log.info("oms 系统处理网站请求时间：" + (end - start)/1000 + " s  返回结果：" + res);
			JSONObject orderJson = JSONObject.fromObject(res);
			if(orderJson.getBoolean("success")){
				JSONArray orderlist = orderJson.getJSONArray("list");
				m.addAttribute("orderlist", orderlist);
				this.log.info("从helpControler中调用oms_sdc查询订单返回结果：" + orderlist);
			}
		}catch(Exception e){
			this.log.error("调用oms_sdc查询订单返回结果失败");
		}
        return "help/2013shuang12cj";
    }
}

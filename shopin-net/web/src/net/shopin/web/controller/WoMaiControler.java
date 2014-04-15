/**
 * @Probject Name: web
 * @Path: net.shopin.web.controller.WoMaiControler.java
 * @Create By jingpeng
 * @Create In 2014-1-12 上午11:01:50
 * TODO
 */
package net.shopin.web.controller;

import net.shopin.api.IWoMaiService;
import net.shopin.view.WoMaiVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Class Name WoMaiControler
 * @Author jingpeng
 * @Create In 2014-1-12
 */
@Controller
@Scope("prototype")
public class WoMaiControler {
	
	protected final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IWoMaiService womaiService;
	
	@RequestMapping(value = { "/activity/womai" }, method = {
			RequestMethod.GET,RequestMethod.POST })
	public String showWoMai(Model m) {
		try {
			WoMaiVO woMaiVO = this.womaiService.getWoMaiByFlag();
			if(woMaiVO != null && woMaiVO.getSid() != null) {
				m.addAttribute("cardNo", woMaiVO.getCardNo());
				m.addAttribute("cardPassword", woMaiVO.getCardPassword());
			} else {
				log.error("没有flag=0的记录！");
				return "";
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("查询用户名密码错误！", e);
		}
		return "activity/womai";
	}
}

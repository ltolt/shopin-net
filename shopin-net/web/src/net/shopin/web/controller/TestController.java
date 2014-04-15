/**
 * @Probject Name: web
 * @Path: net.shopin.web.controller.TestController.java
 * @Create By kongm
 * @Create In 2013-10-23 下午6:07:24
 * TODO
 */
package net.shopin.web.controller;

import junit.framework.Assert;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Class Name TestController
 * @Author kongm
 * @Create In 2013-10-23
 */
@Controller
@Scope("prototype")
public class TestController {
	
	
	@RequestMapping(value = { "/systemtest" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET,
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public String SystemTest(@CookieValue(value = "ticket", required = false) String ticket){
		return "redirect:http://sso.shopin.net/";
	}

}

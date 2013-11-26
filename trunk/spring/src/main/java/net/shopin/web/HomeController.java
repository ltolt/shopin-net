/**
 * @Probject Name: spring
 * @Path: net.shopin.web.HomeController.java
 * @Create By kongm
 * @Create In 2013-11-26 下午2:49:14
 * TODO
 */
package net.shopin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Class Name HomeController
 * @Author kongm
 * @Create In 2013-11-26
 */
@Controller
public class HomeController {
	
	@RequestMapping("/")
	public @ResponseBody String index(){
		return "Welcome to the home page!";

	}
}

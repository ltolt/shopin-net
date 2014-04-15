/**
 * @Probject Name: web
 * @Path: net.shopin.web.controller.ErrorController.java
 * @Create By kongm
 * @Create In 2013-10-28 上午11:06:04
 * TODO
 */
package net.shopin.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Class Name ErrorController
 * @Author kongm
 * @Create In 2013-10-28
 */
@Controller
@Scope("prototype")
public class ErrorController {
	
	
	@RequestMapping(value = { "/errorpage" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET,
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public String errorPage(Model m,HttpServletRequest request){
		
		return "";
	}
	

}

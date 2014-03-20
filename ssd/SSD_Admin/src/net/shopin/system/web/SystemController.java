package net.shopin.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SystemController {

	@RequestMapping(value = "/system/menu", method = RequestMethod.GET)
	public String initSystem(Model m, HttpServletRequest request,
			HttpServletResponse response) {

		return "/system/manager/systemmanage";
	}
	
	@RequestMapping(value = "/system/head", method = RequestMethod.GET)
	public String initHead(Model m, HttpServletRequest request,
			HttpServletResponse response) {

		return "/system/manager/systemhead";
	}
	
}

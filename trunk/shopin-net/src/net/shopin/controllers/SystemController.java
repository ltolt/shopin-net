package net.shopin.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.service.IProductClassService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author K
 *
 */
@Controller
public class SystemController {

	
	@Autowired
	private IProductClassService productClassService;
	
	@RequestMapping(value = {"/system/index"},method = {RequestMethod.GET,RequestMethod.POST})
	public String index(Model m,HttpServletRequest request,HttpServletResponse response){
		
		return "system/system";
	}
	
	@RequestMapping(value = {"/system/systemhead"},method = {RequestMethod.GET,RequestMethod.POST}) 
	public String systemhead(Model m){
		return "system/systemhead";
	}
	
	
	@RequestMapping(value = {"/system/pagemanage"},method = {RequestMethod.GET,RequestMethod.POST})
	public String welcome(Model m ,HttpServletRequest request,HttpServletResponse response){
		
		return "/manage/catemanage";
	}
	
	
	
}

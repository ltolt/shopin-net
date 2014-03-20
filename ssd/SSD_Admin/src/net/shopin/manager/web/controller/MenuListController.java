package net.shopin.manager.web.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MenuListController {
	
	
  @RequestMapping(value="/menu",method=RequestMethod.GET)
  public String findMenuPage(Model m,HttpServletRequest request,HttpServletResponse response){
	  
		SecurityContext   ctx   =   SecurityContextHolder.getContext();         
        Authentication   auth   =   ctx.getAuthentication();     
        String roleName="";
		for (GrantedAuthority ga : auth.getAuthorities()) {
			roleName=ga.getAuthority();
		}
		
		request.getSession().setAttribute("client", "");
		
		return "/system/manager/systemmanage"; 
  }
  @RequestMapping(value="/system/systemhead",method=RequestMethod.GET)
  public String findMenuhead(Model m,HttpServletRequest request,HttpServletResponse response){
	  
	 return "/systemmanage/manager/systemhead"; 
  }

  
  @RequestMapping(value="/system/quit",method=RequestMethod.GET)
  public void quit(Model m,HttpServletRequest request,HttpServletResponse response)throws Exception{
	  SecurityContext   ctx   =   SecurityContextHolder.getContext();         
	  ctx.setAuthentication(null);
	  request.getSession().setAttribute("client", null);
	  response.sendRedirect("../login.jsp");
  }
  
  @RequestMapping(value="/system/welcome",method=RequestMethod.GET)
  public String welcome(Model m,HttpServletRequest request,HttpServletResponse response)throws Exception{
	  
	  return("/systemmanage/manager/welcome");
  }
  
}

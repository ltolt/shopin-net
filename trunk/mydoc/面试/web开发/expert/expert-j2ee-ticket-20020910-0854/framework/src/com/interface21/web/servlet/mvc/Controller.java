package com.interface21.web.servlet.mvc;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.interface21.web.servlet.ModelAndView;



/**
 * Simple MVC controller. Analogous to the 
 * WEBWORK OR MAVERICK class!?
 * <br/>The strength of this approach is its simplicity.
 * However, the downside is that too much processing often ends
 * up in the web tier.
 * @author Rod Johnson
 * @version $RevisionId$
 */
public interface Controller {	

	/**
	 * Process the request and return a ModelAndView object which the ControllerServlet
	 * will render.
	 * @return a ModelAndView for the ControllerServlet to render. A null 
	 * return is not an error. It indicates that this object completed 
	 * request processing itself, and there is no ModelAndView to render.
	 */
	ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
}


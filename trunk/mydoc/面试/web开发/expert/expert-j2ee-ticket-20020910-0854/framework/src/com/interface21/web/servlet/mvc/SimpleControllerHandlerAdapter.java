package com.interface21.web.servlet.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interface21.context.ApplicationContext;
import com.interface21.context.ApplicationContextException;
import com.interface21.web.servlet.HandlerAdapter;
import com.interface21.web.servlet.LastModified;
import com.interface21.web.servlet.ModelAndView;


/**
 * Adapter to use SimpleController with the generic ControllerServlet.
 * @author Rod Johnson
 * @version $RevisionId$
 */
public class SimpleControllerHandlerAdapter implements HandlerAdapter {
	
	/** Application context */
	private ApplicationContext ctx;

	/** Creates new RequestHandlerAdapter */
    public SimpleControllerHandlerAdapter() {
    }

	/** Set the ApplicationContext object used by this object
	 * @param ctx ApplicationContext object used by this object
	 * @throws ApplicationContextException if initialization attempted by this object
	 * after it has access to the WebApplicatinContext fails
	 */
	public void setApplicationContext(ApplicationContext ctx) throws ApplicationContextException {
		this.ctx = ctx;
	}
	
	/** Return the ApplicationContext used by this object.
	 * @return the ApplicationContext used by this object.
	 * Returns null if setApplicationContext() has not yet been called:
	 * this can be useful to check whether or not the object has been initialized.
	 */
	public ApplicationContext getApplicationContext() {
		return ctx;
	}
	
	public boolean supports(Object handler) {
		return handler != null && Controller.class.isAssignableFrom(handler.getClass());
	}
	
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response, Object delegate) throws IOException, ServletException {
		Controller controller = (Controller) delegate;
		return controller.handleRequest(request, response);
	}
	
	/**
	 * @see HandlerAdapter#getLastModified(HttpServletRequest, Object)
	 */
	public long getLastModified(HttpServletRequest request, Object delegate) {
		if (delegate instanceof LastModified) {
			return ((LastModified) delegate).getLastModified(request);
		}
		return -1L;
	}

}	// class SimpleControllerHandlerAdapter


package com.wrox.expertj2ee.junitee;

import javax.servlet.ServletException;

import com.interface21.web.context.WebApplicationContext;
import com.interface21.web.context.support.WebApplicationContextUtils;
import com.interface21.web.context.support.XmlWebApplicationContext;
import com.interface21.web.servlet.FrameworkServlet;

import junit.htmlui.TestServletBase;

public class TestServlet extends TestServletBase {
	
	private static WebApplicationContext rootWaca;
	
	public static WebApplicationContext getRootContext() {
		return rootWaca;
	}
	
	public static WebApplicationContext getContextForServlet(String servletName) throws ServletException {
		String namespace = FrameworkServlet.getNamespaceForServletName(servletName);
			WebApplicationContext waca = new XmlWebApplicationContext(rootWaca, namespace);
			waca.setServletContext(rootWaca.getServletContext());
		//	logger.config("Servlet with name '" + getServletName() + "' loaded child context " + waca);
			return waca;
	}

	/**
	 * Constructor for TestServlet.
	 */
	public TestServlet() {
		super();
	}

	/**
	 * @see TestServletBase#getDynamicClassLoader()
	 */
	protected ClassLoader getDynamicClassLoader() {
		return getClass().getClassLoader();
	}

	/**
	 * @see GenericServlet#init()
	 */
	public void init() throws ServletException {
		rootWaca = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		super.init();
	}

}

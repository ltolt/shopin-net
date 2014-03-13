
package com.interface21.web.servlet;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interface21.context.ApplicationContext;
import com.interface21.context.ApplicationEvent;
import com.interface21.web.context.RequestHandledEvent;
import com.interface21.web.context.WebApplicationContext;
import com.interface21.web.context.support.XmlWebApplicationContext;
import java14.java.util.logging.Level;



/**
 * Base servlet for servlets within the framework.
 * Offers the following functionality:
 * <li>Uses a WebApplicationContext to access a BeanFactory. The
 * servlet's configuration is determined by the beans in the namespace
 * 'servlet-name'-servlet.
 * <li>Debug stuff
 * <li>Publishes events on request processing, whether or not 
 * a request is successfully handled.
 * <p/>Because this extends HttpServletBean, rather than HttpServlet directly,
 * bean properties are mapped onto it.
 * <p/>Subclasses must implement two abstract methods:
 * initFrameworkServlet(), and doService(), which handles requests
 * to the servlet.
 * @author Rod Johnson
 * @version $Revision: 1.2 $
 */
public abstract class FrameworkServlet extends HttpServletBean {
	
	/** 
	 * Prefix for the Servlet attribute for the web application context.
	 * The completion is the servlet name.
	 */
	public static final String SERVLET_CONTEXT_PREFIX = "com.interface21.web.servlet.FrameworkServlet.CONTEXT.";

	/** Suffix for namespace bean factory names. If a servlet of this class is given the
	 * name 'test' in a context, the namespace used by the servlet will
	 * resolve to 'test-servlet'.
	 */
	private static final String NAMESPACE_SUFFIX = "-servlet";

	/** Default value for the debug property */
	public static final boolean DEFAULT_DEBUG_SETTING = false;

	/** Will be added to a request before processing begins if we're in debug mode */
	public static final String DEBUG_REQUEST_ATTRIBUTE = "com.interface21.framework.web.servlet.FrameworkServlet.DEBUG";
	
	/** Will be added to a request before processing begins: 
	 * the name of the ControllerServlet that handled the request */
	public static final String SERVLET_NAME_REQUEST_ATTRIBUTE = "com.interface21.framework.web.servlet.FrameworkServlet.SERVLET_NAME";

	/** Request parameter that will enable debug mode. This isn't a security hole:
	 * it's only set when the debuggable property is true
	 */
	public static final String DEBUG_PARAMETER = "__debug__";


	//---------------------------------------------------------------------
	// Instance data
	//---------------------------------------------------------------------

	/** WebApplicationContext for this servlet */
	private WebApplicationContext webApplicationContext;
	

	/** Holder for debug property */
	private boolean debug = DEFAULT_DEBUG_SETTING;

	/** Can request debugging be enabled!? */
	private boolean debuggable = false;
	
	/** 
	 * Should we publish the context as a ServletContext attribute
	 * to make it available to other code? 
	 */
	private boolean publishContext = true;
	
	/** Custom context class */
	private String contextClass;
	
	/** Any fatal exception encountered on startup.
	 * Thrown on each request.
	 */
	private ServletException startupException;


	/** Convenient method to allow other classes to check whether this is a
	 * debug request
	 */
	public static boolean isDebugMode(HttpServletRequest request) {
		return request.getAttribute(DEBUG_REQUEST_ATTRIBUTE) != null;
	}

	/**
	 * @return the namespace for the given servlet name
	*/
	public static String getNamespaceForServletName(String servletName) {
		return servletName + FrameworkServlet.NAMESPACE_SUFFIX;
	}
	
	
	/**
	 * Return the WebApplicationContext in which this servlet runs
	 * @return the WebApplicationContext in which this servlet runs
	 */
	public final WebApplicationContext getWebApplicationContext() {
		return webApplicationContext;
	}
	

	//---------------------------------------------------------------------
	// Bean properties
	//---------------------------------------------------------------------
	/** If debug is enabled, a debug attribute is set on every request
	 * handled. Cooperating classes can use this to output debug information
	 * in any way they choose.
	 */
	public final void setDebug(boolean debug) {
		this.debug = debug;
		logger.config("debug property set by bean property to " + this.debug);
	}

	/** If debuggable is enabled, a debug attribute will be set on every request
	 * that contains a special parameter, regardless of whether debug mode is
	 * permanently enabled.
	 * Cooperating classes can use this to output debug information
	 * in any way they choose.
	 */
	public final void setDebuggable(boolean debuggable) {
		this.debuggable = debuggable;
		logger.config("debuggable property set by bean property to " + this.debuggable);
	}

	/** Return the value of the debug property
	 * @return the value of the debug property
	 */
	public final boolean getDebug() {
		return debug;
	}

	/** Return the value of the debuggable property
	 * @return the value of the debuggable property
	 */
	public final boolean getDebuggable() {
		return debuggable;
	}
	
	/** 
	 * Set the a custom context class name
	 * @param classname name of custom context class to use
	 * This class be of type WebApplicationContext, and must
	 * implement a constructor taking two arguments:
	 * a parent WebApplicationContext (the root), and 
	 * the current namespace
	 */
	public final void setContextClass(String classname) {
		this.contextClass = classname;
	}
	
	/**
	 * Set whether to publish this servlet's context as a ServletContext attribute
	 * Default is true
	 * @param publishContext whether we should publish this servlet's
	 * WebApplicationContext as a ServletContext attribute, available to
	 * all objects in this web container. Default is true. This is especially
	 * handy during testing, although it is debatable whether it's good practice
	 * to let other application objects access the context this way.
	 */
	public final void setPublishContext(boolean publishContext) {
		this.publishContext = publishContext;
	}


	//---------------------------------------------------------------------
	// Overridden methods of HttpServletBean
	//---------------------------------------------------------------------
	/**
	 * Overridden method of HttpServletBean, invoked after any bean properties
	 * have been set.
	 * <br/>Locate the WebApplicationContext,
	 * load URL mappings and find the CommandProcessor (if any)
	 */
	protected final void initServletBean() throws ServletException {

		long startTime = System.currentTimeMillis();
		logger.config("-------------- Framework servlet '" + getServletName() + "' init");

		this.webApplicationContext = createWebApplicationContext();
		
		try {
			// invoke subclass init
			initFrameworkServlet();
		}
		catch (Exception ex) {
			this.startupException = new ServletException("Servlet with name '" + getServletName() + " failed to initialize, with exception " + ex, ex);
			throw startupException;
		}
		
		long elapsedTime = System.currentTimeMillis() - startTime;
		logger.config("-------------- Framework servlet '" + getServletName() + "' init completed in " + elapsedTime + " ms");
	}	// initServletBean


	/**
	 * Create the WebApplicationContext for this web app
	 * Go with default if can't find child
	 * @param sc ServletContext of web application to find application ontext for
	 * @return the WebApplicationContext for this web app
	 * @throws ServletException if the context object can't be found
	 */
	private WebApplicationContext createWebApplicationContext() throws ServletException {
		WebApplicationContext parent =
			(WebApplicationContext) getServletConfig().getServletContext().getAttribute(WebApplicationContext.WEB_APPLICATION_CONTEXT_ATTRIBUTE_NAME);
		if (parent == null) {
			String msg = "No root WebApplicationContext found: has ContextLoaderServlet been set to run on startup with index=1?";
			logger.severe(msg);
			this.startupException = new ServletException(msg);
			throw this.startupException;
		}
		
		String namespace = getNamespaceForServletName(getServletName());
		try {
			WebApplicationContext waca = (this.contextClass != null) ?
					instantiateCustomWebApplicationContext(this.contextClass, parent, namespace) :
				 	new XmlWebApplicationContext(parent, namespace);
			waca.setServletContext(getServletConfig().getServletContext());
			logger.config("Servlet with name '" + getServletName() + "' loaded child context " + waca);
			if (this.publishContext) { 
				//  Publish the context as a servlet context attribute
				String attName = SERVLET_CONTEXT_PREFIX + getServletName();
				getServletConfig().getServletContext().setAttribute(attName, waca);
				logger.config("Bound servlet's context in global ServletContext with name '" + attName + "'");
			}
			return waca;
		}
		catch (ServletException ex) {
			//throw new ServletException("Can't load namespace '" + namespace + "': " + ex, ex);
			
			//WAS: but surely should be fatal
			// MIGHTn't want to force to use own, I guess
			// bean exceptions are certainly fatal
			//logger.logp(Level.WARNING, getClass().getName(), "createWebApplicationContext", "Can't load namespace '" + namespace + "': " + ex, ex);
			//return parent;
			
			String mesg = "Can't load namespace '" + namespace + "': " + ex;
			this.startupException = new ServletException(mesg, ex);
			logger.logp(Level.SEVERE, getClass().getName(), "createWebApplicationContext", mesg, ex);
			throw startupException;
		}
	}
	
	
	// SHOUDL REALLY GO IN HELPER : it's really instantiateCustomContext
	/** Try to instantiate
	 * Error if we can't
	 */
	private WebApplicationContext instantiateCustomWebApplicationContext(String classname, WebApplicationContext parent, String namespace) throws ServletException {
		logger.config("Servlet with name '" + getServletName() + "' will try to create custom WebApplicationContext context of class '" + classname + "'");
		try {
			Class clazz = Class.forName(classname);
			if (!WebApplicationContext.class.isAssignableFrom(clazz))
				throw new ServletException("Fatal initialization error in servlet with name '" + getServletName() + "': custom WebApplicationContext class '" + classname + "' must implement WebApplicationContext");
			Constructor constructor = clazz.getConstructor( new Class[] { ApplicationContext.class, String.class} );
			return (WebApplicationContext) constructor.newInstance(new Object[] { parent, namespace} );
		} 
		catch (ClassNotFoundException ex) {
			throw new ServletException("Fatal initialization error in servlet with name '" + getServletName() + "': can't load custom WebApplicationContext class '" + classname + "'", ex);
		} 
		catch (NoSuchMethodException ex) {
			throw new ServletException("Fatal initialization error in servlet with name '" + getServletName() + "': custom WebApplicationContext class '" + classname + "' must define a constructor taking ApplicationContext (parent) and String (namespace)", ex);
		}
		catch (InvocationTargetException ex) {
			throw new ServletException("Fatal initialization error in servlet with name '" + getServletName() + "': custom WebApplicationContext class '" + classname + "' : constructor threw exception", ex);
		}
		catch (IllegalAccessException ex) {
			throw new ServletException("Fatal initialization error in servlet with name '" + getServletName() + "': custom WebApplicationContext class '" + classname + "' : no permission to invoke constructor", ex);
		}
		catch (InstantiationException ex) {
			throw new ServletException("Fatal initialization error in servlet with name '" + getServletName() + "': custom WebApplicationContext class '" + classname + "' : failed to instantiate", ex);
		}
	}


	/**
	 * Subclasses must implement this method to perform any initialization they require.
	 * The implementation may be empty.
	 * This method will be invoked after any bean properties
	 * have been set and WebApplicationContext and BeanFactory have been loaded
	 * @throws any Exception
	 */
	protected abstract void initFrameworkServlet() throws Exception;
	

	/** It's up to each CommandGenerator to decide whether or not it supports a method.
	 * It should throw a Servlet exception if it doesn't support a particular request type.
	 * This might commonly be done with GET for forms, for example
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		serviceWrapper(request, response);
	}

	/** It's up to each CommandGenerator to decide whether or not it supports a method.
	 * It should throw a Servlet exception if it doesn't support a particular request type.
	 * This might commonly be done with GET for forms, for example
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		serviceWrapper(request, response);
	}


	/**
	 * Handle this request, publishing an event regardless of the outcome.
	 * The actually event handling is performed by the abstract doService() method.
	 * Both doGet() and doPost() are handled by this method
	 */
	private void serviceWrapper(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Throw an exception if we failed to start up with a fatal error
		if (this.startupException != null)
			throw startupException;
		
		boolean debugMode = this.debug || (this.debuggable && request.getParameter(DEBUG_PARAMETER) != null);

		if (debugMode) {
			// Set the debug attribute in the request, which will be used
			// by other components to render content
			request.setAttribute(DEBUG_REQUEST_ATTRIBUTE, Boolean.TRUE);
			
			// Show the name of this servlet
			request.setAttribute(SERVLET_NAME_REQUEST_ATTRIBUTE, getServletName());
		}


		long startTime = System.currentTimeMillis();
		Throwable failureCause = null;

		try {
			// Invoke the subclass's service method
			doService(request, response, debugMode);
		}
		catch (ServletException ex) {
			failureCause = ex;
			logger.logp(Level.SEVERE, getClass().getName(), "serviceWrapper", "Servlet failed to handle request: ServletException", ex);
			throw ex;
		}
		catch (IOException ex) {
			failureCause = ex;
			logger.logp(Level.SEVERE, getClass().getName(), "serviceWrapper", "Servlet failed to handle request: IOException", ex);
			throw ex;
		}
		catch (Exception ex) {
			failureCause = ex;
			String mesg = "Unexpected (probably runtime) exception";
			logger.logp(Level.SEVERE, getClass().getName(), "serviceWrapper", mesg, ex);
			throw new ServletException(mesg, ex);
		}
		finally {
			long processingTime = System.currentTimeMillis() - startTime;

			/*
			if (debugMode && failureCause != null) {
				// Output verbose information about failure, showing
				// how far we got (some of the variables output will be null
				log4jCategory.error("url='" + request.getServletPath() + "': Failure (" + failureCause + "); " +
				"handler=[" + mappedHandler + "]; handlerAdapter=[" + ha + "]", failureCause);
			}
			*/

			// Whether or not we succeeded, publish an event
			ApplicationEvent e = (failureCause == null) ?
			new RequestHandledEvent(this, request.getRequestURI(), processingTime, request.getRemoteAddr(), request.getMethod(), getServletConfig().getServletName()) :
				new RequestHandledEvent(this, request.getRequestURI(), processingTime, request.getRemoteAddr(), request.getMethod(), getServletConfig().getServletName(), failureCause);
				webApplicationContext.publishEvent(e);
		}
	}	// serviceWrapper
	
	
	
	/**
	 * Subclasses must implement this method to do the work of request handling.
	 * The contract is the same as that for the doGet() or doPost() method of javax.servlet.http.HttpServlet.
	 * This class intercepts calls to ensure that event publication takes place.
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param debugMode whether or not we are in debug mode. Subclasses may emit 
	 * additional log output in debug mode, or add debug attributes to the request being processed.
	 * If this parameter is true, this class will already have added a debug attribute to
	 * the request.
	 */
	protected abstract void doService(HttpServletRequest request, HttpServletResponse response, boolean debugMode) throws ServletException, IOException;

}	// FrameworkServlet

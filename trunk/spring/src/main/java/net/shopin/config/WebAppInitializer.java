/**
 * @Probject Name: spring
 * @Path: net.shopin.config.WebAppInitializer.java
 * @Create By kongm
 * @Create In 2013-12-2 下午4:22:08
 * TODO
 */
package net.shopin.config;

import java.util.Set;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * @Class Name WebAppInitializer
 * @Author kongm
 * @Create In 2013-12-2
 */
public class WebAppInitializer implements WebApplicationInitializer{

	private static Logger LOG = LoggerFactory.getLogger(WebAppInitializer.class);
	
	public void onStartup(ServletContext servletContext) throws ServletException {
		WebApplicationContext rootContext = createRootContext(servletContext);
		configureSpringMvc(servletContext, rootContext);
		configureSpringSecurity(servletContext, rootContext);
	}
	
	private void configureSpringSecurity(ServletContext servletContext,WebApplicationContext rootContext){
		FilterRegistration.Dynamic springSecurity = servletContext.addFilter("springSecurityFilterChain", 
				new DelegatingFilterProxy("springSecurityFilterChain",rootContext));
		springSecurity.addMappingForUrlPatterns(null, true, "/*");
	}
	
	
	
	private WebApplicationContext createRootContext(ServletContext servletContext){
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		rootContext.register(CoreConfig.class,SecurityConfig.class);
		rootContext.refresh();
		servletContext.addListener(new ContextLoaderListener(rootContext));
		servletContext.setInitParameter("defaultHtmlEscape", "true");
		return rootContext;
	}
	
	private void configureSpringMvc(ServletContext servletContext, WebApplicationContext rootContext){
		AnnotationConfigWebApplicationContext mvcContext = new AnnotationConfigWebApplicationContext();
		mvcContext.register(MVCConfig.class);
		mvcContext.setParent(rootContext);
		
		//{!begin configureBottom}
		ServletRegistration.Dynamic appServlet = servletContext.addServlet("webservice",new DispatcherServlet(mvcContext));
		appServlet.setLoadOnStartup(1);
		Set<String> mappingConlicts = appServlet.addMapping("/");
		if(!mappingConlicts.isEmpty()){
			for(String s :mappingConlicts){
				LOG.error("Mapping conflicts :" + s);
			}
			throw new IllegalStateException("'webservice' cannot be mapped to '/'");
		}
		//{!end }
	}
	
}

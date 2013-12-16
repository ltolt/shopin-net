/**
 * @Probject Name: web-spring
 * @Path: net.shopin.config.WebAppInitializer.java
 * @Create By kongm
 * @Create In 2013-12-11 下午1:39:28
 * TODO
 */
package net.shopin.config;

import javax.servlet.Filter;

import org.springframework.core.annotation.Order;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 * @Class Name WebAppInitializer
 * @Author kongm
 * @Create In 2013-12-11
 */
@Order(2)
public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[]{SecurityConfig.class, PersistenceConfig.class,CoreConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[]{WebConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[]{"/"};
	}

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		return new Filter[]{characterEncodingFilter};
	}

	
	
}

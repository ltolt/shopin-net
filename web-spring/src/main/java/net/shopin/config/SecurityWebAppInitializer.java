/**
 * @Probject Name: web-spring
 * @Path: net.shopin.config.SecurityWebAppInitializer.java
 * @Create By kongm
 * @Create In 2013-12-16 上午11:36:27
 * TODO
 */
package net.shopin.config;

import org.springframework.core.annotation.Order;
import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/**
 * This configures the Spring Security filter chain and manages inserting it into the web context.
 * @Class Name SecurityWebAppInitializer
 * @Author kongm
 * @Create In 2013-12-16
 */
/**
 * It is important that the Spring Security setup is done before the DispatcherServlet configuration in WebAppInitializer. The @Order annotation from Spring Core can be used to manage the order of execution.
 * @Class Name SecurityWebAppInitializer
 * @Author kongm
 * @Create In 2013-12-16
 */
@Order(1)
public class SecurityWebAppInitializer extends AbstractSecurityWebApplicationInitializer
{

}

/**
 * @Probject Name: spring
 * @Path: net.shopin.config.MVCConfig.java
 * @Create By kongm
 * @Create In 2013-12-2 下午3:45:43
 * TODO
 */
package net.shopin.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * @Class Name MVCConfig
 * @Author kongm
 * @Create In 2013-12-2
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"net.shopin.web.rest"})
public class MVCConfig {

}

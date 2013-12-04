/**
 * @Probject Name: spring
 * @Path: net.shopin.config.JPAConfiguration.java
 * @Create By kongm
 * @Create In 2013-12-4 下午5:34:57
 * TODO
 */
package net.shopin.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @Class Name JPAConfiguration
 * @Author kongm
 * @Create In 2013-12-4
 */
@Configuration
@EnableJpaRepositories(basePackages = "net.shopin.persistence.repository",
      includeFilters = @ComponentScan.Filter(value = {}))
@EnableTransactionManagement
public class JPAConfiguration {
	
	

}

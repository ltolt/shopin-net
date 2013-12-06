/**
 * @Probject Name: spring
 * @Path: net.shopin.config.GemfireConfiguration.java
 * @Create By kongm
 * @Create In 2013-12-6 下午1:59:01
 * TODO
 */
package net.shopin.config;

import net.shopin.persistence.repository.OrderStatusRepository;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ImportResource;
import org.springframework.data.gemfire.repository.config.EnableGemfireRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @Class Name GemfireConfiguration
 * @Author kongm
 * @Create In 2013-12-6
 */
@Configuration
@ImportResource({"classpath:gemfire/client.xml"})
@EnableTransactionManagement
@EnableGemfireRepositories(basePackages = "net.shopin.persistence.repository",
   includeFilters = @ComponentScan.Filter(value = {OrderStatusRepository.class},type = FilterType.ASSIGNABLE_TYPE))
public class GemfireConfiguration {

}

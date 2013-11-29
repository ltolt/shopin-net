/**
 * @Probject Name: spring
 * @Path: net.SpringBoot.java
 * @Create By kongm
 * @Create In 2013-11-29 下午3:15:52
 * TODO
 */
package net;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @Class Name SpringBoot
 * @Author kongm
 * @Create In 2013-11-29
 */
@Configuration
@ComponentScan
@EnableAutoConfiguration
public class SpringBoot {

	/**
	 * @Methods Name main
	 * @Create In 2013-11-29 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		SpringApplication.run(SpringBoot.class);
	}

}

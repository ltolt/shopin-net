/**
 * @Probject Name: web-spring
 * @Path: net.shopin.SpringBoot.java
 * @Create By kongm
 * @Create In 2013-12-11 下午2:29:34
 * TODO
 */
package net.shopin;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @Class Name SpringBoot	
 * @Author kongm
 * @Create In 2013-12-11
 */
@Configuration
@ComponentScan
@EnableAutoConfiguration
public class SpringBoot {

	/**
	 * @Methods Name main
	 * @Create In 2013-12-11 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		SpringApplication.run(SpringBoot.class);
	}

}

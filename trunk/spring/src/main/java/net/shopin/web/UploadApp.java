/**
 * @Probject Name: spring
 * @Path: net.shopin.web.UploadApp.java
 * @Create By kongm
 * @Create In 2013-11-28 上午10:08:18
 * TODO
 */
package net.shopin.web;

import javax.servlet.MultipartConfigElement;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @Class Name UploadApp
 * @Author kongm
 * @Create In 2013-11-28
 */
@Configuration
@ComponentScan
@EnableAutoConfiguration
public class UploadApp {

	@Bean
	MultipartConfigElement multipartConfigElement(){
		return new MultipartConfigElement("");
	}
	
	/**
	 * @Methods Name main
	 * @Create In 2013-11-28 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		SpringApplication.run(UploadApp.class);

	}

}

/**
 * @Probject Name: spring
 * @Path: net.shopin.util.Application.java
 * @Create By kongm
 * @Create In 2013-11-22 下午5:30:02
 * TODO
 */
package net.shopin.util;

import net.shopin.api.IMessageService;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @Class Name Application
 * @Author kongm
 * @Create In 2013-11-22
 */
@Configuration
@ComponentScan
public class Application {
	
	@Bean
	IMessageService mockMessageService(){
		return new IMessageService() {
			public String getMessage() {
				return "Hello World!";
			}
		};
	}
	

	/**
	 * @Methods Name main
	 * @Create In 2013-11-22 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(Application.class);
		MessagePrinter printer = context.getBean(MessagePrinter.class);
		printer.printMessage();
	}

}

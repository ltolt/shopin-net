/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.service.LocalGemfireServer.java
 * @Create By kongm
 * @Create In 2013-12-6 下午1:50:59
 * TODO
 */
package net.shopin.persistence.service;

import java.io.IOException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Create a cache server in this process and adds some data to the cache
 * @Class Name LocalGemfireServer
 * @Author kongm
 * @Create In 2013-12-6
 */
public class LocalGemfireServer {
	
	public static void main(String[] args) throws IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext("server/cache-config.xml");
		System.out.println("Press <ENTER> to terminate the cache server");
		System.in.read();
		System.exit(0);
	}

}

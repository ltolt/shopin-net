package net.shopin.mongodb;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.Assert;

/**
 * @author  Lucas k
 *
 *	hello mongo
 */
public class App {

	
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("log into start ...");
		ConfigurableApplicationContext context = null;
		//use @Configuration java bean
		context = new ClassPathXmlApplicationContext("bootstrap.xml");
		Assert.notNull(context);
		System.out.println(context);
		//use xml context
//		context = new ClassPathXmlApplicationContext("applicationContext_mongo.xml");
		HelloMongo hello = context.getBean(HelloMongo.class);
		hello.run();
		System.out.println("DONE");
	}

}

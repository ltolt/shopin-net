/**
 * 说明:
 *     使用默认配置的logback
 * @Probject Name: framework
 * @Path: logback.exp.BasicConfiguration.java
 * @Create By kongm
 * @Create In 2013-8-16 上午11:30:33
 * TODO
 */
package logback.exp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @Class Name BasicConfiguration
 * @Author kongm
 * @Create In 2013-8-16
 */
public class BasicConfiguration {

	final static Logger logger = LoggerFactory.getLogger(BasicConfiguration.class);
	
	
	/**
	 * @Methods Name main
	 * @Create In 2013-8-16 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		logger.info("enter the app");

		Foo foo = new Foo();
		foo.doit();
		logger.info("exit app");
		
		

	}

}
class Foo{
	
	static final Logger logger = LoggerFactory.getLogger(Foo.class);
	
	 void doit(){
		 logger.debug("just do it");
	 }
	
	
	
	
}



















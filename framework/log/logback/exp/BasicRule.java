/**
 * 说明:
 *     异常的基本规则
 * @Probject Name: framework
 * @Path: logback.exp.BasicRule.java
 * @Create By kongm
 * @Create In 2013-8-15 下午8:37:22
 * TODO
 */
package logback.exp;

import org.slf4j.LoggerFactory;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;

/**
 * @Class Name BasicRule
 * @Author kongm
 * @Create In 2013-8-15
 */
public class BasicRule {

	
	
	
	/**
	 * @Methods Name main
	 * @Create In 2013-8-15 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		//get a logger instance named "com.foo".let use further 
		//assume that the logger is of type logback..Logger so we can set its level
		Logger logger = (Logger) LoggerFactory.getLogger("com.foo");
		//set its level to Info the set level method requires a logback logger
		logger.setLevel(Level.INFO);
		org.slf4j.Logger barLogger = LoggerFactory.getLogger("com.foo.Bar");
		//this request is enabled because WARN >= INFO
		logger.warn("low fuel level.");
		//this request is disabled because DEBUG < INFO
		logger.debug("starting search for nearest gas station.");
		
		//the logger instance barlogger named "com.foo.bar" 
		//will inherit its level from the logger named "com.foo"
		//thus the following request is enabled 
		barLogger.info("Located nearest gas station.");
		//disabled
		barLogger.debug("fuck ");
		
		if(barLogger.isDebugEnabled()){
			barLogger.debug("Entry Number:" + 1 + "is");
		}
		if(barLogger.isInfoEnabled()){
			barLogger.info("Entry Number:" + 1 + "is");
		}
		
		StringBuffer buffer = new StringBuffer("abc");
		barLogger.warn("the stringbuffer is {}.",buffer);
		for(int i = 0;i<10000;i++){
			buffer.append("test log " + i);
		}
		
		long start = System.currentTimeMillis();
		barLogger.info("the buffer is " + buffer + "..");
		long end = System.currentTimeMillis();
		System.out.println("construct cost time" + (end - start) + "  ms");
		start = System.currentTimeMillis();
		barLogger.info("the buffer is {}.",buffer);
		end = System.currentTimeMillis();
		System.out.println("{} cost time " + (end -start) + " ms");
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}

}

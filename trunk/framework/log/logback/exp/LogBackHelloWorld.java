/**
 * @Probject Name: framework
 * @Path: logback.exp.LogBackHelloWorld.java
 * @Create By kongm
 * @Create In 2013-8-15 下午5:59:43
 * TODO
 */
package logback.exp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.core.util.StatusPrinter;

/**
 * @Class Name LogBackHelloWorld
 * @Author kongm
 * @Create In 2013-8-15
 */
public class LogBackHelloWorld {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-15 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		Logger logger = LoggerFactory.getLogger(LogBackHelloWorld.class);
		logger.debug("hello world logback");
		//print internel state
		LoggerContext lc = (LoggerContext) LoggerFactory.getILoggerFactory(); 
		StatusPrinter.print(lc);
		Logger rootLogger = LoggerFactory.getLogger(org.slf4j.Logger.ROOT_LOGGER_NAME);
		rootLogger.warn("root logger trace");
		rootLogger.debug("root logger default level");
	}

}

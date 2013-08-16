/**
 * @Probject Name: framework
 * @Path: logback.exp.JoranConfig.java
 * @Create By kongm
 * @Create In 2013-8-16 下午2:39:47
 * TODO
 */
package logback.exp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.joran.JoranConfigurator;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.util.StatusPrinter;

/**
 * @Class Name JoranConfig
 * @Author kongm
 * @Create In 2013-8-16
 */
public class JoranConfig {

	final static Logger logger = LoggerFactory.getLogger(JoranConfig.class);
	
	/**
	 * @Methods Name main
	 * @Create In 2013-8-16 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		//asume slf4j is bound to logback in the current evviroment
		LoggerContext context =  (LoggerContext) LoggerFactory.getILoggerFactory(); 

		try {
			JoranConfigurator configurator = new JoranConfigurator();
			configurator.setContext(context);
			//call context reset() to clear any previous config 
			context.reset();
			configurator.doConfigure(args[0]);
		} catch (JoranException e) {
			e.printStackTrace();
		}
		
		StatusPrinter.printInCaseOfErrorsOrWarnings(context);
		logger.info("enter the app");
		Foo foo = new Foo();
		foo.doit();
		logger.info("exit app");
		
	}

}











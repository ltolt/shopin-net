/**
 * @Probject Name: framework
 * @Path: base.framework.performance.Perf4JAppenderExample.java
 * @Create By kongm
 * @Create In 2013-10-10 下午3:36:51
 * TODO
 */
package base.framework.performance;

import org.apache.log4j.Logger;
import org.perf4j.StopWatch;
import org.perf4j.log4j.Log4JStopWatch;

/**
 * @Class Name Perf4JAppenderExample
 * @Author kongm
 * @Create In 2013-10-10
 */
public class Perf4JAppenderExample {

	/**
	 * @Methods Name main
	 * @Create In 2013-10-10 By kongm
	 * @param args
	 *            void
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		// note that the log4j framework will automatically load the log4j.xml
		// file if it is in a root directory on the classpath
		Logger rootLogger = Logger.getRootLogger();

		for (int i = 0; i < 10; i++) {
			// By default the Log4JStopWatch uses the Logger named
			// org.perf4j.TimingLogger
			StopWatch stopWatch = new Log4JStopWatch();
			// just sleep
			Thread.sleep((long) (Math.random() * 1000L));
			rootLogger.info("Normal logging messages only go to the console");
			// Calling lap() stops timing for the previous block, sends the
			// message to the log4j Logger, and starts timing the next block.
			stopWatch.lap("firstblock");
			Thread.sleep((long) (Math.random() * 2000L));
			stopWatch.stop("secondBlock");

		}

	}

}

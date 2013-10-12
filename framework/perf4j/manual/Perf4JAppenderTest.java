/**
 * @Probject Name: framework
 * @Path: manual.Perf4JAppenderTest.java
 * @Create By kongm
 * @Create In 2013-10-12 下午4:48:55
 * TODO
 */
package manual;

import org.apache.log4j.Logger;
import org.perf4j.StopWatch;
import org.perf4j.log4j.Log4JStopWatch;

/**
 * @Class Name Perf4JAppenderTest
 * @Author kongm
 * @Create In 2013-10-12
 */
public class Perf4JAppenderTest {

	/**
	 * @Methods Name main
	 * @Create In 2013-10-12 By kongm
	 * @param args void
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		//log4j 框架会自动从classpath中加载log4j.xml
		Logger rootLogger = Logger.getRootLogger();
		
		for(int i=0;i < 20;i++){
			//默认的Log4JStopWatch会使用名为org.perf4j.TimeLogger的logger
			StopWatch stopWatch = new Log4JStopWatch();
			//demo dummy code
			Thread.sleep((long) (Math.random() * 1000L));
			rootLogger.info("Normal logging message only go to the console");
			//调用lap方法停止先前代码的计时,发送message到log4j的Logger并开始
			//下个代码块的计时
			stopWatch.lap("firstblock");
			Thread.sleep((long) (Math.random() * 2000L));
			stopWatch.stop("secondblock");
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// TODO Auto-generated method stub

	}

}

/**
 * @Probject Name: shopin-core
 * @Path: net.shopin.stats.Perf4JTest.java
 * @Create By kongm
 * @Create In 2013-10-17 下午4:55:29
 * TODO
 */
package net.shopin.stats;

import org.apache.log4j.Logger;
import org.perf4j.StopWatch;
import org.perf4j.log4j.Log4JStopWatch;

/**
 * @Class Name Perf4JTest
 * @Author kongm
 * @Create In 2013-10-17
 */
public class Perf4JTest {
	
	public static void runPerf4j() throws Exception{
    	Logger rootLogger = Logger.getRootLogger();
        for (int i = 0; i < 10; i++) {
            // Log4JStopWatch默认使用org.perf4j.TimingLogger这个类
            StopWatch stopWatch = new Log4JStopWatch();
            //模拟代码运行时间
            Thread.sleep((long) (Math.random() * 1000L));
            //打印到控制台
            rootLogger.info("Normal logging messages only go to the console");
            stopWatch.lap("firstBlock");
            Thread.sleep((long) (Math.random() * 2000L));
            stopWatch.stop("secondBlock");
        }
    }

	/**
	 * @Methods Name main
	 * @Create In 2013-10-17 By kongm
	 * @param args void
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		//runPerf4j();
		Logger rootLogger = Logger.getRootLogger();
		StopWatch stopWatch = new Log4JStopWatch();
		Thread.sleep(1000l);
		rootLogger.info(stopWatch.lap("first"));
		Thread.sleep(1000l);
		rootLogger.info(stopWatch.stop("second"));
		
	}

}

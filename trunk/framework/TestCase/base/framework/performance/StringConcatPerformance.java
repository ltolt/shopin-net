/**
 * @Probject Name: framework
 * @Path: base.framework.performance.StringConcatPerformance.java
 * @Create By kongm
 * @Create In 2013-10-9 下午8:04:24
 * TODO
 */
package base.framework.performance;

import org.perf4j.LoggingStopWatch;
import org.perf4j.StopWatch;

/**
 * 说明: 实验java中字符串的各种处理手段的效率
 * 实验结果:
 * 在做最简单的拼接时，如果我们不想创建StringBuffer或StringBuilder实例使
 * ，我们也因该使用concat。但是对于大量的字符串拼接操作，我们就不应该使用concat
 *   因此，在不考虑线程安全和同步的情况下，为了获得最高的性能，我们应尽量使用StringBuilder
 * @Class Name StringConcatPerformance
 * @Author kongm
 * @Create In 2013-10-9
 */
public class StringConcatPerformance {

	private static final int OUTER_ITERATION = 20;
	private static final int INNER_ITERATION = 50000;

	/**
	 * @Methods Name main
	 * @Create In 2013-10-9 By kongm
	 * @param args
	 *            void
	 */
	public static void main(String[] args) {
		String addTestStr = "";
		String concatTestStr = "";
		StringBuffer concatTestSb = null;
		StringBuilder concatTestSbu = null;

		for (int outerIndex = 0; outerIndex <= OUTER_ITERATION; outerIndex++) {
			StopWatch stopWatch = new LoggingStopWatch("stringaddConcat");
			addTestStr = "";
			for (int innerIndex = 0; innerIndex <= INNER_ITERATION; innerIndex++) {
				addTestStr += "*";
			}
			stopWatch.stop();
		}

		for (int outerIndex = 0; outerIndex <= OUTER_ITERATION; outerIndex++) {
			StopWatch stopWatch = new LoggingStopWatch("stringconcat");
			concatTestStr = "";
			for (int innerIndex = 0; innerIndex <= INNER_ITERATION; innerIndex++)
				concatTestStr = concatTestStr.concat("*");
			stopWatch.stop();
		}

		for (int outerIndex = 0; outerIndex <= OUTER_ITERATION; outerIndex++) {
			StopWatch stopWatch = new LoggingStopWatch("stringbufferconcat");
			concatTestSb = new StringBuffer();
			for (int innerIndex = 0; innerIndex <= INNER_ITERATION; innerIndex++)
				concatTestSb.append("*");
			stopWatch.stop();
		}

		for (int outerIndex = 0; outerIndex <= OUTER_ITERATION; outerIndex++) {
			StopWatch stopWatch = new LoggingStopWatch("stringbuilderconcat");
			concatTestSbu = new StringBuilder();
			for (int innerIndex = 0; innerIndex <= INNER_ITERATION; innerIndex++)
				concatTestSbu.append("*");
			stopWatch.stop();
		}

	}

}

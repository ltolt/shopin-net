/**
 * @Probject Name: business
 * @Path: net.shopin.perf.PerfTest.java
 * @Create By kongm
 * @Create In 2013-10-10 下午4:34:51
 * TODO
 */
package net.shopin.perf;

import net.shopin.base.Perf4JTest;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @Class Name PerfTest
 * @Author kongm
 * @Create In 2013-10-10
 */
public class PerfTest {

	/**
	 * @Methods Name main
	 * @Create In 2013-10-10 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		AbstractApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		context.start();
		Perf4JTest bean = context.getBean(Perf4JTest.class);
		bean.testing();

	}

}

/**
 * @Probject Name: business
 * @Path: net.shopin.base.Perf4JTest.java
 * @Create By kongm
 * @Create In 2013-10-10 下午4:29:18
 * TODO
 */
package net.shopin.base;

import org.perf4j.aop.Profiled;

/**
 * @Class Name Perf4JTest
 * @Author kongm
 * @Create In 2013-10-10
 */
public class Perf4JTest {
	
	@Profiled
    public void testing() {
        System.out.println("testt" );
    }
	

}

/**
 * @Path: net.shopin.task.Task.java
 * @Probject Name: spring
 * @Create By kongm
 * @Create In 2013-11-26 上午9:53:04
 * TODO
 */
package net.shopin.task;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Class Name Task
 * @Author kongm
 * @Create In 2013-11-26
 */
@ComponentScan
@EnableAutoConfiguration
public class Task {

	/**
	 * @Methods Name main
	 * @Create In 2013-11-26 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		SpringApplication.run(ScheduledTasks.class);
	}

}

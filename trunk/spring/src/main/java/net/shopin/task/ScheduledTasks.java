/**
 * @Probject Name: spring
 * @Path: net.shopin.task.ScheduledTasks.java
 * @Create By kongm
 * @Create In 2013-11-25 下午8:54:01
 * TODO
 */
package net.shopin.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

/**
 * @Class Name ScheduledTasks
 * @Author kongm
 * @Create In 2013-11-25
 */
@EnableScheduling
public class ScheduledTasks {

	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	
	
	@Scheduled(fixedRate = 5000)
	public void reportCurrentTime(){
		System.out.println("The  time is now " + dateFormat.format(new Date()));
	}
	
	
}

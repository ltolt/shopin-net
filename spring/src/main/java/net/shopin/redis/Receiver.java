/**
 * @Probject Name: spring
 * @Path: net.shopin.redis.Receiver.java
 * @Create By kongm
 * @Create In 2013-11-26 下午3:25:53
 * TODO
 */
package net.shopin.redis;

/**
 *  message-based message receivers
 * @Class Name Receiver
 * @Author kongm
 * @Create In 2013-11-26
 */
public class Receiver {

	public void receiveMessage(String message){
		System.out.println("Received < " + message + ">");
	}
	
}

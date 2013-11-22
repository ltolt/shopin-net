/**
 * @Probject Name: spring
 * @Path: net.shopin.web.GreetingController.java
 * @Create By kongm
 * @Create In 2013-11-22 下午5:54:11
 * TODO
 */
package net.shopin.web;

import java.util.concurrent.atomic.AtomicLong;

import net.shopin.view.Greeting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Class Name GreetingController
 * @Author kongm
 * @Create In 2013-11-22
 */
@Controller
public class GreetingController {

	private static final String template = "Hello, %s!";
	
	private final AtomicLong counter = new AtomicLong();
	
	@RequestMapping("/greeting")
	public @ResponseBody Greeting greeting(@RequestParam(value = "name",required = false,defaultValue = "World")String name){
		return new Greeting
				(counter.incrementAndGet(), String.format(template, name));
	}
	
	
	
}

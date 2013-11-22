/**
 * @Probject Name: spring
 * @Path: net.shopin.util.MessagePrinter.java
 * @Create By kongm
 * @Create In 2013-11-22 下午5:28:43
 * TODO
 */
package net.shopin.util;

import net.shopin.api.IMessageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @Class Name MessagePrinter
 * @Author kongm
 * @Create In 2013-11-22
 */
@Component
public class MessagePrinter {

	@Autowired
	private IMessageService messageService;
	
	public void printMessage(){
		System.out.println(this.messageService.getMessage());
	}
	
	
}

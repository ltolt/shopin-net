/**
 * 
 */
package net.shopin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author kongming
 *
 */
@Controller
@RequestMapping("/forward")
public class ForwardController {

	@RequestMapping(value = "{to}",method = {RequestMethod.GET,RequestMethod.POST})
	public String forward(@PathVariable("to") String to){
		
		return to;
	}
	
	
	
	
}


package surplus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interface21.web.servlet.ModelAndView;
import com.interface21.web.servlet.mvc.multiaction.MultiActionController;

public class MultiTestController extends MultiActionController {

	
	public ModelAndView foo(HttpServletRequest request, HttpServletResponse response)  {
		return new ModelAndView("debugView", "text", "HEY man, this is foo and it's cool cool cool");
	} 
	
	public ModelAndView bar(HttpServletRequest request, HttpServletResponse response)  {
		return new ModelAndView("debugView", "text", "ba ba ba...");
	} 
	
	public ModelAndView baz(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Got a baz request");
		throw new Exception("Get fucked");
	} 
	
	public ModelAndView sess(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		return new ModelAndView("debugView", "text", "There better be a session!!");
	} 

}

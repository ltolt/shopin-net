package surplus;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interface21.context.ApplicationContextException;
import com.interface21.validation.*;
import com.interface21.validation.BindException;
import com.interface21.validation.DataBinder;
import com.interface21.web.servlet.ModelAndView;
import com.wrox.expertj2ee.ticket.customer.RegisteredUser;
import com.wrox.expertj2ee.ticket.customer.UserValidator;
import com.wrox.expertj2ee.ticket.exceptions.NoSuchPerformanceException;

//* SHOULD REALLY BE SESSION AWARE
public class PaymentDetailsController extends AbstractTicketController {


	/**
	 * @see Controller#handleRequest(HttpServletRequest, HttpServletResponse)
	 */
	protected ModelAndView handleTicketRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException, NoSuchPerformanceException {
			
			RegisteredUser user = new RegisteredUser();
			// POPULATE FROIM SESSION IF POSSIBLE
			
			//request.setAttribute("user", user);
			
			return new ModelAndView("paymentForm", "user", user);
		
	}

}
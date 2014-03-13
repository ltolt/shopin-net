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
public class ConfirmationController extends AbstractTicketController {

	private UserValidator validator;

	/**
	 * Moves logic out
	 */
	public void setUserValidator(UserValidator validator) {
		this.validator = validator;
	}

	/**
	 * @see AbstractTicketController#ticketInit()
	 */
	protected void ticketInit() throws ApplicationContextException {
		if (this.validator == null)
			throw new ApplicationContextException("userValidator property must be set on " + getClass());
	}

	/**
	 * @see Controller#handleRequest(HttpServletRequest, HttpServletResponse)
	 */
	protected ModelAndView handleTicketRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException, NoSuchPerformanceException {
			
			RegisteredUser user = new RegisteredUser();
//		try {
//			WebRequestDataBinder binder = new WebRequestDataBinder(user);
//			binder.bind(request);
//			validator.validate(user, binder);
//			binder.complete(request, "user");
//			
//			// Do payment with user
//			logger.fine("Have valid user details: will do something with them");
//			
//			return new ModelAndView("debugView");
//		}
//		catch (BindException ex) {
//			// Bind failure
//			// already added to request: just choose different view
//			return new ModelAndView("paymentForm");
//		}
return null;
		
	}

}
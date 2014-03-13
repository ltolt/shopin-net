
package surplus;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interface21.web.servlet.ModelAndView;

public abstract class AbstractTicketControllerInSession extends AbstractTicketController {


	// Could use a session store?
	// sessionStore.getSession();
	// do stuff
	// sessionStore.store();
	
	// HttpSessionStore can hide details of rebinding in put and get impls
	
	// SessionStore interface is put() get()
	
	
	// We could return our own HttpSession implementation
	// must do SessionBinding listener...
	
	// DECISION:
	// LEAVE TO THE END...use session API for the moment
	
	
	
	/**
	 * @see Controller#handleRequest(HttpServletRequest, HttpServletResponse)
	 */
	protected final ModelAndView handleTicketRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		logger.fine("handleRequest");
		
		// Don't create a session if none exists
		HttpSession session = request.getSession(false);
		
		if (session == null)
			throw new ServletException("No existing session; forbidden to access this resource");
		
		// Perform any other checks on the session?
			
		return handleRequestInSession(request, response, session);
	}

	protected abstract ModelAndView handleRequestInSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException;
} 
 
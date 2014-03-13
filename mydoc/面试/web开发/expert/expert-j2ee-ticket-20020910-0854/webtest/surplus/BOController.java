
package surplus;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interface21.context.ApplicationContextException;
import com.interface21.web.servlet.ModelAndView;
import com.interface21.web.servlet.mvc.AbstractController;
import com.wrox.expertj2ee.ticket.boxoffice.BoxOffice;
import com.wrox.expertj2ee.ticket.exceptions.NoSuchPerformanceException;
import com.wrox.expertj2ee.ticket.referencedata.*;
import com.wrox.expertj2ee.ticket.referencedata.PriceBand;

public class BOController extends AbstractTicketController {
	

	/**
	 * @see Controller#handleRequest(HttpServletRequest, HttpServletResponse)
	 */
	protected ModelAndView handleTicketRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchPerformanceException {
		int performanceId = Integer.parseInt(request.getParameter("performanceId"));
		
		int freeSeats = getBoxOffice().getFreeSeatCount(performanceId);
		String mesg = "There are " + freeSeats + " seats free in performance " + performanceId;
		request.setAttribute("Message", mesg);
		return new ModelAndView("debugView");
	}

}

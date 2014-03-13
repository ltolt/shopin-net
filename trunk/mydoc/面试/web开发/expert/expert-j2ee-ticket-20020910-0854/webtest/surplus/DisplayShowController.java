
package surplus;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interface21.web.servlet.ModelAndView;
import com.wrox.expertj2ee.ticket.command.AvailabilityCheck;
import com.wrox.expertj2ee.ticket.exceptions.NoSuchPerformanceException;
import com.wrox.expertj2ee.ticket.referencedata.Show;

public class DisplayShowController extends AbstractTicketController {
	
	private AvailabilityCheck availabilityCheck;
	
	public void setAvailabilityCheck(AvailabilityCheck availabilityCheck) {
		this.availabilityCheck = availabilityCheck;
	}
	
	// EXPLAIN WHY NO LOGIC IN HERE
	

	/**
	 * @see Controller#handleRequest(HttpServletRequest, HttpServletResponse)
	 */
	protected ModelAndView handleTicketRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchPerformanceException {
		String showId = request.getParameter("id");
		if (showId == null) 
			return new ModelAndView("invalidRequestView");
		int id = Integer.parseInt(showId);
		
		Show s = getCalendar().getShow(id);
		s = availabilityCheck.getShowWithAvailability(s);
		request.setAttribute("show", s);
		return new ModelAndView("displayShowView");
	}

}

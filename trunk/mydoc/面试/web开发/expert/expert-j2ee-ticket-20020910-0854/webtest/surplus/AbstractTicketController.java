
package surplus;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interface21.context.ApplicationContextException;
import com.interface21.web.servlet.ModelAndView;
import com.interface21.web.servlet.mvc.AbstractController;
import com.wrox.expertj2ee.ticket.boxoffice.BoxOffice;
import com.wrox.expertj2ee.ticket.boxoffice.InvalidSeatingRequestException;
import com.wrox.expertj2ee.ticket.exceptions.NoSuchPerformanceException;
import com.wrox.expertj2ee.ticket.referencedata.Calendar;

public abstract class AbstractTicketController extends AbstractController {
	
	private BoxOffice boxOffice;
	
	private Calendar calendar;
	

	/**
	 * Gets the boxOffice.
	 * @return Returns a BoxOffice
	 */
	public BoxOffice getBoxOffice() {
		return boxOffice;
	}

	/**
	 * Sets the boxOffice.
	 * @param boxOffice The boxOffice to set
	 */
	public void setBoxOffice(BoxOffice boxOffice) {
		logger.info("Setting boxOffice to [" + boxOffice + "]");
		this.boxOffice = boxOffice;
	}
	
	/**
	 * Gets the calendar.
	 * @return Returns a Calendar
	 */
	public Calendar getCalendar() {
		return calendar;
	}

	/**
	 * Sets the calendar.
	 * @param calendar The calendar to set
	 */
	public void setCalendar(Calendar calendar) {
		this.calendar = calendar;
	}

	/**
	 * @see AbstractController#init()
	 */
	protected final void init() throws ApplicationContextException {
		if (boxOffice == null)
			throw new ApplicationContextException("Must set boxOffice bean property on " + getClass());
		if (calendar == null)
			throw new ApplicationContextException("Must set calendar bean property on " + getClass());
		ticketInit();
	}
	
	protected void ticketInit() throws ApplicationContextException {
		logger.fine("NOOP ticketInit");
	}
	
	
	/**
	 * @see Controller#handleRequest(HttpServletRequest, HttpServletResponse)
	 */
	protected final ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			return handleTicketRequest(request, response); 
		}
		catch (InvalidSeatingRequestException ex) {
			throw new ServletException("Invalid seating request", ex);
		}
		catch (NoSuchPerformanceException ex) {
			throw new ServletException("No such performance: shouldn't happen", ex);
		}
	}
	
	protected abstract ModelAndView handleTicketRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchPerformanceException, InvalidSeatingRequestException;

}

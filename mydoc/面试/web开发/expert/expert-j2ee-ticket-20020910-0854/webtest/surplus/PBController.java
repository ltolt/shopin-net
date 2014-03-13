
package surplus;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interface21.web.servlet.ModelAndView;
import com.wrox.expertj2ee.ticket.boxoffice.*;
import com.wrox.expertj2ee.ticket.boxoffice.Booking;
import com.wrox.expertj2ee.ticket.boxoffice.CreditCardAuthorizationException;
import com.wrox.expertj2ee.ticket.boxoffice.Reservation;
import com.wrox.expertj2ee.ticket.boxoffice.ReservationRequest;
import com.wrox.expertj2ee.ticket.exceptions.NoSuchPerformanceException;
import com.wrox.expertj2ee.ticket.framework.BoxOfficeFactory;

public class PBController extends AbstractTicketController {
	

	/**
	 * @see Controller#handleRequest(HttpServletRequest, HttpServletResponse)
	 */
	public ModelAndView handleTicketRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchPerformanceException {
		int performanceId = Integer.parseInt(request.getParameter("performanceId"));
		
		//PriceBand pbs[] = getBoxOffice().getPriceBands(performanceId);
		//request.setAttribute("PriceBands", pbs);
		
		//request.setAttribute("PriceBands", new Object[20]);
		
		
		BoxOfficeFactory bof = (BoxOfficeFactory) getApplicationContext().getBean("boxOfficeFactory");
		System.out.println("BOF is " + bof);
		BoxOffice bofbo = bof.getBoxOffice();
		System.out.println("bofbo is " + bofbo);
		
		System.out.println("Bofbo says free for 1 = " + bofbo.getFreeSeatCount(1));
		
		
		
//		try {
//		testReservationAndPurchaseWithAuthorizationDeclined();
//		}
//		catch (Exception ex) {
//			ex.printStackTrace();
//		}
		
//		try {
//		testReservationAndPurchase();
//		}
//		catch (Exception ex) {
//			ex.printStackTrace();
//		}
		
		return new ModelAndView("debugView");
	}
	
	
//	public void testReservationAndPurchase() throws Exception  {
//		
//		Reservation r = getBoxOffice().allocateSeats(new ReservationRequest(1, 1, 3, true, 2.5, 5));
//		//Booking b = getBoxOffice().confirmReservation("1234123412341234", "0101", r);
//
//		System.out.println(b);
//		// Match ids...
//	}
//	
//	public void testReservationAndPurchaseWithAuthorizationDeclined() throws Exception {
//		
//		
//		Reservation r = getBoxOffice().allocateSeats(new ReservationRequest(1, 1, 3, true, 2.5, 5));
//		
//		// the 666 in the card number will cause the transaction to be declined,
//		// with our dummy credit card processor
//		try {
//			Booking b = getBoxOffice().confirmReservation("1234123412341666", "0101", r);
//		}
//		catch (CreditCardAuthorizationException ex) {
//			System.out.println("Correct declined: " + ex);
//		}  
//	}

}

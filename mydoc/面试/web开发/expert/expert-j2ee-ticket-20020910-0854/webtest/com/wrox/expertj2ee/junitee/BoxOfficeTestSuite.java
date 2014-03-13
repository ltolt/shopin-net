package com.wrox.expertj2ee.junitee;


import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.sql.DataSource;
import jdbc.*;
import jdbc.TestDataSource;

import junit.framework.TestCase;

import com.interface21.jdbc.core.JdbcHelper;
import com.wrox.expertj2ee.ticket.boxoffice.*;
import com.wrox.expertj2ee.ticket.boxoffice.BoxOffice;
import com.wrox.expertj2ee.ticket.boxoffice.Reservation;
import com.wrox.expertj2ee.ticket.boxoffice.ReservationRequest;
import com.wrox.expertj2ee.ticket.boxoffice.Seat;
import com.wrox.expertj2ee.ticket.exceptions.NoSuchPerformanceException;
import com.wrox.expertj2ee.ticket.referencedata.*;
import com.wrox.expertj2ee.ticket.referencedata.PriceBand;
/**
 *
 *  ID NAME    CLASS_ID       LEFT      RIGHT
--- ----- ---------- ---------- ----------
  1 A1             2                     2
  2 A2             1          1          3
  3 A3             1          2          4
  4 A4             1          3          5
  5 A5             2          4          6
  6 A6             2          5
  7 B1             2                     8
  8 B2             1          7          9
  9 B3             1          8         10
 10 B4             1          9         11
 11 B5             2         10         12

 ID NAME    CLASS_ID       LEFT      RIGHT
--- ----- ---------- ---------- ----------
 12 B6             2         11
 * @author  rod 
 * @version 
 */
public abstract class BoxOfficeTestSuite extends TestCase {
	

//	private PerformanceSeatingStatus

	DataSource ds = new TestDataSource();
	
	JdbcHelper jh = new JdbcHelper(ds);
	
	BoxOffice boxOffice; 
	
	
	public BoxOfficeTestSuite(String name) throws Exception {
		super(name);
		
	}
	
	/** Run for each test */
	protected void setUp() throws Exception {
		this.boxOffice = newBoxOffice();
		cleanDatabase();
	}
	
	
	public void cleanDatabase() throws Exception {
		jh.getTemplate().update("update seat_status set booking_id = null");
		jh.getTemplate().update("delete from booking");
		jh.getTemplate().update("delete from purchase");
	}
	
	protected abstract BoxOffice newBoxOffice() throws Exception;

	protected void tearDown() {
	}
	
	private void testCount(int pid) throws Exception {
		int dbTotal = jh.runSQLFunction("select count(seat_id) from seat_status where performance_id=" + pid);
		assertTrue("DB says total=" + dbTotal + "; sp says " + boxOffice.getSeatCount(pid), dbTotal == boxOffice.getSeatCount(pid));
		
		int dbFree = getFreeSeats(pid);
		assertTrue("DB says free=" + dbFree + "; boxoffice says " + boxOffice.getFreeSeatCount(pid), dbFree == boxOffice.getFreeSeatCount(pid));
	}
	
	
	private int getFreeSeats(int pid) {
		return jh.runSQLFunction("select count(seat_id) " +
		"from seat_status, booking " +
		"where seat_status.performance_id = " +pid +
		"and booking.purchase_id is null " +
		"and (booking.reserved_until is null or booking.reserved_until < sysdate) " +
		"and seat_status.booking_id = booking.id(+)");
	}
	
	private int getFreeSeats(int pid, int classId) {
		return jh.runSQLFunction("select count(seat_id) from available_seats " +
		"where performance_id = " +pid +
		"and price_band_id=" + classId);
	}
	
	
//	public void testPriceBands() throws Exception {
//		int pid = 1;
//		PriceBand[] pbs = boxOffice.getPriceBands(pid);
//		assertTrue("Pricebands non-null", pbs != null);
//		assertTrue("Found > 0 pricebands", pbs.length > 0);
//		for (int i = 0; i < pbs.length; i++) {
//			boolean dbFound = jh.runSQLFunction("select count(*) from seat_status where performance_id = " + pid + " and price_band_id=" + pbs[i].getClassId()) > 0;
//			assertTrue("db says its a priceband", dbFound);
//			// CHECK PRICE!?
//		}
//		System.out.println("Passed testPriceBands...");
//	}

	public void testSeatCountForNoSuchPerformance() {
		int bogusId = 666;
		try {
			int freeSeats = boxOffice.getSeatCount(bogusId);
			fail("Shouldn't have returned seat count for bogus performance id " + bogusId);
		}
		catch (NoSuchPerformanceException ex) {
			// OK
		}
	}
	
	public void testFreeSeatsForNoSuchPerformance() {
		int bogusId = 666;
		try {
			int freeSeats = boxOffice.getFreeSeatCount(bogusId);
			fail("Shouldn't have returned seat count for bogus performance id " + bogusId);
		}
		catch (NoSuchPerformanceException ex) {
			// OK
		}
	}
	

	private void freeReservations() throws SQLException {
		System.out.println("Clearing reservations: NOT PURCHASES");
		jh.getTemplate().update("update seat_status set booking_id = null " +
				"where booking_id not in " +
				"(select id from booking where purchase_id is not null)");
	}
	
	public void testCounts() throws Exception {
		testCount(1);
		testCount(2);
	}
	
	private Reservation testAreFound(ReservationRequest sqr) throws Exception {
		// Move to caller
		
		freeReservations();
		
		int pid = 1;
		
		Reservation quote = boxOffice.allocateSeats(sqr);
		assertTrue("getContiguousSeats should never return null", quote != null);
		assertTrue("quote is or isn't reserved", quote.isReserved() == sqr.isReserve());

		Seat[] seats = quote.getSeats();
		assertTrue("Found correct number of seats", sqr.getSeatsRequested() == seats.length);
		// Test they are contiguous: should be returned from left to right
		Seat s = seats[0];
		for (int i = 1; i < seats.length; i++) {
			assertTrue("Not contiguous: " + i + "th seat " + seats[i] + " must be R of " + s, s.getRight() == seats[i].getId());
			assertTrue("Seat must be of requested class", seats[i].getSeatClassId() == sqr.getClassID());
			System.out.println(s);
			s = seats[i];
		}
		BigDecimal dbPrice = (BigDecimal) jh.runSQLFunction("select price_band.price  from price_band  where seat_class_id = " + sqr.getClassID(), BigDecimal.class);
		
		double expectedPrice = sqr.getSeatsRequested() * dbPrice.doubleValue() + sqr.getBookingFee();
		assertTrue("Expected price to be " + expectedPrice + ", not " + quote.getTotalPrice(),expectedPrice == quote.getTotalPrice());
		
		System.out.println("passed testAreFound with [" + sqr + "]...");
		return quote;
	}
	
	// Must return l to right
	public void testAreFound() throws Exception {
		
		freeReservations();
		
		testAreFound(new ReservationRequest(1, 1, 1, false, 0, 5));
		testAreFound(new ReservationRequest(1, 1, 2, false, 3.75, 5));
		testAreFound(new ReservationRequest(1, 1, 3, false, 1.25, 5));
		testAreFound(new ReservationRequest(1, 2, 1, false, 2.5, 5));
		Reservation r = testAreFound(new ReservationRequest(1, 1, 2, false, 2.5, 5));
		assertTrue("reservation isn't reserved",!r.isReserved());
	} 
	
	public void testReservation() throws Exception {
		
		freeReservations();
		
		Reservation r = testAreFound(new ReservationRequest(1, 1, 3, true, 2.5, 5));
		assertTrue("reservation is reserved",r.isReserved());
		
		int[] dbreserved = jh.getIDs("select seat_id from seat_status where booking_id=" + r.getReference(), null);
		checkIdsMatch(r, dbreserved);
		checkBookingPrice(r);
	}
	
	private void checkIdsMatch(Reservation r, int[] ids) throws Exception {
		assertTrue("reserved or sold enough seats", ids.length == r.getQuoteRequest().getSeatsRequested());
		List idslist = new LinkedList();
		for (int i = 0; i < ids.length; i++)
			idslist.add(new Integer(ids[i]));
		for (int i = 0; i < r.getSeats().length; i++) {
			Integer seatId = new Integer(r.getSeats()[i].getId());
			if (! idslist.contains(seatId))
				throw new Exception("Seat " + seatId + " in reservation wasn't found in database");
		}
	}
	
	private void checkBookingPrice(Reservation r) {
		double dbPrice = ((BigDecimal) jh.runSQLFunction("select price from booking where id=" + r.getReference(), Double.class)).doubleValue();
		assertTrue("booking price is correct", dbPrice == r.getTotalPrice());
	}
	
	public void testReservationAndPurchase() throws Exception {
		
		freeReservations();
		Reservation r = testAreFound(new ReservationRequest(1, 1, 3, true, 2.5, 5));
		
		int[] dbreserved = jh.getIDs("select seat_id from seat_status where booking_id=" + r.getReference(), null);
		assertTrue("reserved enough seats", dbreserved.length == r.getQuoteRequest().getSeatsRequested());
		
		Booking b = boxOffice.confirmReservation("1234123412341234", "0101", r);
		
		assertTrue("Booking succeeded and returned non-null", b != null);
		assertTrue("Authorization code is non null", b.getAuthorizationCode() != null);
		
		int purchaseId = jh.runSQLFunction("select id from purchase where authorization_code='" + b.getAuthorizationCode() + "'");
		System.out.println("Purchase id = " + purchaseId);
		int[] dbbooked = jh.getIDs("select seat_id from seat_status, booking where booking.purchase_id = ? and seat_status.booking_id = booking.id", new Integer[] { new Integer(purchaseId) });
		checkIdsMatch(b.getReservation(), dbbooked);
		checkBookingPrice(b.getReservation());
	}
	
	
	public void testReservationAndPurchaseWithAuthorizationDeclined() throws Exception {
		
		freeReservations();
		
		Reservation r = testAreFound(new ReservationRequest(1, 1, 3, true, 2.5, 5));
		
		int[] dbreserved = jh.getIDs("select seat_id from seat_status where booking_id=" + r.getReference(), null);
		assertTrue("reserved enough seats", dbreserved.length == r.getQuoteRequest().getSeatsRequested());
		
		// the 666 in the card number will cause the transaction to be declined,
		// with our dummy credit card processor
		try {
			Booking b = boxOffice.confirmReservation("1234123412341666", "0101", r);
		}
		catch (CreditCardAuthorizationException ex) {
			// OK
		}
		
		// Check there's no purchase
		// REALLY NEED TO CHECK THAT RESERVATION WAS ROLLED BACK...
	
		int purchases = jh.runSQLFunction("select count(purchase_id) from booking where id=" + r.getReference());
		assertTrue("no purchases were made", purchases == 0);
		// Match ids...
	}
	
//	
//	private void testAreNotFoundContiguous(int requestedClass, int howMany) throws Exception {
//		ClassSeatingStatus ss = sp.newSeatingStatus(requestedClass);
//		try {
//			ss.getContiguousSeats(howMany);
//			fail("Shouldn't have found " + howMany + " seats in class " + requestedClass);
//		}
//		catch (NotEnoughSeatsException ex) {
//			assertTrue("asked for", ex.getRequested() == howMany);
//			assertTrue(ex.getClassId() == requestedClass);
//		}	
//	}
//	
//	public void testAreNotFoundContiguous() throws Exception {
//		testAreNotFoundContiguous(1, 4);
//		testAreNotFoundContiguous(2, 3);
//	} 
	
	public void testRequestMoreThanInHall() throws Exception {
		int request = 10000;
		try {
			ReservationRequest rr = new ReservationRequest(1, 1, request, false, 2.5, 5);
			boxOffice.allocateSeats(rr);
			fail("allocateSeats should never find more seats than in hall");
		}
		catch (NotEnoughSeatsException ex) {
			// Correct
			int dbCount = getFreeSeats(1, 1);
			assertTrue("Expected poss=" + dbCount + ", not " + ex.getPossible(), ex.getPossible() == dbCount);
			assertTrue("Expected howMany=" + request + ", not " + ex.getRequested(), ex.getRequested() == request);
		}
	}
	
	
	public void testRequestInvalidClass() throws Exception {
		int request = 1;
		try {
			ReservationRequest rr = new ReservationRequest(1, 100, request, false, 2.5, 5);
			boxOffice.allocateSeats(rr);
			fail("allocateSeats should never find seats in invalid class");
		}
		catch (InvalidSeatingRequestException ex) {
			// Correct
		}
	}
	
	
//	public void testRequestMoreThanInRow() throws Exception {
//		SeatingStatus ss = sp.newSeatingStatus(allIds);
//		try {
//			ss.getContiguousSeats(9);
//			fail("getContiguousSeats should never find more seats than in row");
//		}
//		catch (NotEnoughContiguousSeatsException ex) {
//			// Correct
//			assertTrue("Expected poss=" + 8 + ", not " + ex.getPossible(), ex.getPossible() == 8);
//			assertTrue("Expected howMany=" + 9, ex.getRequested() == 9);
//		}
//	}
//	
//	
	public void testRequest0Seats() throws Exception {
		int request = 0;
		try {
			ReservationRequest rr = new ReservationRequest(1, 1, 0, false, 2.5, 5);
			boxOffice.allocateSeats(rr);
			fail("allocateSeats should never try to allocate 0 seats");
		}
		catch (InvalidSeatingRequestException ex) {
			// Correct
		}
	}
	
	
	public void testRequestSeatsInInvalidPerformance() throws Exception {
		int request = 1;
		try {
			ReservationRequest rr = new ReservationRequest(11111, 1, 1, false, 2.5, 5);
			boxOffice.allocateSeats(rr);
			fail("allocateSeats should never try to allocate seats in bogus performance");
		}
		catch (NoSuchPerformanceException ex) {
			// Correct
		}
	}
	

	
//	public void testRequestMoreThanInClass() throws Exception {
//		try {
//			sp.getContiguousSeats(1, seats.length + 1);
//			fail("getContiguousSeats should never find more seats than in hall");
//		}
//		catch (NotEnoughSeatsException ex) {
//			// Correct
//		}
//	}
	

}
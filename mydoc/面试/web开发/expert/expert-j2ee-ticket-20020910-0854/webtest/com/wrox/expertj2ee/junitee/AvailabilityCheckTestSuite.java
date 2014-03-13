
package com.wrox.expertj2ee.junitee;

import javax.sql.DataSource;
import jdbc.*;
import jdbc.TestDataSource;

import java.util.Date;
import java.util.List;

import com.interface21.beans.factory.InitializingBean;
import com.interface21.jdbc.core.JdbcHelper;
import com.interface21.jdbc.core.JdbcTemplate;
import com.wrox.expertj2ee.ticket.boxoffice.BoxOffice;
import com.wrox.expertj2ee.ticket.command.AvailabilityCheck;
import com.wrox.expertj2ee.ticket.command.PerformanceWithAvailability;
import com.wrox.expertj2ee.ticket.command.PriceBandWithAvailability;
import com.wrox.expertj2ee.ticket.command.support.CachingAvailabilityCheck;
import com.wrox.expertj2ee.ticket.referencedata.*;
import com.wrox.expertj2ee.ticket.referencedata.Calendar;
import com.wrox.expertj2ee.ticket.referencedata.Genre;
import com.wrox.expertj2ee.ticket.referencedata.Performance;
import com.wrox.expertj2ee.ticket.referencedata.ReferenceDataException;
import com.wrox.expertj2ee.ticket.referencedata.Show;
import com.wrox.expertj2ee.ticket.referencedata.jdbc.JdbcCalendar;


import junit.framework.TestCase;

public class AvailabilityCheckTestSuite extends TestCase {
	
	DataSource ds = new TestDataSource();
	
	JdbcHelper jh = new JdbcHelper(ds);
	
	AvailabilityCheck avail;
	
	Calendar calendar;

	/**
	 * Constructor for CalendarTestSuite.
	 * @param arg0
	 */
	public AvailabilityCheckTestSuite(String arg0) {
		super(arg0);
	}
	
	

	/**
	 * @see TestCase#setUp()
	 */
	protected void setUp() throws Exception {
		this.calendar = new JdbcCalendar(ds);
		((InitializingBean) calendar).afterPropertiesSet();
		BoxOffice bo = BoxOfficeTxTestSuite.createBoxOfficeEjb(this);
		CachingAvailabilityCheck cavail = new CachingAvailabilityCheck();
		cavail.setBoxOffice(bo);
		cavail.setCalendar(calendar);
		cavail.afterPropertiesSet();
		this.avail = cavail;
	}
	
	
	
	public void testShows() throws Exception {
		testShow(1);
	}
	
	private void testShow(int sid) throws Exception {
		Show s = calendar.getShow(sid);
		Show sa = avail.getShowWithAvailability(s);
		List l = s.getPerformances();
		for (int i = 0; i < l.size(); i++) {
			Performance p = (Performance) s.getPerformances().get(i);
			PerformanceWithAvailability pa = (PerformanceWithAvailability)sa.getPerformances().get(i);
			assertTrue("ids match", pa.getId() == p.getId());
			assertTrue("price band count matches", pa.getPriceBands().size() == p.getPriceBands().size());
			int count = 0;
			for (int pb = 0; pb < p.getPriceBands().size(); pb++) {
				PriceBand prb = (PriceBand) p.getPriceBands().get(pb);
				PriceBandWithAvailability pba = (PriceBandWithAvailability) pa.getPriceBands().get(pb);
				assertTrue("Same pb id ", prb.getId() == pba.getId());
				count += pba.getFreeSeats();
			}
			assertTrue("counts must add up", count == pa.getFreeSeats());
			System.out.println("count was " + count);
		}
		
	}

}

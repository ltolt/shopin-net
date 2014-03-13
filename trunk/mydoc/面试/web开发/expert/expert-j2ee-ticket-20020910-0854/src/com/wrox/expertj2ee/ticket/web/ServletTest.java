package com.wrox.expertj2ee.ticket.web;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import com.interface21.beans.factory.BeanFactory;
import com.interface21.jndi.JndiServices;
import com.interface21.web.servlet.FrameworkServlet;
import com.wrox.expertj2ee.ticket.boxoffice.BoxOffice;
import com.wrox.expertj2ee.ticket.boxoffice.ejb.BoxOfficeHome;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import org.apache.cactus.ServletTestCase;


/**
 * Still crashes in Cactus
 */
public class ServletTest extends TestCase {
	
	private BoxOffice boxOffice;

	/**
	 * Constructor for CactusTest.
	 * @param arg0
	 */
	public ServletTest(String arg0) {
		super(arg0);
	}

	public static Test suite() {
		return new TestSuite(CactusTest.class);
	}

	public void setUp() throws Exception {
		Context ctx = new InitialContext();
		BoxOfficeHome home =
			(BoxOfficeHome) ctx.lookup("java:comp/env/ejb/BoxOffice");
		this.boxOffice = home.create();
	}

	public void testCounts() throws Exception {
		int all = boxOffice.getSeatCount(1);
		int free = boxOffice.getFreeSeatCount(1);
		assertTrue("all > o", all > 0);
		assertTrue("all > free", all >= free);
	}
	
	
	

}
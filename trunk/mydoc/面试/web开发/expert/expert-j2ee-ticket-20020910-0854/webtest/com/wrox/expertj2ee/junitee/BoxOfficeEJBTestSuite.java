package com.wrox.expertj2ee.junitee;

import javax.naming.InitialContext;
import junit.framework.TestCase;

import com.wrox.expertj2ee.ticket.boxoffice.BoxOffice;
import com.wrox.expertj2ee.ticket.boxoffice.ejb.BoxOfficeHome;

/**
 *
 *  ID NAME    CLASS_ID       LEFT      RIGHT
     11
 * @author  rod 
 * @version 
 */
public class BoxOfficeEJBTestSuite extends TestCase {
	
	BoxOffice bo;
	
	
	public BoxOfficeEJBTestSuite(String name) throws Exception {
		super(name);
		
		bo = newBoxOffice();
	}

	
	protected BoxOffice newBoxOffice() throws Exception {
		InitialContext ctx = new InitialContext();
		BoxOfficeHome boh = (BoxOfficeHome) ctx.lookup("java:comp/env/ejb/BoxOffice");
		System.out.println("Located box office home: " + boh);
		return boh.create();
	}

	protected void tearDown() {
	}
	
	public void testGotHome() {
		assertTrue("bo non null", bo != null);
		System.out.println(bo);
	}

}
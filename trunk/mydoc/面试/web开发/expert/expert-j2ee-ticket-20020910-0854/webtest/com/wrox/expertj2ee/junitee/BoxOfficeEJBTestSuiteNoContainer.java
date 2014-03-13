package com.wrox.expertj2ee.junitee;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.naming.spi.NamingManager;
import javax.sql.DataSource;
import jdbc.*;
import jdbc.TestDataSource;

import java.sql.Connection;


import junit.framework.TestCase;
import mo.ejb.MockCmtEJBSessionContext;
import mo.ejb.MockInitialContextFactoryBuilder;

import com.interface21.jdbc.core.SingleConnectionDataSource;
import com.wrox.expertj2ee.ticket.boxoffice.BoxOffice;
import com.wrox.expertj2ee.ticket.boxoffice.ejb.BoxOfficeEJB;
import com.wrox.expertj2ee.ticket.boxoffice.ejb.BoxOfficeHome;

/**
 *
 *  ID NAME    CLASS_ID       LEFT      RIGHT
     11
 * @author  rod 
 * @version 
 */
public class BoxOfficeEJBTestSuiteNoContainer extends BoxOfficeTestSuite {

	static {
		try {
			NamingManager.setInitialContextFactoryBuilder(new MockInitialContextFactoryBuilder());
		}
		catch (NamingException e) {
			e.printStackTrace();
			System.exit(1);
		}

	}
 
	public BoxOfficeEJBTestSuiteNoContainer(String name) throws Exception {
		super(name);

	}

	protected BoxOffice newBoxOffice() throws Exception {
		Connection conn = new TestDataSource().getConnection();
		//conn.setAutoCommit(false);
		//SingleConnectionDataSource testDs = new SingleConnectionDataSource(conn);
		TestDataSource testDs = new TestDataSource();
		MockInitialContextFactoryBuilder.bind("java:comp/env/jdbc/ticket-ds", testDs);
		MockInitialContextFactoryBuilder.bind("java:comp/env/beans.dao.class", "com.wrox.expertj2ee.ticket.boxoffice.support.Oracle8JdbcSeatingPlanDAO");
		MockCmtEJBSessionContext sc = new MockCmtEJBSessionContext(true);

		BoxOfficeEJB bob = new BoxOfficeEJB();
		bob.setSessionContext(sc);
		bob.ejbCreate();

		return bob;
	}

	protected void tearDown() {
	}

}
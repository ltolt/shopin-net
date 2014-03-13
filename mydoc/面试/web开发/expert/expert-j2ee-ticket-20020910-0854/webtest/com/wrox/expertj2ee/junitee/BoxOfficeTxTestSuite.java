package com.wrox.expertj2ee.junitee;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.naming.spi.NamingManager;
import javax.sql.DataSource;
import jdbc.*;
import jdbc.TestDataSource;

import java.lang.reflect.Proxy;
import java.sql.Connection;


import junit.framework.TestCase;
import mo.ejb.MockCmtEJBSessionContext; 
import mo.ejb.MockInitialContextFactoryBuilder;

import com.interface21.jdbc.core.SingleConnectionDataSource;
import com.interface21.jta.SingleConnectionTransactionProxy;
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
public class BoxOfficeTxTestSuite extends BoxOfficeTestSuite {

	static {
		try {
			NamingManager.setInitialContextFactoryBuilder(new MockInitialContextFactoryBuilder());
		}
		catch (NamingException e) {
			e.printStackTrace();
			System.exit(1);
		}

	}

	public BoxOfficeTxTestSuite(String name) throws Exception {
		super(name);

	}

	protected BoxOffice newBoxOffice() throws Exception {
		return createBoxOfficeEjb(this);
	}
	
	static BoxOffice createBoxOfficeEjb(Object o) throws Exception {
		Connection conn = new TestDataSource().getConnection();
		
		SingleConnectionDataSource testDs = new SingleConnectionDataSource(conn);
		MockInitialContextFactoryBuilder.bind("java:comp/env/jdbc/ticket-ds", testDs);
		MockInitialContextFactoryBuilder.bind("java:comp/env/beans.dao.class", 
			"com.wrox.expertj2ee.ticket.boxoffice.support.jdbc.OracleJdbcBoxOfficeDAO");
		MockInitialContextFactoryBuilder.bind("java:comp/env/beans.creditCardProcessor.class",
			"com.wrox.expertj2ee.ticket.boxoffice.support.DummyCreditCardProcessor");
		MockCmtEJBSessionContext sc = new MockCmtEJBSessionContext(true);

		BoxOfficeEJB bob = new BoxOfficeEJB();
		bob.setSessionContext(sc);
		bob.ejbCreate();
 
		SingleConnectionTransactionProxy proxy = new SingleConnectionTransactionProxy(bob, conn);
		proxy.addTransactionalMethod("allocateSeats");
		proxy.addTransactionalMethod("reserve");
		return (BoxOffice) Proxy.newProxyInstance(o.getClass().getClassLoader(), new Class[] { BoxOffice.class} , proxy);
	} 

	protected void tearDown() {
	}

}
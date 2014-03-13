package com.wrox.expertj2ee.junitee;


import com.interface21.context.ApplicationContext;
import com.interface21.web.context.support.WebApplicationContextUtils;
import com.interface21.jdbc.core.JdbcHelper;
import com.wrox.expertj2ee.ticket.boxoffice.BoxOffice;
import com.wrox.expertj2ee.ticket.boxoffice.ejb.BoxOfficeEJB; 

/**
 * RUNS IN WEB CONTAINER
 * @author  rod 
 * @version 
 */
public class BoxOfficeBeanTestSuite extends BoxOfficeTestSuite {

	private ApplicationContext ac;
	
	//private BoxOffice bo;
	
	public BoxOfficeBeanTestSuite(String name) throws Exception {
		super(name);
	}
	

	
	protected BoxOffice newBoxOffice() throws Exception {
		ac = TestServlet.getContextForServlet("ticket");
		BoxOffice bo = (BoxOffice) ac.getBean("boxOffice");
		if (bo == null)
			throw new Exception("No 'boxOffice' bean definition in application context [" + ac + "]");
		return bo;
	}

	protected void tearDown() {
	}
	

}
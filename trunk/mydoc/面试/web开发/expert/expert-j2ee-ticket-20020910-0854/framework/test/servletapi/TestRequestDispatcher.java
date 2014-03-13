package servletapi;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rod Johnson
 * @version $RevisionId$
 */
public class TestRequestDispatcher implements RequestDispatcher {
	
	private String url;

	/** Creates new TestRequestDispatcher */
    public TestRequestDispatcher(String url) {
		this.url = url;
    }

	public void forward(javax.servlet.ServletRequest servletRequest, javax.servlet.ServletResponse servletResponse) throws javax.servlet.ServletException, java.io.IOException {
		System.out.println("RequestDispatcher -- FORWARDING to [" + url + "]");
	}
	
	public void include(javax.servlet.ServletRequest servletRequest, javax.servlet.ServletResponse servletResponse) throws javax.servlet.ServletException, java.io.IOException {
		System.out.println("RequestDispatcher -- INCLUDING [" + url + "]");
	}
	
}	// class TestRequestDispatcher

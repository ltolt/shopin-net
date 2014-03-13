package servletapi;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rod Johnson
 * @version $RevisionId$
 */
public class TestHttpResponse implements HttpServletResponse {
	
	private HashMap headers = new HashMap();
	
	private Locale locale;
	
	private int bufsize = 12096;
	
	private int status = HttpServletResponse.SC_OK;

	/** Creates new TestHttpResponse */
    public TestHttpResponse() {
    }

	public boolean containsHeader(java.lang.String str) {
		return headers.get(str) != null;
	}
	
	public java.lang.String encodeUrl(java.lang.String str) {
		throw new UnsupportedOperationException("encodeUrl");
	}
	
	public void setHeader(java.lang.String str, java.lang.String str1) {
		headers.put(str, str1);
	}
	
	public Locale getLocale() {
		return locale;
	}
	
	public void flushBuffer() throws java.io.IOException {
	}
	
	public void addCookie(javax.servlet.http.Cookie cookie) {
	}
	
	public void sendError(int param) throws java.io.IOException {
	}
	
	public int getBufferSize() {
		return bufsize;
	}
	
	public void addDateHeader(java.lang.String str, long param) {
	}
	
	public void setLocale(Locale locale) {
		this.locale = locale;
	}
	
	public void setBufferSize(int param) {
		this.bufsize = param;
	}
	
	public java.lang.String encodeRedirectURL(java.lang.String str) {
		throw new UnsupportedOperationException("encodeRedirectUrl");
	}
	
	public void setStatus(int param, java.lang.String str) {
		this.status = param;
	}
	
	public java.io.PrintWriter getWriter() throws java.io.IOException {
		return new java.io.PrintWriter(System.out);
	}
	
	public boolean isCommitted() {
		return false;
	}
	
	public java.lang.String getCharacterEncoding() {
		throw new UnsupportedOperationException("getCharacterEncoding");
	}
	
	public void setDateHeader(java.lang.String str, long param) {
		headers.put(str, "" + param);
	}
	
	public javax.servlet.ServletOutputStream getOutputStream() throws java.io.IOException {
		throw new UnsupportedOperationException("getOutputStream");
	}
	
	public void addIntHeader(java.lang.String str, int param) {
	}
	
	public java.lang.String encodeRedirectUrl(java.lang.String str) {
		throw new UnsupportedOperationException("encodeRedirectUrl");
	}
	
	public void setIntHeader(java.lang.String str, int param) {
	}
	
	public void setContentType(java.lang.String str) {
	}
	
	public void setContentLength(int param) {
	}
	
	public java.lang.String encodeURL(java.lang.String str) {
		throw new UnsupportedOperationException("encodeUrl");
	}
	
	public void sendRedirect(java.lang.String str) throws java.io.IOException {
		System.out.println(">>>>>>>>>>>>>>> request.sendRedirect to [" + str + "]");
	}
	
	public void reset() {
	}
	
	public void addHeader(java.lang.String str, java.lang.String str1) {
	}
	
	public void sendError(int param, java.lang.String str) throws java.io.IOException {
		this.status = param;
	}
	
	public void setStatus(int param) {
		this.status = param;
	}
	
	public void resetBuffer() {
	}
	
	
	
	public int getStatusCode() {
		return status;
	}
	
}	// class TestHttpResponse

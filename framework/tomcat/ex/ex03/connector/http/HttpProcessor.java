/**
 * @Probject Name: framework
 * @Path: ex.ex03.connector.httpHttpProcessor.java
 * @Create By kimi
 * @Create In 2013年9月10日 上午12:24:38
 * TODO
 */
package ex.ex03.connector.http;

import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;

import org.apache.catalina.util.StringManager;

/**
 * @Class Name HttpProcessor
 * @Author kimi
 * @Create In 2013年9月10日
 */
public class HttpProcessor {

	public HttpProcessor(HttpConnector connector) {
	    this.connector = connector;
	  }
	
	/**
	   * The HttpConnector with which this processor is associated.
	   */
	  private HttpConnector connector = null;
	  private HttpRequest request;
	  private HttpRequestLine requestLine = new HttpRequestLine();
	  private HttpResponse response;

	  protected String method = null;
	  protected String queryString = null;

	  /**
	   * The string manager for this package.
	   */
	  protected StringManager sm =
	    StringManager.getManager("ex03.pyrmont.connector.http");
	
	  public void process(Socket socket){
		  SocketInputStream input  = null;
		  OutputStream output = null;
		  try {
			input = new SocketInputStream(socket.getInputStream(), 2048);
			  output = socket.getOutputStream();

			  
		  
		  } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
	  }

}

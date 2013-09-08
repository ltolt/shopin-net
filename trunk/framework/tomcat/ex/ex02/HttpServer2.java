/**
 * @Probject Name: framework
 * @Path: ex.ex02HttpServer2.java
 * @Create By kimi
 * @Create In 2013年9月8日 下午9:42:51
 * TODO
 */
package ex.ex02;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;

/**
 * @Class Name HttpServer2
 * @Author kimi
 * @Create In 2013年9月8日
 */
public class HttpServer2 {

	private static final String SHUT_DOWN = "/shutdown";
	
	//the shutdown command received
	private boolean shutdown;
	
	public void await(){
		ServerSocket serverSocket = null;
		int port = 8080;
		try {
			serverSocket = new ServerSocket(port, 10, InetAddress.getByName("127.0.0.1"));
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			System.exit(1);
		}
		//loop wait for a request
		while(!shutdown){
			Socket socket = null;
			InputStream input  = null;
			OutputStream output = null;
			try {
				socket = serverSocket.accept();
				input = socket.getInputStream();
				output = socket.getOutputStream();
				//create Request object and parse
				Request request = new Request(input);
				request.parse();
				//create response object
				Response response = new Response(output);
				response.setRequest(request);
				// check if this is a request for a servlet or // a static resource // a request for a servlet begins with "/servlet/"
				if(request.getUri().startsWith("/servlet/")){
					ServletProcesser2 processor = new ServletProcesser2();
					processor.process(request, response);
				}else{
					StaticResourceProcessor processor = new StaticResourceProcessor();
					processor.process(request, response);
				}
				//close the socket
				socket.close();
				//check if the previous uri is a shutdown command
				shutdown = request.getUri().equals(SHUT_DOWN);
			} catch (IOException e) {
				e.printStackTrace();
				System.exit(1);
			}
			
		}
		
		
	}

	/**
	 * @Methods Name main
	 * @Create In 2013-8-30 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		HttpServer2 server = new HttpServer2();
		server.await();
		
	}


}

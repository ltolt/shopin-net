/**
 * @Probject Name: framework
 * @Path: ex.ex01.HttpServer.java
 * @Create By kongm
 * @Create In 2013-8-23 上午11:01:22
 * TODO
 */
package ex.ex01;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;

/**
 * @Class Name HttpServer
 * @Author kongm
 * @Create In 2013-8-23
 */
public class HttpServer {
	 /** WEB_ROOT is the directory where our HTML and other files reside.
	   *  For this package, WEB_ROOT is the "webroot" directory under the working
	   *  directory.
	   *  The working directory is the location in the file system
	   *  from where the java command was invoked.
	   */
	public static final String WEB_ROOT = System.getProperty("user.dir") + 
			File.separator + "WebRoot";
	private static final String SHUTDOWN_COMMAND = "/SHUTDOWN";
	//the shutdown command received
	private boolean shutdown;
	
	public static void main(String[] args) {
		HttpServer server = new HttpServer();
		System.out.println(WEB_ROOT);
		System.out.println(System.getProperty("user.dir"));
		server.await();
	}
	
	
	public void await(){
		ServerSocket serverSocket = null;
		int port = 8080;
		try {
			serverSocket = new ServerSocket(port,1,InetAddress.getByName("127.0.0.1"));
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			System.exit(1);
		}
		//Loop waiting for a request
		while(!shutdown){
			Socket socket = null;
			InputStream input = null;
			OutputStream output = null;
			try {
				socket = serverSocket.accept();
				System.out.println(socket.getPort());
				input = socket.getInputStream();
				output = socket.getOutputStream();
				//create request object and parse
				Request request = new Request(input);
				request.parse();
				Response response = new Response(output);
				response.setRequest(request);
				response.sendStaticResource();
				//close the socket
				socket.close();
				//check if the previous URI is a shutdown command
				shutdown = request.getUri().equals(SHUTDOWN_COMMAND);
			} catch (IOException e) {
				e.printStackTrace();
				continue;
			}
		}
		
	}
	
	

}

/**
 * @Probject Name: framework
 * @Path: ex.ex02.HttpServer1.java
 * @Create By kongm
 * @Create In 2013-8-30 下午12:05:14
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
 * @Class Name HttpServer1
 * @Author kongm
 * @Create In 2013-8-30
 */
public class HttpServer1 {
	
	private static final String SHUT_DOWN = "/shutdown";
	//the shutdown command received
	private boolean shutdown;
	
	public void await(){
		ServerSocket serverSocket = null;
		int port = 8080;
		try {
			serverSocket = new ServerSocket(port, 1, InetAddress.getByName("127.0.0.1"));
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
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		
	}

	/**
	 * @Methods Name main
	 * @Create In 2013-8-30 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		HttpServer1 server = new HttpServer1();
		server.await();
		
	}

}

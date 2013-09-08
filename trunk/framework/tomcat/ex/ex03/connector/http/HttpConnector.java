/**
 * @Probject Name: framework
 * @Path: ex.ex03.connector.httpHttpConnector.java
 * @Create By kimi
 * @Create In 2013年9月9日 上午12:06:23
 * TODO
 */
package ex.ex03.connector.http;

import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;

/**
 * @Class Name HttpConnector
 * @Author kimi
 * @Create In 2013年9月9日
 */
public class HttpConnector implements Runnable {
	
	boolean stopped;
	private String scheme = "http";
	
	public String getScheme(){
		return scheme;
	}
	
	public void start(){
		Thread thread = new Thread(this);
		thread.start();
	}
	

	/* (non-Javadoc)
	 * @see java.lang.Runnable#run()
	 */
	@Override
	public void run() {
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
		while(!stopped){
			//accept the next incoming connection from the server socket
			Socket socket = null;
			try {
				socket = serverSocket.accept();
			} catch (IOException e) {
				e.printStackTrace();
				continue;
			}
			
			
			
			
			
			
			
			
			
		}
		

	}

}

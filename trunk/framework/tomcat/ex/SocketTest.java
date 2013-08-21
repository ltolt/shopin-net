/**
 * @Probject Name: framework
 * @Path: ex.SocketTest.java
 * @Create By kongm
 * @Create In 2013-8-21 下午2:42:47
 * TODO
 */
package ex;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

/**
 * @Class Name SocketTest
 * @Author kongm
 * @Create In 2013-8-21
 */
public class SocketTest {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-21 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		try {
			Socket socket = new Socket("172.16.103.145",80);
			OutputStream os = socket.getOutputStream();
			boolean autoflush = true;
			PrintWriter out = new PrintWriter(socket.getOutputStream(),autoflush);
			BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			//send an http request to the web server
			out.println("GET /index.html HTTP/1.1");
			out.println("Host:172.16.103.145:80");
			out.println("Connection: Close");
			out.println();
			//read the response
			boolean loop = true;
			StringBuffer sb = new StringBuffer(8096);
			while(loop){
				if(in.ready()){
					int i = 0;
					while(i!=-1){
						i = in.read();
						sb.append((char)i);
					}
					loop = false;
				}
				Thread.currentThread().sleep(50);
			}
			//display the response to the out console
			System.out.println(sb.toString());
			socket.close();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		

	}

}

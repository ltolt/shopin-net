/**
 * @Probject Name: framework
 * @Path: exp.handler.EchoInputTryCatchFinally.java
 * @Create By kongm
 * @Create In 2013-8-8 ÉÏÎç10:39:36
 * TODO
 */
package exp.handler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * @Class Name EchoInputTryCatchFinally
 * @Author kongm
 * @Create In 2013-8-8
 */
public class EchoInputTryCatchFinally {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-8 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		System.out.println("Enter text to echo");
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader inputReader = new BufferedReader(isr);
		try {
			String line = inputReader.readLine();
			System.out.println("READ: " + line);
		} catch (IOException e) {
			System.out.println("Exception encountered : " + e);
		}finally{
			System.out.println("My Job here is done.");
		}
		
		
		

	}

}

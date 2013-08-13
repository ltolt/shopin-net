/**
 * @Probject Name: framework
 * @Path: base.framework.exp.ExceptionTest.java
 * @Create By kongm
 * @Create In 2013-8-8 ÏÂÎç1:35:47
 * TODO
 */
package base.framework.exp;

import java.io.IOException;

/**
 * @Class Name ExceptionTest
 * @Author kongm
 * @Create In 2013-8-8
 */
public class ExceptionTest {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-8 By kongm
	 * @param args void
	 * @throws Throwable 
	 */
	public static void main(String[] args) throws Throwable {
		try {
			throw new IOException("IO Test");
		} catch (IOException e) {
			throw new Exception("Exe");
			//throw new Exception("Exe").initCause(e);
			//throw new Exception(e);
		}
		
		

	}

}

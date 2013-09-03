/**
 * @Probject Name: framework
 * @Path: ex.ex02.StaticResourceProcessor.java
 * @Create By kongm
 * @Create In 2013-9-2 上午10:36:42
 * TODO
 */
package ex.ex02;

import java.io.IOException;

/**
 * @Class Name StaticResourceProcessor
 * @Author kongm
 * @Create In 2013-9-2
 */
public class StaticResourceProcessor {
	public void process(Request request,Response response){
		try {
			response.sendStaticResource();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

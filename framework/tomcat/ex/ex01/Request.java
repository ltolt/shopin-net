/**
 * @Probject Name: framework
 * @Path: ex.ex01.Request.java
 * @Create By kongm
 * @Create In 2013-8-23 上午10:48:03
 * TODO
 */
package ex.ex01;

import java.io.IOException;
import java.io.InputStream;

/**
 * @Class Name Request
 * @Author kongm
 * @Create In 2013-8-23
 */
public class Request {
	
	private InputStream input;
	private String uri;
	public Request(InputStream input) {
		super();
		this.input = input;
	}
	
	
	public void parse(){
		// Read a set of characters from the socket
		StringBuffer request = new StringBuffer(2048);
		int i ;
		byte[] buffer = new byte[2048];
		try {
			i = input.read(buffer);
		} catch (IOException e) {
			e.printStackTrace();
			i = -1;
		}
		for(int j = 0 ; j < i;j++){
			request.append((char)buffer[j]);
		}
		System.out.println(request.toString());
		uri = parseUri(request.toString());
		
	}


	public String parseUri(String request) {
		int index1,index2;
		index1 = request.indexOf(' ');
		if(index1 != -1){
			index2 = request.indexOf(' ',index1 + 1);
			if(index2 > index1)
				return request.substring(index1 +1, index2);
			
		}
		return null;
	}


	public String getUri() {
		return uri;
	}
	
	
	
	
	
	
	
	

}

/**
 * @Probject Name: spring
 * @Path: net.shopin.util.FileUploader.java
 * @Create By kongm
 * @Create In 2013-11-28 上午10:33:58
 * TODO
 */
package net.shopin.util;

import org.springframework.core.io.FileSystemResource;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

/**
 * @Class Name FileUploader
 * @Author kongm
 * @Create In 2013-11-28
 */
public class FileUploader {

	/**
	 * @Methods Name main
	 * @Create In 2013-11-28 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		if(args.length == 0){
			System.out.println("usage: requiring the name of a file to upload");
			System.exit(1);
		}
		RestTemplate template = new RestTemplate();
		MultiValueMap<String,Object> parts = new LinkedMultiValueMap<String, Object>();
		parts.add("name", args[0]);
		parts.add("file", new FileSystemResource(args[0]));
		String response = template.postForObject("http://localhost:8080/upload", parts, String.class);
		System.out.println(response);	

	}

}

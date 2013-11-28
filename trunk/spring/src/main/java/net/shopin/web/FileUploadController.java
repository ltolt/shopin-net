/**
 * @Probject Name: spring
 * @Path: net.shopin.web.FileUploadController.java
 * @Create By kongm
 * @Create In 2013-11-28 上午10:15:09
 * TODO
 */
package net.shopin.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Class Name FileUploadController
 * @Author kongm
 * @Create In 2013-11-28
 */
@Controller
public class FileUploadController {

	@RequestMapping(value = "/upload",method = RequestMethod.GET)
	public @ResponseBody String provideUploadInfo(){
		return "You can upload a file by posting to this same url";
	}
	
	@RequestMapping(value = "/upload",method = RequestMethod.POST)
	public @ResponseBody String handleFileUpload(@RequestParam("name") String name,@RequestParam("file")MultipartFile file){
		if(!file.isEmpty()){
			try {
				byte[] bytes = file.getBytes();
				BufferedOutputStream stream = 
						new BufferedOutputStream(new FileOutputStream(new File(name + "-upload")));
				stream.write(bytes);
				stream.close();
				return "You successfuly upload " + name + " into " + name + "-upload!";
			} catch (FileNotFoundException e) {
				return "You failed to upload " + name + "==>" + e.getMessage();
			} catch (IOException e) {
				return "You failed to upload " + name + "==>" + e.getMessage();
			}
		}else{
			return "you failed to upload " + name + " because the file is  empty";
		}
	}
	
}

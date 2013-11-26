/**
 * @Probject Name: spring
 * @Path: net.shopin.web.DeviceDetectionController.java
 * @Create By kongm
 * @Create In 2013-11-26 上午10:32:08
 * TODO
 */
package net.shopin.web;

import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * using Spring to detect the type of device that is accessing your web site.
 * @Class Name DeviceDetectionController
 * @Author kongm
 * @Create In 2013-11-26
 */
@Controller
public class DeviceDetectionController {
	
	@RequestMapping("/detect-device")
	public @ResponseBody String detectDevice(Device device){
		String deviceType = "unknown";
		if(device.isNormal()){
			deviceType = "normal";
		}else if (device.isMobile()){
			deviceType = "mobile";
		}else if (device.isTablet()){
			deviceType = "tablet";
		}
		return "Hello " + deviceType + " browser!";
	}
	

}

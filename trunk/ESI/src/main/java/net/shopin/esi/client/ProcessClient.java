/**
 * @Probject Name: ESI
 * @Path: net.shopin.esi.clientProcessClient.java
 * @Create By kongm
 * @Create In 2014-2-12 下午2:21:01
 * TODO
 */
package net.shopin.esi.client;

import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.shopin.esi.bean.User;
import net.shopin.esi.service.UserService;
import net.shopin.esi.util.FreeMarkerUtil;

/**
 * @Class Name ProcessClient
 * @Author kongm
 * @Create In 2014-2-12
 */
public class ProcessClient {
	
	private static Map<String, Object> root = new HashMap<String, Object>();
	
	public static void processBody(Writer out){
		root.put("user", "kongm");
		root.put("des", "google");
		List<User> users = UserService.getUsers();
		root.put("users", users);
		FreeMarkerUtil.processTemplate("body.ftl", root, out);
	}
	
	
	
	
	
	
	

}

/**
 * @Probject Name: shopin-back-demo
 * @Path: test.com.demo.controllerTestLdap.java
 * @Create By kongm
 * @Create In 2013-5-17 上午11:31:22
 * TODO
 */
package test.com.demo.controller;

import net.shopin.ldap.ws.client.SystemWSImpl;
import net.shopin.ldap.ws.client.SystemWSImplService;
import net.shopin.ldap.ws.client.User;

import com.constants.SystemConfig;

/**
 * @Class Name TestLdap
 * @Author kongm
 * @Create In 2013-5-17
 */
public class TestLdap {

	/**
	 * @Methods Name main
	 * @Create In 2013-5-17 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SystemWSImpl port = SystemWSImplService.getPort(SystemConfig.WSCLIENT_URL);
		User u = port.getUserDetailByUid("kongming");
        System.out.println(u.getCn());
		
	}

}

package net.shopin.web.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by IntelliJ IDEA.
 * User: 51ibm
 * Date: 12-12-12
 * Time: 下午1:27
 * To change this template use File | Settings | File Templates.
 */
public class LoadPropertiesSSO {
       public static String readValue(String key) {
		String fileName = "/sso.properties";
		Properties props = new Properties();
		InputStream in = null;
		String value = "";
		try {
			in = LoadPropertiesSSO.class.getResourceAsStream(fileName);
			props.load(in);
			value = props.getProperty(key);
			return value;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return value;
	}

}

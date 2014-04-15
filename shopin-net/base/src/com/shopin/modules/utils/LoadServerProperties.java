package com.shopin.modules.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class LoadServerProperties {
	public static String readValue(String key) {
		String fileName = "/AmqServer.properties";
		Properties props = new Properties();
		InputStream in = null;
		String value = "";
		try {
			in = LoadServerProperties.class.getResourceAsStream(fileName);
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

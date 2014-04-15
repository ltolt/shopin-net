/**
 * 说 明     : 
 * author: 陆湘星
 * data  : 2011-10-19
 * email : xiangxingchina@163.com
 **/
package net.shopin.web.util;

public class Parameter {
	private String key;
	private String value;
	public Parameter(String key, String value) {
		this.key = key;
		this.value = value;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}

/**
 * 说 明     : 
 * author: 陆湘星
 * data  : 2011-10-4
 * email : xiangxingchina@163.com
 **/
package util.httpclient;

public class Parameter {
	private String key;
	private String value;
	public Parameter(String key,String value) {
		this.key = key;
		this.value = value;
	}
	public String getKey() {
		return key.trim();
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value.trim();
	}
	public void setValue(String value) {
		this.value = value;
	}
}

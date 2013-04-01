
/**
 * 说 明  :
 * author: 陆湘星
 * data  : 2011-5-19
 * email : xiangxingchina@163.com
 **/

package base.framework.util;

public class Field {
	private String fieldName;
	private String fieldDesc;
	private Object value;
	
	public String getFieldDesc() {
		return fieldDesc;
	}
	public void setFieldDesc(String fieldDesc) {
		this.fieldDesc = fieldDesc;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
	
}
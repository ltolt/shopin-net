/**
 * 说 明  :
 * author: 陆湘星
 * data  : 2011-5-19
 * email : xiangxingchina@163.com
 **/

package base.framework.util;

import java.util.List;


public abstract class AbstractValidator {
	boolean result = true;
	String msg = "";
	public abstract void doValidator(List<Field> fields,List<String> args,boolean isAll);
	public  boolean getResult(){
		return result;
	}
	public  String  getMessage(){
		return msg;
	}
}

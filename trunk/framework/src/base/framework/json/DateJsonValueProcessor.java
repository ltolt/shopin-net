/**
 * @Probject Name: framework
 * @Path: base.framework.json.DateJsonValueProcessor.java
 * @Create By kongm
 * @Create In 2013-7-23 ÏÂÎç5:40:17
 * TODO
 */
package base.framework.json;

/**
 * @Class Name DateJsonValueProcessor
 * @Author kongm
 * @Create In 2013-7-23
 */

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class DateJsonValueProcessor implements JsonValueProcessor {
	public static final String DEFAULT_DATE_PATTERN = "yyyy-MM-dd"; 
	private DateFormat dateFormat;
	
	
	public DateJsonValueProcessor(String datePattern){
		dateFormat = new SimpleDateFormat(datePattern);
	}
	
	@Override
	public Object processArrayValue(Object arg0, JsonConfig arg1) {
		return process(arg0);   
	}

	@Override
	public Object processObjectValue(String key, Object value, JsonConfig arg2) {
		return process(value);
	}

	private Object process(Object value){
		return dateFormat.format((Date)value);
	}
}

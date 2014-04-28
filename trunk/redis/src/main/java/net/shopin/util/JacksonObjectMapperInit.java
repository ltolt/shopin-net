/**
 * 
 */
package net.shopin.util;

import java.text.SimpleDateFormat;

import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;

/**
 * @author kongming
 *
 */
/**
 * 初始化ObjectMapper对时间的处理
 */
public class JacksonObjectMapperInit {
	
	private ObjectMapper objectMapper;

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
	
	public static final String DATEFORMAT = "yyyy-MM-dd HH:mm:ss";
	public void init(){
		objectMapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		SerializationConfig serConfig = objectMapper.getSerializationConfig();
        serConfig.setDateFormat(new SimpleDateFormat(DATEFORMAT));
        DeserializationConfig deserializationConfig = objectMapper.getDeserializationConfig();
        deserializationConfig.setDateFormat(new SimpleDateFormat(DATEFORMAT));
        
        objectMapper.configure(SerializationConfig.Feature.WRITE_DATES_AS_TIMESTAMPS, false);
	}
}

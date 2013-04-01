package base.framework.jms.converter;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.Session;

import org.apache.activemq.command.ActiveMQObjectMessage;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jms.support.converter.MessageConversionException;
import org.springframework.jms.support.converter.MessageConverter;

public class DefaultMessageConverter implements MessageConverter{

	private Log log = LogFactory.getLog(this.getClass());
	
	@Override
	public Object fromMessage(Message msg) throws JMSException,
			MessageConversionException {
		if(log.isDebugEnabled()){
			log.debug("from(message) - start");
		}
		if(msg instanceof ObjectMessage){
			HashMap<String,byte[]> map = (HashMap<String, byte[]>) ((ObjectMessage)msg).getObject();
		    try {
		    	ByteArrayInputStream bis = new ByteArrayInputStream(map.get("POJO"));
				ObjectInputStream ois = new ObjectInputStream(bis);
				Object returnObject = ois.readObject();
				return returnObject;
			} catch (IOException e) {
				log.error("fromMessage",e);
			} catch (ClassNotFoundException e) {
				log.error("fromMessage",e);
			}
			return null;
		}else{
			throw new JMSException("Msg:" + msg + " is not map");
		}
		
	}

	@Override
	public Message toMessage(Object obj, Session session) throws JMSException,
			MessageConversionException {
		if(log.isDebugEnabled()){
			log.debug("toMessage(object,session - start");
		}
		ActiveMQObjectMessage objMsg = (ActiveMQObjectMessage) session.createObjectMessage();
		HashMap<String, byte[]> map = new HashMap<String, byte[]>();
		
		//POJO must implements Serializable
		try {
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(bos);
			oos.writeObject(obj);
			map.put("POJO", bos.toByteArray());
			objMsg.setObjectProperty("Map",map);
		} catch (IOException e) {
			log.error("toMessage()",e);
		}
		
		
		
		
		
		return objMsg;
	}

}

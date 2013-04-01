package base.framework.jms;

import javax.jms.Queue;

import org.springframework.jms.core.JmsTemplate;

public class MethodMessageProducer {

	private JmsTemplate template;
	
	private Queue destination;

	public void setTemplate(JmsTemplate template) {
		this.template = template;
	}

	public void setDestination(Queue destination) {
		this.destination = destination;
	}

	
	public void proceedMethod(MethodMessage methodMessage){
		this.template.convertAndSend(this.destination,methodMessage);
	}



}



package com.shopin.modules.activemq;

import org.springframework.jms.core.JmsTemplate;

import javax.jms.Topic;

public class TopicMessageProducer {
    
    private JmsTemplate template;

	private Topic destination;

	public void setTemplate(JmsTemplate template) {
		this.template = template;
	}

	public void setDestination(Topic destination) {
		this.destination = destination;
	}

	public void send(MessageVO messageVO) {
		template.convertAndSend(this.destination, messageVO);
	}
}

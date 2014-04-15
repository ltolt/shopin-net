package com.shopin.modules.jms;

import org.aopalliance.intercept.MethodInvocation;
import org.springframework.jms.core.JmsTemplate;

import javax.jms.Queue;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-4-29
 * Time: 10:17:34
 */
public class MethodMessageProducer {
    private JmsTemplate template;

    private Queue destination;

    public void setTemplate(JmsTemplate template) {
        this.template = template;
    }

    public void setDestination(Queue destination) {
        this.destination = destination;
    }
    
    public void proceedMethod(MethodMessage methodMessage) {
        template.convertAndSend(this.destination, methodMessage);
    }
}

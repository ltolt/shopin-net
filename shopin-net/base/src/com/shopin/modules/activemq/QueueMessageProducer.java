package com.shopin.modules.activemq;

import org.springframework.jms.core.JmsTemplate;

import javax.jms.Queue;

/**
 * Created by IntelliJ IDEA.
 * User: wentao
 * Date: 2008-12-19
 * Time: 16:07:24
 */
public class QueueMessageProducer {
    private JmsTemplate template;

    private Queue destination;

    public void setTemplate(JmsTemplate template) {
        this.template = template;
    }

    public void setDestination(Queue destination) {
        this.destination = destination;
    }

//    public void send(MessageVO messageVO) {
//        System.out.println("---"+ messageVO);
//        template.convertAndSend(this.destination, messageVO);
//    }
//
//    public void sendMemberEmail(MemberVO memberVO) {
//        System.out.println("-加入会员队列--"+ memberVO);
//        template.convertAndSend(this.destination, memberVO);
//    }
//    public void sendOrderEmail(OrderVO orderVO) {
//        System.out.println("--加入订单队列-"+ orderVO);
//        template.convertAndSend(this.destination, orderVO);
//    }
}

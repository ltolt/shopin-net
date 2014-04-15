package net.shopin.jms;

import com.shopin.modules.activemq.MessageVO;
import net.shopin.view.MemberVO;
import net.shopin.view.OrderVO;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.scheduling.annotation.Async;

import javax.jms.Queue;

/**
 * Created by IntelliJ IDEA.
 * User: wentao
 * Date: 2008-12-19
 * Time: 16:07:24
 */
public class MemberMessageProducer {
    private JmsTemplate template;

    private Queue destination;

    public void setTemplate(JmsTemplate template) {
        this.template = template;
    }

    public void setDestination(Queue destination) {
        this.destination = destination;
    }
    
    @Async
    public void sendMemberEmail(MemberVO memberVO) {
        //System.out.println("-加入会员队列--"+ memberVO);
        template.convertAndSend(this.destination, memberVO);
    }
}
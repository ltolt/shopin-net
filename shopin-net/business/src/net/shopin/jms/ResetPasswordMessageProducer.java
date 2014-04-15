package net.shopin.jms;

import net.shopin.view.MemberVO;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.scheduling.annotation.Async;

import javax.jms.Queue;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-3-25
 * Time: 13:31:53
 */
public class ResetPasswordMessageProducer {
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
        template.convertAndSend(this.destination, memberVO);
    }
}

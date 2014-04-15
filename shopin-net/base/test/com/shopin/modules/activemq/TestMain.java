package com.shopin.modules.activemq;

import com.shopin.modules.activemq.MessageVO;
import com.shopin.modules.activemq.QueueMessageProducer;
import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class TestMain {
	public static void main(String[] args) {
        ListableBeanFactory lsb = new FileSystemXmlApplicationContext("classpath:com/shopin/modules/activemq/applicationContext-Server.xml");

        //TopicMessageProducer fmpa = (TopicMessageProducer)lsb.getBean("topicMessageProducer");
		QueueMessageProducer fmpb = (QueueMessageProducer)lsb.getBean("queueMessageProducer");
		int count = 1;
		while (true) {    
			MessageVO fm = new MessageVO();
			fm.setId(""+count);
			//fmpa.send(fm);
//            fmpb.send(fm);

            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            count ++;
		}
	}
}

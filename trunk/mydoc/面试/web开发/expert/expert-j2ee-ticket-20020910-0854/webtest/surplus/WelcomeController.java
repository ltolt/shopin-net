
package surplus;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.jms.*;
import javax.jms.Message;

import com.interface21.context.ApplicationContextException;
import com.interface21.web.servlet.ModelAndView;
import com.interface21.jms.JmsException;
import com.interface21.jms.JmsTemplate;

public class WelcomeController extends AbstractTicketController {

	public static final String REFERENCE_DATA_TOPIC_NAME = "jms/topic/referencedata";
	/**
	 * @see Controller#handleRequest(HttpServletRequest, HttpServletResponse)
	 */
	protected ModelAndView handleTicketRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			
		logger.fine("------------- handleRequestInternal ***************");
		
		// JBoss
		JmsTemplate jmsTemplate = new JmsTemplate("jms/TopicFactory");
		
		if (request.getParameter("r") != null) {
		try {
			// NO COMP ENV "topic/referencedata" WORKE$D WIHTOU JBOSS reference
			jmsTemplate.publish(REFERENCE_DATA_TOPIC_NAME, new JmsTemplate.PubSubMessageCreator() {
				public Message createMessage(TopicSession session) throws JMSException {
					TextMessage msg = session.createTextMessage();
					msg.setText("This is a test message 1.");
					//System.out.println("Will publish" + msg); 
					return msg;
				}
			});
		}
		catch (JmsException ex) {
			// Failed to publish
			logger.severe ("Failed to publish" + ex);
		}  
		}
		
		List genres = getCalendar().getCurrentGenres();
		return new ModelAndView("welcomeView", "genres", genres);
	}
	
	TopicConnection tc;
	

	/**
	 * @see AbstractTicketController#ticketInit()
	 */
	protected void ticketInit() throws ApplicationContextException {
		JmsTemplate jmsTemplate = new JmsTemplate("jms/TopicFactory");
		tc = jmsTemplate.subscribeToTopicNonDurable(REFERENCE_DATA_TOPIC_NAME, new MyListener(), null);
	}
	  
	private class MyListener implements MessageListener {
		
		public MyListener() {
			System.out.println("############################################################## NWEW M<YU");
		} 
		
		/**
		 * @see MessageListener#onMessage(Message)
		 */
		public void onMessage(Message arg0) {
			System.out.println("listener " + this + " RECEIVED MESSAGE " + arg0);
		}

	}

} 
  
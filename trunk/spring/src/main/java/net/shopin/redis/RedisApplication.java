/**
 * @Probject Name: spring
 * @Path: net.shopin.redis.RedisApplication.java
 * @Create By kongm
 * @Create In 2013-11-26 下午3:28:18
 * TODO
 */
package net.shopin.redis;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisShardInfo;

/**
 * @Class Name RedisApplication
 * @Author kongm
 * @Create In 2013-11-26
 */
@Configuration
public class RedisApplication {

	@Bean
	JedisConnectionFactory connectionFactory() {
		return new JedisConnectionFactory(new JedisShardInfo("172.16.103.231", 6379));
	}

	@Bean
	RedisMessageListenerContainer container(
			final JedisConnectionFactory connectionFactory) {
		RedisMessageListenerContainer container = new RedisMessageListenerContainer() {
			{
				setConnectionFactory(connectionFactory);
			}
		};
		container.addMessageListener(listenerAdapter(),
				new PatternTopic("chat"));
		return container;

	}

	@Bean
	MessageListenerAdapter listenerAdapter() {
		return new MessageListenerAdapter(new Receiver(), "receiveMessage");
	}
	
	@Bean
	StringRedisTemplate template(JedisConnectionFactory connectionFactory){
		return new StringRedisTemplate(connectionFactory);
	}
	
	public static void main(String[] args) {
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(RedisApplication.class);
		StringRedisTemplate template = ctx.getBean(StringRedisTemplate.class);
		System.out.println("Sending message ...");
		template.convertAndSend("chat", "Hello From Redis");
		ctx.close();
	}
	
	
	

}

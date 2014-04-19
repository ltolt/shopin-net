/**
 * 
 */
package net.shopin.redis;

import org.junit.Test;

import redis.clients.jedis.Jedis;

/**
 * @author kongming
 *
 */
public class JedisTest extends JedisCommandTestBase {

	private final static String LIST = "mylist";
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Test
	public void redisListTestDataInsert(){
		//列表中插入20000条记录
		for(int i = 0;i < 20000;i ++){
			jedis.lpush(LIST,"mylist" + i);
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	@Test
	public void useWithoutConnecting() {
		Jedis jedis = new Jedis("localhost");
		System.out.println(jedis.dbSize());
	}
	
	@Test
	public void testCommand(){
		String result = jedis.set("foo", "bar");
		System.out.println(result);
	}
	

}

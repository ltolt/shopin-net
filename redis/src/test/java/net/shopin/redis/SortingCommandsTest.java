/**
 * 
 */
package net.shopin.redis;

import java.util.List;

import org.junit.Test;

/**
 * @author kongming
 *
 */
public class SortingCommandsTest extends JedisCommandTestBase {
	
	
	@Test
	public void sort(){
		jedis.lpush("goo", "3");
		jedis.lpush("goo", "2");
		jedis.lpush("goo", "1");
		List result = jedis.sort("goo");
		System.out.println(result);
		
		
	}
	
	

}

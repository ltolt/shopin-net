/**
 * 
 */
package net.shopin.redis;

import java.util.UUID;

import org.junit.Test;

import redis.clients.jedis.Jedis;

/**
 * @author kongming
 *
 */
public class RedisInWebTest extends JedisCommandTestBase {

	public void updateToken(Jedis conn, String token, String user, String item) {
		long timestamp = System.currentTimeMillis() / 1000;
		conn.hset("login:", token, user);
		conn.zadd("recent:", timestamp, token);
		if (item != null) {
			conn.zadd("viewd:" + token, timestamp, item);
			conn.zremrangeByScore("viewd:" + token, 0, -26);
			conn.zincrby("viewd", -1, item);
		}
	}

	 public String checkToken(Jedis conn, String token) {
	        return conn.hget("login:", token);
	    }
	
	@Test
	public void testLoginCookies() {
		System.out.println("\n----- testLoginCookies -----");
		String token = UUID.randomUUID().toString();
		updateToken(jedis, token, "username", "itemX");
		System.out.println("We just logged-in/updated token: " + token);
		System.out.println("For user: 'username'");
		System.out.println();
		System.out.println("What username do we get when we look-up that token?");
		String r = checkToken(jedis, token);
		System.out.println(r);
		 System.out.println("Let's drop the maximum number of cookies to 0 to clean them out");
	        System.out.println("We will start a thread to do the cleaning, while we stop it later");
	        
	}
	
	public class CleanSessionsThread extends Thread{
		private Jedis conn;
		private int limit;
		private boolean quit;
		public CleanSessionsThread(int limit) {
            this.conn = new Jedis("localhost");
            this.conn.select(15);
            this.limit = limit;
        }
		
		
	}
	
	

}

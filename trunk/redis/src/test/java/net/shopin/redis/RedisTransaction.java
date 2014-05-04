/**
 * 
 */
package net.shopin.redis;

import java.util.List;
import java.util.Set;

import org.junit.Test;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;
import redis.clients.jedis.Tuple;

/**
 * @author kongming
 *
 */
public class RedisTransaction extends JedisCommandTestBase{
	
	
	@Test
	public void testListItem(){
		System.out.println("We need to set up just enough state so that a user can list an item");
		String seller = "userX";
		String item = "itemy";
		jedis.sadd("inventory:" + seller, item);
		Set<String>  i = jedis.smembers("inventory:" + seller);
		 System.out.println("The user's inventory has:");
		 for(String member : i ){
			 System.out.println("  " + member);
		 }
		System.out.println();
		 System.out.println("Listing the item...");
		 boolean l = listItem(jedis, item, seller, 10);
		 System.out.println("Listing the item succeeded? " + l);
		 
		 Set<Tuple> r = jedis.zrangeWithScores("market:", 0, -1);
		 System.out.println("The market contains:");
		 for(Tuple tuple : r){
			 System.out.println("  " + tuple.getElement() + "," + tuple.getScore());
		 }
		
	}
	
	
	public boolean listItem(Jedis jedis,String itemId,String sellerId,double price){
		String inventory = "inventory:" + sellerId;
		String item = itemId + "." + sellerId;
		long end = System.currentTimeMillis() + 5000;
		while(System.currentTimeMillis() < end){
			jedis.watch(inventory);
			if(!jedis.sismember(inventory, itemId)){
				jedis.unwatch();
				return false;
			}
			Transaction transaction = jedis.multi();
			transaction.zadd("market:", price, item);
			transaction.zrem(inventory, itemId);
			List<Object> results = transaction.exec();
			if(results == null){
				continue;
			}
			return true;
		}
		return false;
		
	}
	


}

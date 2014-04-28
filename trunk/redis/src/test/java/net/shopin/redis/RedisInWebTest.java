/**
 * 
 */
package net.shopin.redis;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.junit.Test;

import com.google.gson.Gson;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

/**
 * @author kongming
 *
 */
public class RedisInWebTest extends JedisCommandTestBase {

	/**
	 * redis 缓存 rows 模块例子
	 * @author kongming
	 * @throws InterruptedException 
	 */
	@Test
	public void testCacheRows() throws InterruptedException {
		System.out.println("\n-------------testCacheRows");
		System.out.println("First, let's schedule caching of itemX every 5 seconds");
		scheduleRowCache(jedis, "itemX", 5);
		System.out.println("Our schedule looks like:");
		Set<Tuple> s = jedis.zrangeWithScores("schedule:", 0, -1);
		for (Tuple tuple : s) {
			System.out.println(" " + tuple.getElement() + " , " + tuple.getScore());
		}
		assert s.size() != 0;
		System.out.println("We'll start a caching thread that will cache the data...");
		CacheRowsThread thread = new CacheRowsThread();
		thread.start();
		Thread.sleep(1000);
		System.out.println("Our cached data looks like:");
		String r = jedis.get("inv:itemX");
		System.out.println(r);
		System.out.println("We'll check again in 5 seconds...");
		Thread.sleep(5000);
		System.out.println("Notice that the data has changed...");
		String r2 = jedis.get("inv:itemX");
		System.out.println(r2);
		System.out.println();
		System.out.println("Let's force un-caching");
		scheduleRowCache(jedis, "itemX", -1);
		Thread.sleep(1000);
		r = jedis.get("inv:itemX");
		System.out.println("The cache was cleared? " + (r == null));
		thread.quit();
		Thread.sleep(2000);
		if (thread.isAlive()) {
			throw new RuntimeException("The database caching thread is still alive?!?");
		}

	}

	public void scheduleRowCache(Jedis conn, String rowId, int delay) {
		conn.zadd("delay:", delay, rowId);
		conn.zadd("schedule:", System.currentTimeMillis() / 1000, rowId);
	}

	public class CacheRowsThread extends Thread {
		private Jedis conn;
		private boolean quit;

		public CacheRowsThread() {
			this.conn = new Jedis("localhost");
		}

		public void quit() {
			quit = true;
		}

		public void run() {
			Gson gson = new Gson();
			while (!quit) {
				Set<Tuple> range = conn.zrangeWithScores("schedule:", 0, 0);
				Tuple next = range.size() > 0 ? range.iterator().next() : null;
				long now = System.currentTimeMillis() / 1000;
				if (next == null || next.getScore() > now) {
					try {
						sleep(50);
					} catch (InterruptedException e) {
						Thread.currentThread().interrupt();
					}
					continue;
				}
				String rowId = next.getElement();
				double delay = conn.zscore("delay:", rowId);
				if (delay < 0) {
					conn.zrem("delay:", rowId);
					conn.zrem("schedule:", rowId);
					conn.del("inv:" + rowId);
					continue;
				}
				Inventory row = Inventory.get(rowId);
				conn.zadd("schedule:", now + delay, rowId);
				conn.set("inv:" + rowId, gson.toJson(row));
			}
		}
	}

	public static class Inventory {
		private String id;
		private String data;
		private long time;

		private Inventory(String id) {
			this.id = id;
			this.data = "data to cache...";
			this.time = System.currentTimeMillis() / 1000;
		}

		public static Inventory get(String id) {
			return new Inventory(id);
		}
	}

	//==============================

	public interface Callback {
		public String call(String request);
	}

	@Test
	public void testCacheRequest() {
		System.out.println("\n----- testCacheRequest -----");
		String token = UUID.randomUUID().toString();
		Callback callback = new Callback() {
			@Override
			public String call(String request) {
				return "content for " + request;
			}
		};
		updateToken(jedis, token, "uername", "itemX");
		String url = "http://test.com?item=itemX";
		System.out.println("We are going to cache a simple request against " + url);
		String result = cacheRequest(jedis, url, callback);
		System.out.println("We got initial content:\n" + result);
		System.out.println();
		System.out.println("To test that we've cached the request, we'll pass a bad callback");
		String result2 = cacheRequest(jedis, url, null);
		System.out.println("We ended up getting the same response!\n" + result2);

	}

	public String cacheRequest(Jedis conn, String request, Callback callback) {
		if (!canCache(conn, request)) {
			return callback != null ? callback.call(request) : null;
		}
		String pageKey = "cache:" + hashRequest(request);
		String content = conn.get(pageKey);
		if (content == null && callback != null) {
			content = callback.call(request);
			conn.setex(pageKey, 30000, content);
		}
		return content;
	}

	public String hashRequest(String request) {
		return String.valueOf(request.hashCode());
	}

	public boolean canCache(Jedis conn, String request) {
		try {
			URL url = new URL(request);
			HashMap<String, String> params = new HashMap<String, String>();
			if (url.getQuery() != null) {
				for (String param : url.getQuery().split("&")) {
					String[] pair = param.split("=", 2);
					params.put(pair[0], pair.length == 2 ? pair[1] : null);
				}
			}
			String itemId = extractItemId(params);
			if (itemId == null || isDynamic(params)) {
				return false;
			}
			Long rank = conn.zrank("viewd:", itemId);
			return rank != null && rank < 10000;
		} catch (MalformedURLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean isDynamic(Map<String, String> params) {
		return params.containsKey("_");
	}

	public String extractItemId(Map<String, String> params) {
		return params.get("item");
	}

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

	public class CleanSessionsThread extends Thread {
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

/**
 * 
 */
package net.shopin.redis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.ZParams;

/**
 * @author kongming
 *
 */
public class RedisInActionTest extends JedisCommandTestBase {

	private static final int ONE_WEEK_IN_SECONDS = 7 * 86400;
	private static final int VOTE_SCORE = 432;
	private static final int ARTICLE_PER_PAGE = 25;
	
	@Test
	public void testId()
	{
		for(int i = 0;i < 20;i++){
			Long id = getId();
			System.out.println(i + ":" + id);
		}
	}
	
	
	@Test
	public void testPostArticle(){
		jedis.select(15);
		String articleId = postArticle(jedis, "username", "jd.com", "http://jd.com");
		System.out.println("We posted a new article with id : " + articleId);
		System.out.println("Its Hash look like:");
		Map<String, String> articleData  = jedis.hgetAll("article:" + articleId);
		for(Map.Entry<String, String> entry : articleData.entrySet()){
			System.out.println("  " + entry.getKey() + ": " + entry.getValue());
		}
		System.out.println();
		
		articleVote(jedis, "other_user", "article:" + articleId);
		String votes = jedis.hget("article:" + articleId, "votes");
		System.out.println("We voted for the article , it now has votes:" + votes);
		assert Integer.parseInt(votes) > 1;
		System.out.println("The currently highest-scoring articles are:");
		List<Map<String, String>> articles = getArticles(jedis, 1);
		printArticles(articles);
		
		addGroups(jedis, articleId, new String[]{"new-group"});
		System.out.println("We added the article to a new group , other articles include:");
		articles = getGroupArticles(jedis, "new-group", 1);
		printArticles(articles);
	}
	
	public Long getId(){
		jedis.select(15);
		Long id = jedis.incr("sequence:");
		jedis.save();
		return id;
	}
	
	public void addGroups(Jedis conn,String articleId,String[] toAdd){
		String article = "article:" + articleId;
		for(String group : toAdd){
			conn.sadd("group:" + group, article);
		}
		
	}
	
	 public List<Map<String,String>> getGroupArticles(Jedis conn, String group, int page) {
	        return getGroupArticles(conn, group, page, "score:");
	    }
	 
	public List<Map<String, String>> getGroupArticles(Jedis conn,String group,int page,String order){
		String key = order + group;
		if(!conn.exists(key)){
			ZParams params = new ZParams().aggregate(ZParams.Aggregate.MAX);
			conn.zinterstore(key, params,"group:" + group,order);
			conn.expire(key, 60);
		}
		return getArticles(conn, page,key);
	}
	
		
	public String postArticle(Jedis conn, String user,String title,String link){
		String articleId = String.valueOf(getId());
		String voted = "voted:" + articleId;
		conn.sadd(voted, user);
		conn.expire(voted, ONE_WEEK_IN_SECONDS);
		long now = System.currentTimeMillis()/1000;
		String article = "article:" + articleId;
		HashMap<String, String> articleData = new HashMap<String, String>();
		articleData.put("title", title);
		articleData.put("link", link);
		articleData.put("user", user);
		articleData.put("now", String.valueOf(now));
		articleData.put("votes", "1");
		conn.hmset(article, articleData);
		conn.zadd("score:", now + VOTE_SCORE,article);
		conn.zadd("time:", now,article);
		return articleId;
	}
	
	
	
	public void articleVote(Jedis conn,String user,String article){
		long cutoff = (System.currentTimeMillis()/1000) - ONE_WEEK_IN_SECONDS;
		if(conn.zscore("time:", article) < cutoff){
			return;
		}
		String articleId = article.substring(article.indexOf(":") + 1);
		if(conn.sadd("voted:" + articleId, user) == 1){
			conn.zincrby("score:", VOTE_SCORE, article);
			conn.hincrBy(article, "votes", 1);
		}
	}
	
	public List getArticles(Jedis conn,int page){
		return getArticles(conn, page,"score:");
	}
	
	public List<Map<String, String>> getArticles(Jedis conn,int page,String order){
		int start = (page - 1)*ARTICLE_PER_PAGE;
		int end = start + ARTICLE_PER_PAGE - 1;
		Set<String> ids = conn.zrevrange(order, start, end);
		List<Map<String, String>> articles = new ArrayList<Map<String,String>>();
		for(String id : ids){
			Map<String, String> articleData =  conn.hgetAll(id);
			articleData.put("id", id);
			articles.add(articleData);
		}
		return articles;
	}
	
	
	private void printArticles(List<Map<String,String>> articles){
        for (Map<String,String> article : articles){
            System.out.println(" id: " + article.get("id"));
            for (Map.Entry<String,String> entry : article.entrySet()){
                if (entry.getKey().equals("id")){
                    continue;
                }
                System.out.println(" " + entry.getKey() + ": " + entry.getValue());
            }
        }
    }
}

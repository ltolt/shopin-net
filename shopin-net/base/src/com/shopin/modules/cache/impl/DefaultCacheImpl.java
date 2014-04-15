package com.shopin.modules.cache.impl;

import com.shopin.modules.cache.ICache;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * 一个默认的本地Cache的实现，线程安全
 *
 */
public class DefaultCacheImpl implements ICache<String,Object>
{
	private static final Log Logger = LogFactory.getLog(DefaultCacheImpl.class);

	/**
	 * 具体内容存放的地方
	 */
	ConcurrentHashMap<String, Object>[] caches;
	/**
	 * 超期信息存储
	 */
	ConcurrentHashMap<String, Long> expiryCache;

	/**
	 * 清理超期内容的服务
	 */
	private  ScheduledExecutorService scheduleService;

	/**
	 * 清理超期信息的时间间隔，默认10分钟
	 */
	private int expiryInterval = 10;

	/**
	 * 内部cache的个数，根据key的hash对module取模来定位到具体的某一个内部的Map，
	 * 减小阻塞情况发生。
	 */
	private int moduleSize = 10;


	public DefaultCacheImpl()
	{
		init();
	}

	public DefaultCacheImpl(int expiryInterval,int moduleSize)
	{
		this.expiryInterval = expiryInterval;
		this.moduleSize = moduleSize;
		init();
	}


	@SuppressWarnings("unchecked")
	private void init()
	{
		caches = new ConcurrentHashMap[moduleSize];

		for(int i = 0 ; i < moduleSize ;i ++)
			caches[i] = new ConcurrentHashMap<String, Object>();

		expiryCache = new ConcurrentHashMap<String, Long>();

		scheduleService = Executors.newScheduledThreadPool(1);

		scheduleService.scheduleAtFixedRate(new CheckOutOfDateSchedule(caches,expiryCache),
				0, expiryInterval * 60, TimeUnit.SECONDS);

		if (Logger.isInfoEnabled())
			Logger.info("DefaultCache CheckService is start!");
	}

	public boolean clear()
	{
		if (caches != null)
			for(ConcurrentHashMap<String, Object> cache : caches)
			{
				cache.clear();
			}

		if (expiryCache != null)
			expiryCache.clear();

		return true;
	}


	public boolean containsKey(String key)
	{
		checkValidate(key);
		return getCache(key).containsKey(key);
	}


	public Object get(String key)
	{
		checkValidate(key);
		return getCache(key).get(key);
	}


	public Set<String> keySet()
	{
		checkAll();
		return expiryCache.keySet();
	}


	public Object put(String key, Object value)
	{
		getCache(key).put(key, value);
		expiryCache.put(key,(long)-1);

		return value;
	}

	public Object put(String key, Object value, Date expiry)
	{
		getCache(key).put(key, value);
		expiryCache.put(key,expiry.getTime());

		return value;
	}


	public Object remove(String key)
	{
		Object result = getCache(key).remove(key);
		expiryCache.remove(key);
		return result;
	}


	public int size()
	{
		checkAll();

		return expiryCache.size();
	}


	public Collection<Object> values()
	{
		checkAll();

		Collection<Object> values = new ArrayList<Object>();

		for(ConcurrentHashMap<String, Object> cache : caches)
		{
			values.addAll(cache.values());
		}

		return values;
	}

	private ConcurrentHashMap<String, Object>getCache(String key)
	{
		long hashCode = (long)key.hashCode();

		if (hashCode < 0)
			hashCode = -hashCode;

		int moudleNum = (int)hashCode % moduleSize;

		return caches[moudleNum];
	}

	private void checkValidate(String key)
	{
		if (expiryCache.get(key) != null && expiryCache.get(key) != -1
				&& new Date(expiryCache.get(key)).before(new Date()))
		{
			getCache(key).remove(key);
			expiryCache.remove(key);
		}
	}

	private void checkAll()
	{
		Iterator<String> iter = expiryCache.keySet().iterator();

		while(iter.hasNext())
		{
			String key =  iter.next();
			checkValidate(key);
		}
	}

	class CheckOutOfDateSchedule implements java.lang.Runnable
	{
		/**
		 * 具体内容存放的地方
		 */
		ConcurrentHashMap<String, Object>[] caches;
		/**
		 * 超期信息存储
		 */
		ConcurrentHashMap<String, Long> expiryCache;

		public CheckOutOfDateSchedule(ConcurrentHashMap<String, Object>[] caches,
				ConcurrentHashMap<String, Long> expiryCache)
		{
			this.caches = caches;
			this.expiryCache = expiryCache;
		}


		public void run()
		{
			check();
		}

		public void check()
		{
			try
			{
				for(ConcurrentHashMap<String, Object> cache : caches)
				{
					Iterator<String> keys = cache.keySet().iterator();

					while(keys.hasNext())
					{
						String key = keys.next();

						if (expiryCache.get(key) == null)
							continue;

						long date = expiryCache.get(key);

						if ((date > 0)&&(new Date(date).before(new Date())))
						{
							expiryCache.remove(key);
							cache.remove(key);
						}

					}

				}
			}
			catch(Exception ex)
			{
				Logger.info("DefaultCache CheckService is start!");
			}
		}

	}


	public Object put(String key, Object value, int TTL)
	{
		getCache(key).put(key, value);

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.SECOND, TTL);
		expiryCache.put(key,calendar.getTime().getTime());

		return value;
	}

	public void destroy()
	{
		try
		{
			if (scheduleService != null)
				scheduleService.shutdown();

			scheduleService = null;
		}
		catch(Exception ex)
		{
			Logger.error(ex);
		}
	}

}

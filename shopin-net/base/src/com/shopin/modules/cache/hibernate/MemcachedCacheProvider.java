package com.shopin.modules.cache.hibernate;

import net.rubyeye.xmemcached.MemcachedClient;
import org.hibernate.cache.CacheProvider;
import org.hibernate.cache.Cache;
import org.hibernate.cache.CacheException;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.ApplicationContext;

import java.util.Properties;
import java.io.IOException;

import com.shopin.modules.utils.SpringContextUtil;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-7-29
 * Time: 16:11:29
 */
public class MemcachedCacheProvider implements CacheProvider {

    private MemcachedClient memcachedClient;


    public Cache buildCache(String s, Properties properties) throws CacheException {
        MemcachedCache memcachedCache = new MemcachedCache("hibernate",memcachedClient);
        return memcachedCache;
    }

    public long nextTimestamp() {
       return System.currentTimeMillis() / 100;
    }

    public void start(Properties properties) throws CacheException {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("hibernateCache.xml");
        memcachedClient = (MemcachedClient) ctx.getBean(properties.getProperty("hibernate.cache.name"));
    }

    public void stop() {
       try {
            memcachedClient.shutdown();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean isMinimalPutsEnabledByDefault() {
        return true;
    }
}

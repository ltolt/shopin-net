package com.shopin.modules.cache.hibernate;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;
import org.hibernate.cache.Cache;
import org.hibernate.cache.CacheException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;
import java.util.concurrent.TimeoutException;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-7-29
 * Time: 16:14:28
 */
public class MemcachedCache implements Cache {
private final Logger log = LoggerFactory.getLogger(MemcachedCache.class);

    private final String regionName;
    private final MemcachedClient memcache;
    private final String clearIndexKey;
    private int cacheTimeSeconds = 300;
    private boolean clearSupported = false;
    private KeyStrategy keyStrategy = new Md5KeyStrategy();


    public MemcachedCache(String regionName, MemcachedClient memcachedClient) {
        this.regionName = (regionName != null) ? regionName : "default";
        this.memcache = memcachedClient;
        clearIndexKey = this.regionName.replaceAll("\\s", "") + ":index_key";
    }

    public int getCacheTimeSeconds() {
        return cacheTimeSeconds;
    }

    public void setCacheTimeSeconds(int cacheTimeSeconds) {
        this.cacheTimeSeconds = cacheTimeSeconds;
    }

    public boolean isClearSupported() {
        return clearSupported;
    }

    public void setClearSupported(boolean clearSupported) {
        this.clearSupported = clearSupported;
    }


    private Object memcacheGet(Object key) {
        Object object = null;
        try {
            object = memcache.get(toKey(key));
        } catch (TimeoutException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (MemcachedException e) {
            e.printStackTrace();
        }
        return object;
    }

    private void memcacheSet(Object key, Object o) {
        String objectKey = toKey(key);

        int cacheTime = cacheTimeSeconds;

        log.debug("Memcache.set({})", objectKey);

        try {
            memcache.set(objectKey, cacheTime, o);
        } catch (TimeoutException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (MemcachedException e) {
            e.printStackTrace();
        }
    }

    private String toKey(Object key) {
        return keyStrategy.toKey(regionName, getClearIndex(), key);
    }

    public Object read(Object key) throws CacheException {
        return memcacheGet(key);
    }

    public Object get(Object key) throws CacheException {
        return memcacheGet(key);
    }

    public void put(Object key, Object value) throws CacheException {
        memcacheSet(key, value);
    }

    public void update(Object key, Object value) throws CacheException {
        put(key, value);
    }

    public void remove(Object key) throws CacheException {
        try {
            memcache.delete(toKey(key));
        } catch (TimeoutException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (MemcachedException e) {
            e.printStackTrace();
        }
    }

    /**
     * Clear functionality is disabled by default.
     * Read this class's javadoc for more detail.
     *
     * @throws CacheException
     */
    public void clear() throws CacheException {
        if (clearSupported) {
            try {
                memcache.decr(clearIndexKey,1);
            } catch (TimeoutException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (MemcachedException e) {
                e.printStackTrace();
            }
        }
    }

    public void destroy() throws CacheException {
        //the client is shared by default with all cache instances, so don't shut it down.
    }

    public void lock(Object key) throws CacheException {
    }

    public void unlock(Object key) throws CacheException {
    }

    public long nextTimestamp() {
        return System.currentTimeMillis() / 100;
    }

    public int getTimeout() {
        return cacheTimeSeconds;
    }

    public String getRegionName() {
        return regionName;
    }

    public long getSizeInMemory() {
        return -1;
    }

    public long getElementCountInMemory() {
        return -1;
    }

    public long getElementCountOnDisk() {
        return -1;
    }

    public Map toMap() {
        throw new UnsupportedOperationException();
    }

    public String toString() {
        return "Memcached (" + regionName + ")";
    }

    private long getClearIndex() {
        Long index = null;

        if (clearSupported) {
            Object value = null;
            try {
                value = memcache.get(clearIndexKey);
            } catch (TimeoutException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (MemcachedException e) {
                e.printStackTrace();
            }
            if (value != null) {
                if (value instanceof String) {
                    index = Long.parseLong((String) value);
                } else if (value instanceof Long) {
                    index = (Long) value;
                } else {
                    throw new IllegalArgumentException(
                            "Unsupported type [" + value.getClass() + "] found for clear index at cache key [" + clearIndexKey + "]");
                }
            }

            if (index != null) {
                return index;
            }
        }

        return 0L;
    }

    public KeyStrategy getKeyStrategy() {
        return keyStrategy;
    }

    public void setKeyStrategy(KeyStrategy keyStrategy) {
        this.keyStrategy = keyStrategy;
    }
}

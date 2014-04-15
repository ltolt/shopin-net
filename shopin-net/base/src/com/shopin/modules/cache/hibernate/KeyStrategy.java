package com.shopin.modules.cache.hibernate;

/**
 * Strategy interface for parsing the parts used by {@link com.googlecode.hibernate.memcached.MemcachedCache} to generate cache keys.
 *
 * @author Ray Krueger
 */
public interface KeyStrategy {

    String toKey(String regionName, long clearIndex, Object key);
}

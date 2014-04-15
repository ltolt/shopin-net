package com.shopin.modules.cache.hibernate;

import com.shopin.modules.cache.hibernate.utils.StringUtils;

/**
 * @author Ray Krueger
 */
public class Md5KeyStrategy extends HashCodeKeyStrategy {
    protected String concatenateKey(String regionName, long clearIndex, Object key) {
        String longKey = super.concatenateKey(regionName, clearIndex, key);
        return StringUtils.md5Hex(longKey);
    }
}

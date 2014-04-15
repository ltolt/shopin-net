package com.shopin.modules.cache.hibernate;

/**
 * Simply transforms the key object using String.valueOf()
 *
 * @author Ray Krueger
 */
public class StringKeyStrategy extends AbstractKeyStrategy {

    protected String transformKeyObject(Object key) {
        String stringKey = String.valueOf(key);
        log.debug("Transformed key [{}] to string [{}]", key, stringKey);
        return stringKey;
    }

}

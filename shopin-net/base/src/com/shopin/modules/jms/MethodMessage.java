package com.shopin.modules.jms;

import java.io.Serializable;
import java.util.Arrays;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-4-29
 * Time: 11:12:53
 */
public class MethodMessage implements Serializable {

    private String beanName;
    private String method;
    private Object[] arguments;
    private Class[] argsClass;
    private int expire;
    private String cacheKey;

    public String getBeanName() {
        return beanName;
    }

    public void setBeanName(String beanName) {
        this.beanName = beanName;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public Object[] getArguments() {
        return arguments;
    }

    public void setArguments(Object[] arguments) {
        this.arguments = arguments;
    }

    public Class[] getArgsClass() {
        return argsClass;
    }

    public void setArgsClass(Class[] argsClass) {
        this.argsClass = argsClass;
    }

    public int getExpire() {
        return expire;
    }

    public void setExpire(int expire) {
        this.expire = expire;
    }

    public String getCacheKey() {
        return cacheKey;
    }

    public void setCacheKey(String cacheKey) {
        this.cacheKey = cacheKey;
    }

    @Override
    public String toString() {
        return "MethodMessage{" +
                "beanName='" + beanName + '\'' +
                ", method='" + method + '\'' +
                ", arguments=" + (arguments == null ? null : Arrays.asList(arguments)) +
                ", expire=" + expire +
                ", cacheKey='" + cacheKey + '\'' +
                '}';
    }
}

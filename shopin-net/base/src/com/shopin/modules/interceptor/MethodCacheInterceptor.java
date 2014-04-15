package com.shopin.modules.interceptor;

import com.shopin.modules.jms.MethodMessageProducer;
import com.shopin.modules.utils.Codec;
import net.rubyeye.xmemcached.MemcachedClient;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.BeansException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationContext;

import javax.annotation.Resource;
import java.lang.reflect.Method;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2008-11-13
 * Time: 15:37:49
 */
public class MethodCacheInterceptor implements MethodInterceptor, ApplicationContextAware, InitializingBean {

    private MemcachedClient masterCacheClient = null;
    private MemcachedClient slaveCacheClient = null;
    private boolean useSecondCache = false;
//    private MethodMessageProducer methodMessageProducer = null;

    private static ApplicationContext applicationContext;

    public void setApplicationContext(ApplicationContext context) throws BeansException {
        applicationContext = context;
    }

    public boolean isUseSecondCache() {
        return useSecondCache;
    }

    public void setUseSecondCache(boolean useSecondCache) {
        this.useSecondCache = useSecondCache;
    }

    /**
     * Checks if required attributes are provided.
     */
    public void afterPropertiesSet() throws Exception {
        try {
            masterCacheClient = (MemcachedClient) applicationContext.getBean("masterCacheClient");
            slaveCacheClient = (MemcachedClient) applicationContext.getBean("slaveCacheClient");
//            methodMessageProducer = (MethodMessageProducer) applicationContext.getBean("methodMessageProducer");
        } catch (Exception e) {
        }
        Assert.notNull(masterCacheClient, "A cache is required. Use setCache(Cache) to provide one.");
        Assert.notNull(slaveCacheClient, "A cache is required. Use setCache(Cache) to provide one.");
    }

    /**
     * main method
     * caches method result if method is configured for caching
     * method results must be serializable
     */
    public Object invoke(MethodInvocation invocation) throws Throwable {
        String targetName = invocation.getThis().getClass().getName();
        String methodName = invocation.getMethod().getName();
        Object[] arguments = invocation.getArguments();
        Class[] cs = new Class[arguments.length];
        for (int k = 0; k < arguments.length; k++) {
            if (arguments[k] != null) {
                cs[k] = arguments[k].getClass();
            } else {
                cs[k] = null;
            }
        }

        if (invocation.getThis().getClass().getCanonicalName().contains("$Proxy")) {
            return invocation.proceed();
        } else {
            if (invocation.getThis().getClass().isAnnotationPresent(ObjectCache.class)) {
                ObjectCache oc = invocation.getThis().getClass().getAnnotation(ObjectCache.class);
                return getResult(targetName, methodName, arguments, invocation, oc.expire());
            } else {
                Method[] mss = invocation.getThis().getClass().getMethods();
                Method ms = null;
                for (Method m : mss) {
                    if (m.getName().equals(methodName)) {
                        boolean argMatch = true;
                        Class[] tmpCs = m.getParameterTypes();
                        if (tmpCs.length != cs.length) {
                            argMatch = false;
                            continue;
                        }
                        for (int k = 0; k < cs.length; k++) {
                            if (!tmpCs[k].equals(cs[k]) && cs[k] != null) {
                                argMatch = false;
                                break;
                            }
                        }
                        if (argMatch) {
                            ms = m;
                            break;
                        }
                    }
                }

                if (ms != null && ms.isAnnotationPresent(MethodCache.class)) {
                    MethodCache mc = ms.getAnnotation(MethodCache.class);
                    return getResult(targetName, methodName, arguments, invocation, mc.expire());
                } else {
                    return invocation.proceed();
                }
            }
        }
    }

    private Object getResult(String targetName, String methodName, Object[] arguments,
                             MethodInvocation invocation, int expire) throws Throwable {
        Object result = null;
        String cacheKey = getCacheKey(targetName, methodName, arguments);
        try {
            result = masterCacheClient.get(cacheKey,500);           //增加超时时间，当获取不到数据时返回异常，直接从数据库返回
            if (result == null) {
                if (useSecondCache) {
                    result = slaveCacheClient.get(cacheKey,500);    //增加超时时间，当获取不到数据时返回异常，直接从数据库返回
                    if (result != null) {
//                        MethodMessage methodMessage = new MethodMessage();
//                        if (invocation.getThis().getClass().isAnnotationPresent(Component.class)) {
//                            Component component = invocation.getThis().getClass().getAnnotation(Component.class);
//                            methodMessage.setBeanName(component.value());
//                        } else if (invocation.getThis().getClass().isAnnotationPresent(Service.class)) {
//                            Service service = invocation.getThis().getClass().getAnnotation(Service.class);
//                            methodMessage.setBeanName(service.value());
//                        } else if (invocation.getThis().getClass().isAnnotationPresent(Repository.class)) {
//                            Repository repository = invocation.getThis().getClass().getAnnotation(Repository.class);
//                            methodMessage.setBeanName(repository.value());
//                        }
//                        methodMessage.setCacheKey(cacheKey);
//                        methodMessage.setExpire(expire);
//                        methodMessage.setMethod(methodName);
//                        methodMessage.setArguments(invocation.getArguments());
//                        methodMessage.setArgsClass(getArgsClass(invocation.getArguments()));
//                        methodMessageProducer.proceedMethod(methodMessage);
                    } else {
                        result = invocation.proceed();
                        masterCacheClient.add(cacheKey, expire, result);
                        slaveCacheClient.replace(cacheKey, 2 * expire, result);
                    }
                } else {
                    //masterCacheClient.delete(cacheKey);
                    result = invocation.proceed();
                    masterCacheClient.add(cacheKey, expire, result);
                }
            }
        } catch (Exception e) {
            try {
                result = invocation.proceed();
            } catch (Exception ex) {
            }
        }
        return result;
    }

    /**
     * creates cache key: targetName.methodName.argument0.argument1...
     */
    private String getCacheKey(String targetName,
                               String methodName,
                               Object[] arguments) {
        StringBuffer sb = new StringBuffer();
        sb.append(targetName).append(".").append(methodName);
        if ((arguments != null) && (arguments.length != 0)) {
            for (int i = 0; i < arguments.length; i++) {
                if (arguments[i] != null) {
                    sb.append(".").append(arguments[i].toString());
                }
            }
        }
        return Codec.encodeMd5(sb.toString());
    }

    private Class[] getArgsClass(Object[] arguments) {
        Class[] argsClass = new Class[arguments.length];
        if ((arguments != null) && (arguments.length != 0)) {
            for (int i = 0; i < arguments.length; i++) {
                try {
                    argsClass[i] = arguments[i].getClass();
                } catch (Exception e) {
                    argsClass[i] = String.class;
                }
            }
        }
        return argsClass;
    }

    public void destroy() {
        try {
            masterCacheClient.shutdown();
            slaveCacheClient.shutdown();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

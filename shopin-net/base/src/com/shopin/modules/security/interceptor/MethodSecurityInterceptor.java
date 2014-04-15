package com.shopin.modules.security.interceptor;

import com.shopin.modules.security.exception.UnLoginException;
import com.shopin.modules.utils.Codec;
import net.rubyeye.xmemcached.MemcachedClient;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.util.Assert;
import org.springframework.web.util.UrlPathHelper;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2008-11-13
 * Time: 15:37:49
 */
public class MethodSecurityInterceptor implements MethodInterceptor, ApplicationContextAware, InitializingBean {

    private MemcachedClient methodSecurityClient = null;

    private static ApplicationContext applicationContext;

    public void setApplicationContext(ApplicationContext context) throws BeansException {
        applicationContext = context;
    }

    /**
     * Checks if required attributes are provided.
     */
    public void afterPropertiesSet() throws Exception {
        try {
            if (methodSecurityClient == null) {
                methodSecurityClient = (MemcachedClient) applicationContext.getBean("methodSecurityClient");
            }
        } catch (Exception e) {
        }
        Assert.notNull(methodSecurityClient, "A cache is required. Use setCache(Cache) to provide one.");
    }

    public MemcachedClient getMethodSecurityClient() {
        return methodSecurityClient;
    }

    public void setMethodSecurityClient(MemcachedClient methodSecurityClient) {
        this.methodSecurityClient = methodSecurityClient;
    }

    /**
     * main method
     * caches method list if method is configured for caching
     * method results must be serializable
     */
    public Object invoke(MethodInvocation invocation) throws Throwable {
        Method method = invocation.getMethod();
        HttpServletRequest request = null;
        if (invocation.getThis().getClass().isAnnotationPresent(ObjectSecurity.class)) {
            request = getRequest(invocation);
            if (request != null) {
                return checkLogin(request, invocation);
            } else {
                if (request.getMethod().toUpperCase().equals("POST")) {
                    String url = request.getHeader("referer");
                    request.setAttribute("forward", url);
                } else {
                    request.setAttribute("forward", request.getRequestURL());
                }

                throw new RuntimeException(method.getName() + "方法错误，参数中未加入HttpServletRequest类型参数");
            }
        } else if (method != null && method.isAnnotationPresent(MethodSecurity.class)) {
            MethodSecurity ms = method.getAnnotation(MethodSecurity.class);
            request = getRequest(invocation);
            if (request != null) {
                return checkLogin(request, invocation);
            } else {
                if (request.getMethod().toUpperCase().equals("POST")) {
                    String url = request.getHeader("referer");
                    request.setAttribute("forward", url);
                } else {
                    request.setAttribute("forward", request.getRequestURL());
                }
                throw new RuntimeException(method.getName() + "方法错误，参数中未加入HttpServletRequest类型参数");
            }
        } else {
            return invocation.proceed();
        }
    }

    private boolean getResult(String key) throws Throwable {

        try {
            Object result = methodSecurityClient.get(Codec.encodeMd5(key));
            if (result != null) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }

    public Object checkLogin(HttpServletRequest request, MethodInvocation invocation) throws Throwable {
        Cookie cookie = WebUtils.getCookie(request, "userTicket");
        String userTicket = null;
        if (cookie != null) {
            userTicket = cookie.getValue();
        }
        if (userTicket != null && getResult(userTicket)) {
            return invocation.proceed();
        } else {
            if (request.getMethod().toUpperCase().equals("POST")) {
                String url = request.getHeader("referer");
//                request.setAttribute("forward", url);
                return "redirect:/login.html?forward="+url;
            } else {
//                request.setAttribute("forward", new UrlPathHelper().getPathWithinApplication(request));
                return "redirect:/login.html?forward="+new UrlPathHelper().getPathWithinApplication(request);
            }
//            throw new UnLoginException();
        }

    }


    private HttpServletRequest getRequest(MethodInvocation invocation) {
        HttpServletRequest request = null;
        Object[] args = invocation.getArguments();
        for (int i = 0; i < args.length; i++) {
            if (args[i] instanceof HttpServletRequest) {
                request = (HttpServletRequest) args[i];
                return request;
            }
        }
        return null;
    }

    public void destroy() {
        try {
            methodSecurityClient.shutdown();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

package com.shopin.modules.security.jcaptcha;

import com.octo.captcha.Captcha;
import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.captchastore.CaptchaAndLocale;
import com.octo.captcha.service.captchastore.CaptchaStore;
import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeoutException;
/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-1-21
 * Time: 20:52:11
 */
public class MemcacheCaptchaStore implements CaptchaStore {

    private MemcachedClient memcachedClient = null;

    public MemcachedClient getMemcachedClient() {
        return memcachedClient;
    }

    public void setMemcachedClient(MemcachedClient memcachedClient) {
        this.memcachedClient = memcachedClient;
    }

    public MemcacheCaptchaStore() {
        initAndStart();
    }

    public MemcacheCaptchaStore(MemcachedClient cache) {
        memcachedClient = cache;
    }

    /**
     * Check if a captcha is stored for this id
     *
     * @return true if a captcha for this id is stored, false otherwise
     */
    public boolean hasCaptcha(String id) {
        try {
            Object obj = memcachedClient.get(id);
            return obj != null ;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Store the captcha with the provided id as key. The key is assumed to be unique, so if the same key is used twice
     * to store a captcha, the store will return an exception
     *
     * @param id      the key
     * @param captcha the captcha
     *
     * @throws com.octo.captcha.service.CaptchaServiceException
     *          if the captcha already exists, or if an error occurs during storing routine.
     */
    public void storeCaptcha(String id, Captcha captcha) throws CaptchaServiceException {
        try {
            memcachedClient.add(id,180000,new CaptchaAndLocale(captcha));
        } catch (Exception e) {
            throw new CaptchaServiceException("");
        }
    }

    /**
     * Store the captcha with the provided id as key. The key is assumed to be unique, so if the same key is used twice
     * to store a captcha, the store will return an exception
     *
     * @param id      the key
     * @param captcha the captcha
     * @param locale  the locale used that triggers the captcha generation
     * @throws com.octo.captcha.service.CaptchaServiceException
     *          if the captcha already exists, or if an error occurs during storing routine.
     */
    public void storeCaptcha(String id, Captcha captcha, Locale locale) throws CaptchaServiceException {
        try {
            memcachedClient.add(id,180000,new CaptchaAndLocale(captcha));
        } catch (Exception e) {
            throw new CaptchaServiceException("");
        }
    }

    /**
     * Retrieve the captcha for this key from the store.
     *
     * @return the captcha for this id
     *
     * @throws CaptchaServiceException if an error occurs during retrieving routine.
     */
    public Captcha getCaptcha(String id) throws CaptchaServiceException {

        try {
            Object obj = memcachedClient.get(id);
            if (obj != null) {
                return ((CaptchaAndLocale) obj).getCaptcha();
            } else {
                return null;
            }
        } catch (Exception e) {
             throw new CaptchaServiceException("");
        }
    }


    /**
     * Retrieve the locale for this key from the store.
     *
     * @return the locale for this id, null if not found
     * @throws com.octo.captcha.service.CaptchaServiceException
     *          if an error occurs during retrieving routine.
     */
    public Locale getLocale(String id) throws CaptchaServiceException {

        try {
            Object obj = memcachedClient.get(id);
            if (obj != null) {
                return ((CaptchaAndLocale) obj).getLocale();
            } else {
                return null;
            }
        } catch (Exception e) {
            throw new CaptchaServiceException("");
        }
    }

    /**
     * Remove the captcha with the provided id as key.
     *
     * @param id the key
     *
     * @return true if found, false otherwise
     *
     * @throws CaptchaServiceException if an error occurs during remove routine
     */
    public boolean removeCaptcha(String id) {
        try {
            //return memcachedClient.delete(id);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /**
     * get the size of this store
     */
    public int getSize() {
         return 1;
    }

    /**
     * Return all the contained keys
     */
    public Collection getKeys() {
         return null;
    }

    /**
     * Empty the store
     */
    public void empty() {
    }

    public void initAndStart() {
    }

    public void cleanAndShutdown() {
        try {
            memcachedClient.shutdown();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}

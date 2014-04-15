/**
 * @Probject Name: business
 * @Path: net.shopin.service.MemcachedTest.java
 * @Create By kongm
 * @Create In 2013-7-11 下午3:06:00
 * TODO
 */
package net.shopin.service;

import java.net.InetSocketAddress;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.TimeoutException;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;

import com.shopin.modules.utils.Codec;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;
import net.shopin.base.BaseTestContext;

/**
 * @Class Name MemcachedTest
 * @Author kongm
 * @Create In 2013-7-11
 */
public class MemcachedTest extends BaseTestContext {

	@Resource(name = "masterCacheClient")
	private MemcachedClient memcachedClient;

	@Test
	public void test(){
		Assert.assertNotNull(this.memcachedClient);
		try {
			Object obj =  memcachedClient.get(getCacheKey("net.shopin.service.ProductServiceImpl", "getProduct", "7584281"),100000);
			System.out.println(obj);
		} catch (TimeoutException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MemcachedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private String getCacheKey(String targetName, String methodName,
			String arguments) {
		StringBuffer sb = new StringBuffer();
		sb.append(targetName).append(".").append(methodName);
		sb.append(".").append(arguments);
		return Codec.encodeMd5(sb.toString());
	}

}

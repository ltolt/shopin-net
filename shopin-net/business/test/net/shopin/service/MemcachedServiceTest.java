/**
 * @Probject Name: business
 * @Path: net.shopin.service.MemcachedServiceTest.java
 * @Create By kongm
 * @Create In 2013-9-13 下午5:28:46
 * TODO
 */
package net.shopin.service;

import java.util.Map;
import java.util.concurrent.TimeoutException;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.util.Assert;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;
import net.shopin.base.BaseTestContext;
import net.shopin.view.Cart;
import net.sso.domain.dto.MemberDTO;

/**
 * @Class Name MemcachedServiceTest
 * @Author kongm
 * @Create In 2013-9-13
 */
public class MemcachedServiceTest extends BaseTestContext {
	
	
	@Resource(name = "cartCacheClient")
	MemcachedClient cartCache;
	
	@Test
	public void testGetStats() throws MemcachedException, InterruptedException, TimeoutException{
		MemberDTO dto = (MemberDTO)this.cartCache.get("391ce7a4b8d22-7d9e-425a-b965-72f385c05fff");
		System.out.println(dto);
	}
	
	
	@Test
	public void test() throws TimeoutException, InterruptedException, MemcachedException{
		Assert.notNull(this.cartCache);
		try {
			Cart cart = new Cart();
			cart.setCartId("11");
			this.cartCache.add("cart16", 0, cart);
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		}
		Cart obj;
		int count = 0;
		for(int i = 0;i<1000;i++){
			obj = (Cart)this.cartCache.get("cart16");
			System.out.println(obj.getCartId());
			if(obj==null)count ++;
		}
		System.out.println(count);
		
		
		
		
	}
	

}

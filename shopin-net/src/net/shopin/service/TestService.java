package net.shopin.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import base.framework.cache.interceptor.MethodCache;

@Service("testService")
@Transactional(readOnly = true)
public class TestService {
	
	/**
	 * 测试缓存策略
	 * @return
	 */
	@MethodCache(expire=60*60)
	@Transactional(readOnly = true)
	public String testSysCache(){
		System.out.println("log into cache");
		
		return new String("kongming");
	}
	
	
	
	
	
	
	

}

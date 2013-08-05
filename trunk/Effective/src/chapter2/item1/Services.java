/**
 * ËµÃ÷:
 *     Noninstantiable class for service registration and access
 * @Probject Name: Effective
 * @Path: chapter2.item1.Services.java
 * @Create By kongm
 * @Create In 2013-8-5 ÏÂÎç2:50:11
 * TODO
 */
package chapter2.item1;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Class Name Services
 * @Author kongm
 * @Create In 2013-8-5
 */
public class Services {
	
	private Services(){
		
	}
	//
	private static final Map<String,Provider> providers = new ConcurrentHashMap<String, Provider>();
	private static final String DEFAULT_PROVIDER_NAME = "<def>";
	//provider registration API
	public static void registerDefaultProvider(Provider p){
		registerProvider(DEFAULT_PROVIDER_NAME, p);
	}
	
	public static void registerProvider(String name,Provider p){
		providers.put(name, p);
	}
	
	//service access API
	public static Service newInstance(){
		return newInstance(DEFAULT_PROVIDER_NAME);
	}
	
	public static Service newInstance(String name){
		Provider p = providers.get(name);
		if(p == null){
			throw new IllegalArgumentException("No provider registered with name: " + name);
		}
		return p.newService();
	}
	
	
	
	
	
	
	
	
	
	
	

}

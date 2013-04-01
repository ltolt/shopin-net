package base.framework.jms;

import java.io.Serializable;
import java.util.Arrays;

public class MethodMessage implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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
		return String
				.format("MethodMessage :{beanName:'%s', method:'%s', arguments:'%s', argsClass:'%s', expire:'%s', cacheKey:'%s}",
						beanName, method, Arrays.toString(arguments),
						Arrays.toString(argsClass), expire, cacheKey);
	}
	
	
	
	
	
	
	
	
	
	
	

}

package net.shopin.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

import com.shopin.core.util.LoadProperties;

/** */
/**
 * 
 * 此类在初始化时，应该取到所有资源及其对应角色的定义
 * 
 * @author Robin
 * 
 */
public class MyInvocationSecurityMetadataSource implements
		FilterInvocationSecurityMetadataSource {
	private UrlMatcher urlMatcher = new AntUrlPathMatcher();;
	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;

	public MyInvocationSecurityMetadataSource() {
		loadResourceDefine();
	}

	private void loadResourceDefine() {
		resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
		String systemRole = LoadProperties.readValue("systemRole");
		String[] roles=systemRole.split(",");
		for(int i=0;i<roles.length;i++){
			ConfigAttribute ca = new SecurityConfig(roles[i]);
			atts.add(ca);
		}
		resourceMap.put("/menu.do", atts);
//		resourceMap.put("/success.jsp", atts);
	}

	// According to a URL, Find out permission configuration of this URL.
	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		// guess object is a URL.
		String url = ((FilterInvocation) object).getRequestUrl();
		Iterator<String> ite = resourceMap.keySet().iterator();
		while (ite.hasNext()) {
			String resURL = ite.next();
			if (urlMatcher.pathMatchesUrl(resURL, url)) {
				return resourceMap.get(resURL);
			}
		}
		return null;
	}

	public boolean supports(Class<?> clazz) {
		return true;
	}

	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

}
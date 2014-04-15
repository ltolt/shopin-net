package com.shopin.modules.webservice;

import com.shopin.modules.utils.DozerMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.PostConstruct;

/**
 * 可选的WebService辅助基类.
 * 暂时只提供了公共的logger和dozer及转换未知错误的方法,日后将提供更多公共能力.
 * 
 */
public abstract class WebServiceSupport {

	protected final Logger logger = LoggerFactory.getLogger(getClass());

	/*protected DozerBeanMapper dozer;

	public void setDozer(DozerBeanMapper dozer) {
		this.dozer = dozer;
	}*/

	@PostConstruct
	public void initDozer() {
		// 如果Spring初始化后dozer未注入,获取无配置文件的mapper单例.
		/*if (dozer == null) {
			logger.info("Spring未注入dozer mapper,使用无配置文件的默认dozer.");
			dozer = DozerMapper.getInstance();
		}*/
	}
}

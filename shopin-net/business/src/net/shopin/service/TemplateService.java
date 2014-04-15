/**
 * @Probject Name: business
 * @Path: net.shopin.serviceTemplateService.java
 * @Create By shiying
 * @Create In 2013-7-16 上午11:55:24
 * TODO
 */
package net.shopin.service;

import com.shopin.modules.interceptor.ObjectCache;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import java.io.StringWriter;
import java.util.List;
import java.util.Map;
import net.shopin.api.ITemplateService;
import net.shopin.entity.PageLayoutTemplate;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name TemplateService
 * @Author shiying
 * @Create In 2013-7-16
 */

@Transactional(readOnly = true)
@Component("templateService")
@Scope("prototype")
@ObjectCache(expire = 3600)
public class TemplateService implements ITemplateService {

	protected final Logger log = LoggerFactory.getLogger(getClass());

	private static Configuration cfg = new Configuration();
	private static boolean init = false;
	private SimpleHibernateDao<PageLayoutTemplate, Long> pageLayoutTemplateDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.pageLayoutTemplateDao = new SimpleHibernateDao(sessionFactory,
				PageLayoutTemplate.class);
	}

	public String getTemplate(String name, Map map) {
		if (!init) {
			initialize();
		}
		StringWriter result = new StringWriter();
		Template template = null;
		try {
			template = cfg.getTemplate(name);
			template.process(map, result);
		} catch (Exception e) {
			this.log.error(e.getMessage(), e);
			return "";
		}
		return result.getBuffer().toString();
	}

	@Transactional(readOnly = true)
	public void initialize() {
		StringTemplateLoader stringLoader = new StringTemplateLoader();
		List list = this.pageLayoutTemplateDao.getAll();
		for (int i = 0; i < list.size(); i++) {
			PageLayoutTemplate pageLayoutTemplate = (PageLayoutTemplate) list
					.get(i);
			stringLoader.putTemplate(pageLayoutTemplate.getName(),
					pageLayoutTemplate.getTemplate());
		}
		cfg.setTemplateLoader(stringLoader);
		cfg.setDefaultEncoding("UTF-8");
		init = false;
	}

	public void reload() {
		init = false;
	}

}

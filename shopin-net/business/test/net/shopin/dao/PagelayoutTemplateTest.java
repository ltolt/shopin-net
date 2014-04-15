/**
 * @Probject Name: business
 * @Path: net.shopin.dao.PagelayoutTemplateTest.java
 * @Create By wangdg
 * @Create In 2013-7-9 下午2:45:20
 * TODO
 */
package net.shopin.dao;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.PageLayoutTemplate;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name PagelayoutTemplateTest
 * @Author wangdg
 * @Create In 2013-7-9
 */
public class PagelayoutTemplateTest extends BaseTestContext {

	private SimpleHibernateDao<PageLayoutTemplate, Integer> pageLayoutTemplateDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){
		pageLayoutTemplateDao = new SimpleHibernateDao<PageLayoutTemplate, Integer>(sessionFactory,PageLayoutTemplate.class);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testInsert(){
		PageLayoutTemplate pageLayoutTemplate = new PageLayoutTemplate();
		pageLayoutTemplate.setMemo("测试");
		pageLayoutTemplate.setName("测试");
		this.pageLayoutTemplateDao.save(pageLayoutTemplate);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testUpdate(){
		PageLayoutTemplate pageLayoutTemplate = new PageLayoutTemplate();
		pageLayoutTemplate.setSid(51);
		pageLayoutTemplate.setMemo("测试23");
		pageLayoutTemplate.setName("测试23");
		this.pageLayoutTemplateDao.save(pageLayoutTemplate);
		System.out.println(pageLayoutTemplate.getMemo());
	}
	@Test
	@Transactional
	@Rollback(false)
	public void testQuery(){
		System.out.println(this.pageLayoutTemplateDao.findByUnique("sid", 1));
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testDelete(){
		this.pageLayoutTemplateDao.delete(51);
	}
}

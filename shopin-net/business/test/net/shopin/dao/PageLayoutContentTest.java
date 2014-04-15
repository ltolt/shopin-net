/**
 * @Probject Name: business
 * @Path: net.shopin.dao.PageLayoutContentTest.java
 * @Create By wangdg
 * @Create In 2013-7-9 下午2:25:21
 * TODO
 */
package net.shopin.dao;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.PageLayout;
import net.shopin.entity.PageLayoutContent;

/**
 * @Class Name PageLayoutContentTest
 * @Author wangdg
 * @Create In 2013-7-9
 */
public class PageLayoutContentTest extends BaseTestContext{
	
	private SimpleHibernateDao<PageLayoutContent, Integer> pageLayoutContentDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){
		pageLayoutContentDao = new SimpleHibernateDao<PageLayoutContent, Integer>(sessionFactory,PageLayoutContent.class);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testQuery(){
		System.out.println(this.pageLayoutContentDao.findByUnique("sid", 4));
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testInsert(){
		PageLayoutContent pageLayoutContent = new PageLayoutContent();
		pageLayoutContent.setLink("测试");
		PageLayout pageLayout = new PageLayout();
		pageLayout.setSid(69992);
		pageLayoutContent.setPageLayout(pageLayout);
		this.pageLayoutContentDao.save(pageLayoutContent);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testDelete(){
		this.pageLayoutContentDao.delete(6);
	}
}

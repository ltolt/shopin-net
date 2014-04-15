/**
 * @Probject Name: business
 * @Path: net.shopin.dao.PageLayoutTest.java
 * @Create By wangdg
 * @Create In 2013-7-9 上午11:32:03
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
import net.shopin.entity.ShopChannels;


/**
 * @Class Name PageLayoutTest
 * @Author wangdg
 * @Create In 2013-7-9
 */
public class PageLayoutTest extends BaseTestContext {

	private SimpleHibernateDao<PageLayout, Integer> pageLayoutDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){
	pageLayoutDao = new SimpleHibernateDao<PageLayout, Integer>(sessionFactory,PageLayout.class);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testInsert(){
		PageLayout pageLayout = new PageLayout();
		pageLayout.setSid(69992);
		pageLayout.setPageLayout(pageLayout);
		pageLayout.setChannelSid(2);
		pageLayout.setTitle("测试33322");
		this.pageLayoutDao.save(pageLayout);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testQuery(){
	//	PageLayout pageLayout = new PageLayout();
		//pageLayout.setChannelSid(2);
		System.out.println(this.pageLayoutDao.findByUnique("sid", 70006));
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testDelete(){
		this.pageLayoutDao.delete(69988);
	}
	
	
}

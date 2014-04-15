/**
 * @Probject Name: business
 * @Path: net.shopin.dao.ProConSearchTest.java
 * @Create By wangdg
 * @Create In 2013-7-9 下午3:30:45
 * TODO
 */
package net.shopin.dao;

import org.apache.tomcat.jni.Proc;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.ProConSearch;

/**
 * @Class Name ProConSearchTest
 * @Author wangdg
 * @Create In 2013-7-9
 */
public class ProConSearchTest extends BaseTestContext{
	
	private SimpleHibernateDao<ProConSearch,Integer> proConSearHibernateDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){
		proConSearHibernateDao = new SimpleHibernateDao<ProConSearch, Integer>(sessionFactory,ProConSearch.class);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testInsert(){
		ProConSearch proConSearch = new ProConSearch();
		proConSearch.setBrandSid(1111);
		proConSearch.setOffMin(0.3);
		proConSearch.setProSku("测试");
		proConSearch.setPageLayoutSid(69992);
		this.proConSearHibernateDao.save(proConSearch);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testQuery(){
		System.out.println(this.proConSearHibernateDao.findByUnique("sid", 1));
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testDelete(){
		this.proConSearHibernateDao.delete(1);
	}
	
}

package net.shopin.dao;


import net.shopin.base.BaseTestContext;
import net.shopin.entity.WoMai;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

public class WoMaiTest extends BaseTestContext{
	
	private SimpleHibernateDao<WoMai, Integer> woMaiDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		woMaiDao = new SimpleHibernateDao<WoMai, Integer>(sessionFactory, WoMai.class);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testInsert() {
		Criteria criteria = this.woMaiDao.createCriteria(new Criterion[0]);
		WoMai womai  = (WoMai) criteria.add(Restrictions.eq("flag", 0)).addOrder(Order.desc("sid")).setMaxResults(1).uniqueResult();
		System.out.println(womai);
	}
	public void testUpdate() {
		
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testSelect() {
	}
	public void testDelete() {
		
	}
}

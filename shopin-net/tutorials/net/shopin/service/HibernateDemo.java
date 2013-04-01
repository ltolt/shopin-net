package net.shopin.service;

import java.util.HashMap;
import java.util.List;

import net.shopin.entity.ProductClass;
import net.shopin.entity.ProductList;
import net.shopin.view.ProductVO;

import org.hibernate.FetchMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import base.framework.orm.Page;
import base.framework.orm.PropertyFilter.MatchType;
import base.framework.orm.hibernate.SimpleHibernateDao;
import base.framework.util.DozerMapper;

/**
 * hibernate demo
 * 
 * @author lucas kong
 * 
 */
@ContextConfiguration(locations = { "classpath*:/applicationContext*.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class HibernateDemo extends
		AbstractTransactionalJUnit4SpringContextTests {

	private SimpleHibernateDao<ProductList, Integer> productDao;

	private SimpleHibernateDao<ProductClass, Integer> productClassDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		productDao = new SimpleHibernateDao<ProductList, Integer>(
				sessionFactory, ProductList.class);
		this.productClassDao = new SimpleHibernateDao<ProductClass, Integer>(sessionFactory,ProductClass.class);
	}
	
	@Test
	@Transactional
	public void testClass(){
		Assert.assertNotNull(this.productClassDao);
		 productClassDao.get(1);
		
		
	}
	
	
	
	
	/**1.hql  
	 * Hibernate uses a powerful query language (HQL) that is similar in
	 * appearance to SQL. Compared with SQL, however, HQL is fully
	 * object-oriented and understands notions like inheritance, polymorphism and
	 * association.
	 * 
	 */
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testHql(){
		Page<ProductList> page = new Page<ProductList>();
		page.setPageNo(2);
//		page =  this.productDao.find(page, "from ProductList");
//		page = this.productDao.find(page, "from ProductList",new HashMap());
		List list  = this.productDao.findBy("sid", 1, MatchType.EQ);
		
		System.out.println(list);
		
//		Long i = (Long) this.productDao.getSession().createQuery("select count(*) from ProductList").uniqueResult();
//		System.out.println(i);
//		Long num  = this.productDao.countHqlResult("from ProductList");
//		System.out.println(num);
		
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void timeType(){
//		List<ProductList> list = this.productDao.getAll();
//		ProductVO vo = new ProductVO();
//		for(ProductList pro : list){
//			System.out.println(pro);
//			DozerMapper.getInstance().map(pro, vo);
//			System.out.println(vo);
//		}
		//1
		ProductList pro = this.productDao.get(1);

		//2
		//		ProductList pro = (ProductList)this.productDao.createCriteria()
//				.add(Restrictions.eq("sid", Integer.valueOf(1)))
//				.setFetchMode("brand", FetchMode.JOIN)
//				.setFetchMode("proDetails", FetchMode.JOIN)
//				.uniqueResult();
				
		System.out.println(pro);
//		System.out.println(pro.getBrand());
//		System.out.println(pro.getProDetails());
		//经过测试发现1和2效果相当
		
	}
	
	
	

}

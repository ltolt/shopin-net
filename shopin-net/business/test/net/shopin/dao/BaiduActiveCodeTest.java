/**
 * @Probject Name: business
 * @Path: net.shopin.dao.BaiduActiveCodeTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午4:35:30
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.BaiduActiveCode;
import net.shopin.entity.PageTemplate;

/**
 * @Class Name BaiduActiveCodeTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class BaiduActiveCodeTest extends BaseTestContext{
	
	private SimpleHibernateDao<BaiduActiveCode, Integer> baiduActiveCodeDao;
	
	  @Autowired
	    public void setSessionFactory(SessionFactory sessionFactory) {
	    	baiduActiveCodeDao = new SimpleHibernateDao<BaiduActiveCode, Integer>(sessionFactory, BaiduActiveCode.class);
	    }
		
//		@Test
//		@Transactional
//		@Rollback(false)
		public void testInsert(){
			Assert.notNull(baiduActiveCodeDao);
			BaiduActiveCode baiduActiveCode = new BaiduActiveCode();
			baiduActiveCode.setCode("测试code");
			baiduActiveCode.setStatus(1);
			baiduActiveCode.setType(1);
			
			this.baiduActiveCodeDao.save(baiduActiveCode);
		}

//		@Test
//		@Transactional
//		@Rollback(false)
		public void testUpdate(){
			BaiduActiveCode baiduActiveCode = this.baiduActiveCodeDao.findByUnique("sid", 1);
			Assert.notNull(baiduActiveCode, "must not be null");
			baiduActiveCode.setCode("更改测试code");
			baiduActiveCode.setStatus(2);
			baiduActiveCode.setType(2);
			
			this.baiduActiveCodeDao.save(baiduActiveCode);
		}
		
		@Test
		@Transactional
		@Rollback(false)
		public void testSelect(){
			List baiduActiveCodeList = this.baiduActiveCodeDao.createCriteria()
					.add(Restrictions.like("code", "code", MatchMode.ANYWHERE))
					.addOrder(Order.asc("sid")).list();;
								
		    for (int i = 0; i < baiduActiveCodeList.size(); i++) {
				System.out.println(((BaiduActiveCode)baiduActiveCodeList.get(i)).getCode());
			}
			System.out.println(baiduActiveCodeList);
		}
		
		@Test
		@Transactional
		@Rollback(false)
		public void testDelete(){
			BaiduActiveCode baiduActiveCode = this.baiduActiveCodeDao.findByUnique("sid", 3);
			Assert.notNull(baiduActiveCode);
			this.baiduActiveCodeDao.delete(baiduActiveCode);
		}
}

/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.dao.DeliProvinceTest.java
 * @Create By jingpeng
 * @Create In 2013-6-9 下午2:03:02
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.DeliCity;
import net.shopin.entity.DeliProvince;

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

/**
 * @Desc  deli_province表的测试类(命名规范 entity + Test)
 * @Class Name DeliProvinceTest
 * @Author jingpeng
 * @Create In 2013-7-10
 */
public class DeliProvinceTest extends BaseTestContext{
	
    private SimpleHibernateDao<DeliProvince, Integer> deliProvinceDao;
    
	
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
    	 deliProvinceDao = new SimpleHibernateDao<DeliProvince, Integer>(sessionFactory, DeliProvince.class);
    }
    
//    @Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		Assert.notNull(this.deliProvinceDao);
		DeliProvince deliProvince = new DeliProvince();
		deliProvince.setProvince("上海");
		this.deliProvinceDao.save(deliProvince);

	}

    
//    @Test
//    @Transactional
//    @Rollback(false)
    public void testUpdate(){
    	DeliProvince deliProvince = this.deliProvinceDao.findByUnique("sid", 8l);
    	deliProvince.setProvince("黑龙江");
    	this.deliProvinceDao.save(deliProvince);
    }
    
    
    @Test
    @Transactional
    @Rollback(false)
    public void testSelect(){
    	List deliProvinceList = this.deliProvinceDao.createCriteria().add(Restrictions.like("province","天",MatchMode.ANYWHERE))
				.addOrder(Order.asc("sid")).list();
    	System.out.println(deliProvinceList);
    }
    
//    @Test
//    @Transactional
//    @Rollback(false)
    public void testDelete(){
    	DeliProvince deliProvince = this.deliProvinceDao.findByUnique("sid", 5l);
    	Assert.notNull(deliProvince, "must not be null");
    	this.deliProvinceDao.delete(deliProvince);
    }
}

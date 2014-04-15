/**
 * @Probject Name: business
 * @Path: net.shopin.dao.RefundapplyinfoTest.java
 * @Create By admin
 * @Create In 2013-7-10 上午10:55:47
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.Refundapplyinfo;
import net.shopin.entity.Refundreson;

public class RefundapplyinfoTest extends BaseTestContext{
    private SimpleHibernateDao<Refundapplyinfo, Integer> refundapplyinfoDao;
    private SimpleHibernateDao<Refundreson, Integer> refundresonDao;
    
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
	refundapplyinfoDao = new SimpleHibernateDao<Refundapplyinfo, Integer>(sessionFactory, Refundapplyinfo.class);
	refundresonDao = new SimpleHibernateDao<Refundreson, Integer>(sessionFactory, Refundreson.class);
    }
    
//    @Test
//    @Transactional
    public void testInsert(){
	Refundapplyinfo refundapplyinfo = new Refundapplyinfo();
	refundapplyinfo.setOrderid("15");
	refundapplyinfo.setProductName("皮鞋");
	Refundreson refundreson = refundresonDao.findByUnique("sid", 1);
	refundapplyinfo.setRefundreson(refundreson);
	refundapplyinfoDao.save(refundapplyinfo);
    }
//    @Test
//    @Transactional
    public void testUpdate(){
	Refundapplyinfo refundapplyinfo = refundapplyinfoDao.findByUnique("sid", 1);
	refundapplyinfo.setProductName("球鞋");
	refundapplyinfoDao.save(refundapplyinfo);
    }
    
//    @Test
//    @Transactional
    public void testSelect(){
	List<Refundapplyinfo> list = refundapplyinfoDao.findBy("orderid", "15");
	for (Refundapplyinfo refundapplyinfo : list) {
	    System.out.println(refundapplyinfo.getProductName());
	}
    }
    @Test
    @Transactional
    public void testDel(){
	Refundapplyinfo refundapplyinfo = refundapplyinfoDao.findByUnique("sid", 1);
	refundapplyinfoDao.delete(refundapplyinfo.getSid());
    }
}

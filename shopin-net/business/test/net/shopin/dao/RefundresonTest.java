package net.shopin.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.Refundreson;

public class RefundresonTest extends BaseTestContext {
    private SimpleHibernateDao<Refundreson, Integer> refundresonDao;
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
	refundresonDao = new SimpleHibernateDao<Refundreson, Integer>(sessionFactory, Refundreson.class);
    }
    
//    @Test
//    @Transactional
    public void testInsert(){
	Refundreson pefundreson = new Refundreson();
	pefundreson.setImgrequire(2);
	pefundreson.setResonType(1);
	pefundreson.setReson("reson");
	refundresonDao.save(pefundreson);
    }
    
//    @Test
//    @Transactional
    public void testUpdate(){
	Refundreson pefundreson = refundresonDao.findByUnique("sid", 2);
	pefundreson.setReson("huyy");
	refundresonDao.save(pefundreson);
    }
    
//    @Test
//    @Transactional
    public void testSelect(){
	List<Refundreson> list = refundresonDao.findBy("resonType", 1);
	
       for (Refundreson refundreson : list) {
	System.out.println(refundreson.getReson());
    }
       
    }
    
    @Test
    @Transactional
    public void testDel(){
	Refundreson pefundreson = refundresonDao.findByUnique("sid", 2);
	refundresonDao.delete(pefundreson.getsid());
    }
}

/**
 * @Probject Name: business
 * @Path: net.shopin.dao.ProReviews.java
 * @Create By jiangzhenxue
 * @Create In 2013-7-10 上午9:46:23
 * TODO
 */
package net.shopin.dao;

import org.hibernate.SessionFactory;
import org.jgroups.tests.perf.Data;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.Members;
import net.shopin.entity.ProReviews;
import net.shopin.entity.SecondaryChannel;
import net.shopin.entity.ShopChannels;

public class ProReviewsTest extends BaseTestContext{
    private SimpleHibernateDao<ProReviews, Integer> proReviewsDao;
    private SimpleHibernateDao<Members, Integer> membersDao;
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
	proReviewsDao = new SimpleHibernateDao<ProReviews, Integer>(sessionFactory, ProReviews.class);
	membersDao = new SimpleHibernateDao<Members, Integer>(sessionFactory, Members.class);
    }
    
//    @Test
//    @Transactional
    public void testInsert(){
	ProReviews proReviews = new ProReviews();
	proReviews.setContent("content");
	proReviews.setIpAddr("attr");
	Members members = membersDao.findByUnique("sid",1);
	proReviews.setMembers(members);
	proReviewsDao.save(proReviews);
    }
    
//    @Test
//    @Transactional
    public void testUpdate(){
	ProReviews proReviews = proReviewsDao.findByUnique("sid", 1);
	Members members = membersDao.findByUnique("sid",2);
	proReviews.setMembers(members);
	proReviewsDao.save(proReviews);
    }
    
//    @Test
//    @Transactional
    public void testSelect(){
	ProReviews proReviews = proReviewsDao.findByUnique("sid", 1);
	System.out.println(proReviews.getMembers().getMemName());
    }
    @Test
    @Transactional
    public void testDel(){
	ProReviews proReviews = proReviewsDao.findByUnique("sid",2);
	proReviewsDao.delete(proReviews.getSid());
    }
    
}

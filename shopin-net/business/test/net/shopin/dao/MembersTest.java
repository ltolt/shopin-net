/**
 * @Probject Name: business
 * @Path: net.shopin.dao.MembersTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午6:35:33
 * TODO
 */
package net.shopin.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.Members;

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
 * @Class Name MembersTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class MembersTest extends BaseTestContext{
	
    private SimpleHibernateDao<Members, Integer> membersDao;
	
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
    	 membersDao = new SimpleHibernateDao<Members, Integer>(sessionFactory, Members.class);
    }
    
//    @Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		Assert.notNull(this.membersDao);
		Members member=new Members();
		member.setMemName("王朝");
		member.setMemEmail("529474065@163.com");
		member.setMemPwd("jingpeng");
		member.setMembersSid(111);
		member.setMemStatus(1);
		Timestamp tt=new Timestamp((new Date()).getTime());
		member.setRegDate(tt);
		member.setLoginDate(tt);
		member.setMemBit(1);
		member.setLoginTimes(5555);
		member.setLoginKey("这是loginKey");
		this.membersDao.save(member);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate(){
		Members member = this.membersDao.findByUnique("sid", 1);
		member.setMemName("荆朋");
		member.setMemEmail("529474065@163.com");
		member.setMemPwd("jingpeng");
		member.setMembersSid(111);
		member.setMemStatus(1);
		Timestamp tt = new Timestamp((new Date()).getTime());
		member.setRegDate(tt);
		member.setLoginDate(tt);
		member.setMemBit(1);
		member.setLoginTimes(5555);
		member.setLoginKey("这是loginKey");
		this.membersDao.save(member);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testSelect(){
		List memberList =  this.membersDao.createCriteria().add(Restrictions.like("memName","荆",MatchMode.ANYWHERE))
							.addOrder(Order.asc("sid")).list();
		System.out.println(memberList);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testDelete(){
		Members member = this.membersDao.findByUnique("sid", 3);
		Assert.notNull(member,"must not be null");
		this.membersDao.delete(member);
	}
}


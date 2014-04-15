/**
 * @Probject Name: business
 * @Path: net.shopin.dao.DqGuessPriceTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午5:33:23
 * TODO
 */
package net.shopin.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.DqGuessPrice;
import net.shopin.entity.Members;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name DqGuessPriceTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class DqGuessPriceTest extends BaseTestContext{
	
	private SimpleHibernateDao<DqGuessPrice, Integer> dqGuessPriceDao;
	private SimpleHibernateDao<Members, Integer> membersDao;
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		dqGuessPriceDao = new SimpleHibernateDao<DqGuessPrice, Integer>(sessionFactory, DqGuessPrice.class);
		membersDao = new SimpleHibernateDao<Members, Integer>(sessionFactory, Members.class);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert() {
		//相关主表查询
		Members member = this.membersDao.findByUnique("sid", 1);
		DqGuessPrice guessPrice = new DqGuessPrice();
		guessPrice.setGuessPrice("999.09");
		guessPrice.setGuessTime(new Timestamp((new Date()).getTime()));
		guessPrice.setMembers(member);
		guessPrice.setMobile("5666543433");
		guessPrice.setName("荆朋");
		guessPrice.setProId("33");
		this.dqGuessPriceDao.save(guessPrice);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate() {
		//相关主表查询
		Members member = this.membersDao.findByUnique("sid", 2);
		DqGuessPrice guessPrice = this.dqGuessPriceDao.findByUnique("sid", 1);
		guessPrice.setGuessPrice("888.09");
		guessPrice.setGuessTime(new Timestamp((new Date()).getTime()));
		guessPrice.setMembers(member);
		guessPrice.setMobile("9110110221");
		guessPrice.setName("王朝");
		guessPrice.setProId("888");
		this.dqGuessPriceDao.save(guessPrice);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testSelect() {
		String hql = "from DqGuessPrice p, Members m where p.membersSid = p.sid and m.sid = ?";
		List list = this.dqGuessPriceDao.find(hql, 1);
		Assert.notNull(list);
    	for(Object obj : list){
			Object[] os = (Object[]) obj;
			for(int i=0;i<os.length;i++){
				Object o = os[i];
				switch(i){
					case 0:
						System.out.println(o);
						break;
					case 1:
						System.out.println(o);
						break;
				}
			}
		}
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testDelete() {
		DqGuessPrice price = this.dqGuessPriceDao.findByUnique("sid", 3);
		Assert.notNull(price);
		this.dqGuessPriceDao.delete(price);
	}
}

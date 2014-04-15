/**
 * @Probject Name: business
 * @Path: net.shopin.dao.DqAwardTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午5:31:52
 * TODO
 */
package net.shopin.dao;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.DqAward;
import net.shopin.entity.Members;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name DqAwardTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class DqAwardTest extends BaseTestContext{
	
	private SimpleHibernateDao<DqAward, Integer> dqAwardDao;
	private SimpleHibernateDao<Members, Integer> membersDao;
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		dqAwardDao = new SimpleHibernateDao<DqAward, Integer>(sessionFactory, DqAward.class);
		membersDao = new SimpleHibernateDao<Members, Integer>(sessionFactory, Members.class);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert() {
		//相关表查询
		Members member = this.membersDao.findByUnique("sid", 1);
		Assert.notNull(member);
		DqAward dqAward = new DqAward();
		dqAward.setFillTime(new Timestamp((new Date()).getTime()));
		dqAward.setFlag("00");
		dqAward.setMembers(member);
		dqAward.setOrderNo("23423490");
		dqAward.setReceptName("荆朋");
		dqAward.setReceptPhone("18612054160");
		dqAward.setSaleMoneySum(new BigDecimal(222.22));
		
		this.dqAwardDao.save(dqAward);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate() {
		//相关表查询
		Members member = this.membersDao.findByUnique("sid", 2);
		Assert.notNull(member);
		DqAward dqAward = this.dqAwardDao.findByUnique("sid", 4);
		Assert.notNull(dqAward);
		dqAward.setFillTime(new Timestamp((new Date()).getTime()));
		dqAward.setFlag("01");
		dqAward.setMembers(member);
		dqAward.setOrderNo("9899765446");
		dqAward.setReceptName("王朝");
		dqAward.setReceptPhone("18612054160");
		dqAward.setSaleMoneySum(new BigDecimal(111.11));
		
		this.dqAwardDao.save(dqAward);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testSelect() {
		String hql = "from DqAward ward, Members m where ward.membersSid = m.sid and m.sid = ?";
		List list = this.dqAwardDao.find(hql, 2);
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
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete() {
		DqAward dqAward = this.dqAwardDao.findByUnique("sid", 3);
		Assert.notNull(dqAward);
		this.dqAwardDao.delete(dqAward);
	}
}

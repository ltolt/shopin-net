/**
 * @Probject Name: business
 * @Path: net.shopin.dao.DqGreatMemberTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午5:32:33
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.DqGreatMember;
import net.shopin.entity.Members;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name DqGreatMemberTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class DqGreatMemberTest extends BaseTestContext{
	
	private SimpleHibernateDao<DqGreatMember, Integer> dqGreatMemberDao;
	private SimpleHibernateDao<Members, Integer> membersDao;
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		dqGreatMemberDao = new SimpleHibernateDao<DqGreatMember, Integer>(sessionFactory, DqGreatMember.class);
		membersDao = new SimpleHibernateDao<Members, Integer>(sessionFactory, Members.class);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert() {
		//相关表查询
		Members member = this.membersDao.findByUnique("sid", 1);
		DqGreatMember greatMem = new DqGreatMember();
		greatMem.setMembers(member);
		greatMem.setOrderNo("2342498");
		this.dqGreatMemberDao.save(greatMem);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate() {
		//相关表查询
		Members member = this.membersDao.findByUnique("sid", 2);
		DqGreatMember greatMem = this.dqGreatMemberDao.findByUnique("sid", 1);
		greatMem.setMembers(member);
		greatMem.setOrderNo("33333333");
		this.dqGreatMemberDao.save(greatMem);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testSelect() {
		String hql = "from DqGreatMember g, Members m where g.membersSid = m.sid and m.sid = ?";
		List list = this.dqGreatMemberDao.find(hql, 1);
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
		DqGreatMember greatMem = this.dqGreatMemberDao.findByUnique("sid", 3);
		Assert.notNull(greatMem);
		this.dqGreatMemberDao.delete(greatMem);
	}
}

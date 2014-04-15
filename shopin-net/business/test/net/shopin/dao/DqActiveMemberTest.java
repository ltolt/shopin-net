/**
 * @Probject Name: business
 * @Path: net.shopin.dao.DqActiveMemberTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午5:27:08
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.DqActiveMember;
import net.shopin.entity.Members;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name DqActiveMemberTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class DqActiveMemberTest extends BaseTestContext{
	
	private SimpleHibernateDao<DqActiveMember, Integer> dqActiveMemberDao;
	private SimpleHibernateDao<Members, Integer> membersDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		dqActiveMemberDao = new SimpleHibernateDao<DqActiveMember, Integer>(sessionFactory, DqActiveMember.class);
		membersDao = new SimpleHibernateDao<Members, Integer>(sessionFactory, Members.class);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert() {
		//相关主表查询
		Members member = this.membersDao.findByUnique("sid", 1);
		DqActiveMember dqActiveMember = new DqActiveMember();
		dqActiveMember.setCity("北京");
		dqActiveMember.setMembers(member);
		dqActiveMember.setTelNumber("18612054110");
		dqActiveMember.setType("type");
		
		this.dqActiveMemberDao.save(dqActiveMember);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate() {
		DqActiveMember dqActiveMember = this.dqActiveMemberDao.findByUnique("sid", 2);
		//相关主表查询
		Members member = this.membersDao.findByUnique("sid", 1);
		dqActiveMember.setCity("上海");
		dqActiveMember.setMembers(member);
		dqActiveMember.setTelNumber("18612054120");
		dqActiveMember.setType("type2");
		
		this.dqActiveMemberDao.save(dqActiveMember);
		
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect() {
		String hql = "from DqActiveMember dqAcMe,Members m where dqAcMe.membersSid = m.sid and m.sid = ? ";
		List list = this.dqActiveMemberDao.find(hql, 1);
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
		DqActiveMember dqMember = this.dqActiveMemberDao.findByUnique("sid", 3);
		Assert.notNull(dqMember);
		this.dqActiveMemberDao.delete(dqMember);
	}

}

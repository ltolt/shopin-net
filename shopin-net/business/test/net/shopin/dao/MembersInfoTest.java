/**
 * @Probject Name: business
 * @Path: net.shopin.dao.MembersInfoTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午6:36:20
 * TODO
 */
package net.shopin.dao;

import java.util.Date;
import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.Members;
import net.shopin.entity.MembersInfo;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import com.sun.jmx.snmp.Timestamp;

/**
 * @Class Name MembersInfoTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class MembersInfoTest extends BaseTestContext{
	
	private SimpleHibernateDao<MembersInfo, Integer> membersInfoDao;
	
	private SimpleHibernateDao<Members, Integer> membersDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){
		membersInfoDao = new SimpleHibernateDao<MembersInfo, Integer>(sessionFactory, MembersInfo.class);
		membersDao = new SimpleHibernateDao<Members, Integer>(sessionFactory, Members.class);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		Assert.notNull(this.membersInfoDao);
		//查询相关主表：会员表
		Members members = this.membersDao.findByUnique("sid", 1);
		MembersInfo membersInfo = new MembersInfo();
		membersInfo.setAddress("山东省淄博市桓台县");
		membersInfo.setBirthdate(new Date());
		membersInfo.setCareer("两年工作经验");
		membersInfo.setEarnings("15k/月");
		membersInfo.setInterest("足球、篮球");
		membersInfo.setMembers(members);
		membersInfo.setSex("男");
		membersInfo.setStature("asdf");
		membersInfo.setTel("18612054160");
		membersInfo.setWeight("60kg");
		this.membersInfoDao.save(membersInfo);
	}

//    @Test
//    @Transactional
//    @Rollback(false)
    public void testUpdate(){
    	//查询相关主表：会员表
    	Members members = this.membersDao.findByUnique("sid", 2);
    	MembersInfo membersInfo = this.membersInfoDao.findByUnique("sid", 1);
    	Assert.notNull(membersInfo, "must not be null");
    	membersInfo.setAddress("北京市朝阳区");
		membersInfo.setBirthdate(new Date());
		membersInfo.setCareer("八十年工作经验");
		membersInfo.setEarnings("1500k/月");
		membersInfo.setInterest("唱歌、跳舞");
		membersInfo.setMembers(members);
		membersInfo.setSex("女");
		membersInfo.setStature("asdf");
		membersInfo.setTel("18612054104");
		membersInfo.setWeight("55kg");
		this.membersInfoDao.save(membersInfo);
    }
    
    
//    @Test
//    @Transactional
//    @Rollback(false)
    public void testSelect(){
    	//多表关联查询
    	String hql = "from MembersInfo info, Members members where info.membersSid = members.sid and members.sid= ? order by info.sid desc";
    	List list = this.membersInfoDao.find(hql, 8);
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
    public void testDelete(){
    	MembersInfo membersInfo = this.membersInfoDao.findByUnique("sid", 3);
    	Assert.notNull(membersInfo, "must not be null");
    	this.membersInfoDao.delete(membersInfo);
    }
}

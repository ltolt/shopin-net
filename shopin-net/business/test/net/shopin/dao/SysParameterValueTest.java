/**
 * @Probject Name: business
 * @Path: net.shopin.dao.SysParameterValueTest.java
 * @Create By jiangzhenxue
 * @Create In 2013-7-10 下午12:06:40
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.SysParameterType;
import net.shopin.entity.SysParameterValue;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

public class SysParameterValueTest extends BaseTestContext{
    private SimpleHibernateDao<SysParameterValue, Integer> sysParameterValueDao;
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
	sysParameterValueDao = new SimpleHibernateDao<SysParameterValue, Integer>(sessionFactory, SysParameterValue.class);
    }
    
//    @Test
//    @Transactional
//    public void testInsret(){
//	SysParameterValue parameterValue = new SysParameterValue();
//	parameterValue.setName("系统");
//	parameterValue.setValue("电脑");
//	this.sysParameterValueDao.save(parameterValue);
//    }
    
//    @Test
//    @Transactional
//    public void testUpdate(){
//	SysParameterValue parameterValue = this.sysParameterValueDao.findByUnique("sid", 1028);
//	parameterValue.setName("wind7");
//	this.sysParameterValueDao.save(parameterValue);
//    }
    
//    @Test
//    @Transactional
//    public void testSelect(){
//	String hql = "from SysParameterValue s where s.value=?";
//	List<SysParameterValue> list = this.sysParameterValueDao.find(hql, "电脑");
//	for (SysParameterValue sysParameterValue : list) {
//	    System.out.println(sysParameterValue.getName());
//	}
//		
//    }
    @Test
    @Transactional
    public void testDel(){
	List<SysParameterValue> list = this.sysParameterValueDao.findBy("value", "电脑");
	for (SysParameterValue sysParameterValue :list) {
	    this.sysParameterValueDao.delete(sysParameterValue.getSid());
	}
//	SysParameterValue parameterValue = this.sysParameterValueDao.findByUnique("sid", 2);
//	Assert.notNull(parameterValue,"record must not be null");
//	this.sysParameterValueDao.delete(parameterValue.getSid());
    }
}

/**
 * @Probject Name: business
 * @Path: net.shopin.dao.SysParameterTypeTest.java
 * @Create By jiangzhenxue
 * @Create In 2013-7-10 上午11:59:53
 * TODO
 */
package net.shopin.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.SysParameterType;
import net.shopin.entity.SysParameterValue;

public class SysParameterTypeTest extends BaseTestContext {
    private SimpleHibernateDao<SysParameterType, Integer> sysParameterTypeDao;
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
	sysParameterTypeDao = new SimpleHibernateDao<SysParameterType, Integer>(sessionFactory, SysParameterType.class);
    }
    
//    @Test
//    @Transactional
//    public void testInsert(){
//	SysParameterType sysParameterType = new SysParameterType();
//	sysParameterType.setCode("123456");
//	sysParameterType.setType("经典女装");
//	this.sysParameterTypeDao.save(sysParameterType);
//    }
    
//    @Test
//    @Transactional
//    public void testUpdate(){
//	SysParameterType sysParameterType = this.sysParameterTypeDao.findByUnique("sid", 2);
//	sysParameterType.setType("时尚男装");
//	this.sysParameterTypeDao.save(sysParameterType);
//    }
    @Test
    @Transactional
    public void testSelect(){
	List<SysParameterType> list = this.sysParameterTypeDao.findBy("code", "123456");
	for (SysParameterType sysParameterType : list) {
	    System.out.println(sysParameterType.getType());
	}
    }
    
    @Test
    @Transactional
    public void testDel(){
	List<SysParameterType> list = this.sysParameterTypeDao.findBy("code", "123456");
	for (SysParameterType sysParameterType : list) {
	    this.sysParameterTypeDao.delete(sysParameterType.getSid());
	}
//	SysParameterType parameterType = this.sysParameterTypeDao.findByUnique("sid", 2);
//	Assert.notNull(parameterType);
//	this.sysParameterTypeDao.delete(parameterType.getSid());
    }
}

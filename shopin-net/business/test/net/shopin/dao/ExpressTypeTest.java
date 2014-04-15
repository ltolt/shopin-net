/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.dao.ExpressTypeTest.java
 * @Create By jingpeng
 * @Create In 2013-6-9 下午3:50:50
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.DeliProvince;
import net.shopin.entity.ExpressType;

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
 * @Desc  express_type表的测试类(命名规范 entity + Test)
 * @Class Name ExpressTypeTest
 * @Author jingpeng
 * @Create In 2013-7-10
 */
public class ExpressTypeTest extends BaseTestContext{
	
    private SimpleHibernateDao<ExpressType, Integer> expressTypeDao;
	
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
    	expressTypeDao = new SimpleHibernateDao<ExpressType, Integer>(sessionFactory, ExpressType.class);
    }
    
//    @Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		Assert.notNull(this.expressTypeDao);
		ExpressType expressType = new ExpressType();
		expressType.setExpressName("王超");
		expressType.setExpressMemo("货物还可以吧，给个好评吧");
		this.expressTypeDao.save(expressType);
	}

    
//    @Test
//    @Transactional
//    @Rollback(false)
    public void testUpdate(){
    	ExpressType expressType = this.expressTypeDao.findByUnique("sid", 2l);
    	expressType.setExpressName("荆朋");
    	expressType.setExpressMemo("谢谢您的好评，可领取5元购物券");
    	this.expressTypeDao.save(expressType);
    }
    
    
    @Test
    @Transactional
    @Rollback(false)
    public void testSelect(){
    	List expressTypeList = this.expressTypeDao.createCriteria().add(Restrictions.like("expressName","王",MatchMode.ANYWHERE))
				.addOrder(Order.asc("sid")).list();
    	System.out.println(expressTypeList);
    }
    
    @Test
    @Transactional
    @Rollback(false)
    public void testDelete(){
    	ExpressType expressType = this.expressTypeDao.findByUnique("sid", 1l);
    	Assert.notNull(expressType, "must not be null");
    	this.expressTypeDao.delete(expressType);
    }
}

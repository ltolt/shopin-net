/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.dao.ExpressChargeTest.java
 * @Create By jingpeng
 * @Create In 2013-6-9 下午5:26:29
 * TODO
 */
package net.shopin.dao;

import java.math.BigDecimal;
import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.DeliCity;
import net.shopin.entity.ExpressCharge;
import net.shopin.entity.ExpressType;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

;

/**
 * @Desc express_charge表的测试类(命名规范 entity + Test)
 * @Class Name ExpressChargeTest
 * @Author jingpeng
 * @Create In 2013-7-10
 */
public class ExpressChargeTest extends BaseTestContext{
	
    private SimpleHibernateDao<ExpressCharge, Integer> expressChargeDao;
    
    private SimpleHibernateDao<ExpressType, Integer> expressTypeDao;
    
    private SimpleHibernateDao<DeliCity, Integer> deliCityDao;
	
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
    	this.expressChargeDao = new SimpleHibernateDao<ExpressCharge, Integer>(sessionFactory, ExpressCharge.class);
    	this.expressTypeDao = new SimpleHibernateDao<ExpressType, Integer>(sessionFactory, ExpressType.class);
    	this.deliCityDao = new SimpleHibernateDao<DeliCity, Integer>(sessionFactory, DeliCity.class);
    }
    
//    @Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		//相关主表：地市表
    	DeliCity deliCity = this.deliCityDao.findByUnique("sid", 6l);
    	Assert.notNull(deliCity, "must not be null");
    	//相关主表：邮递类型表
    	ExpressType expressType = this.expressTypeDao.findByUnique("sid", 2l);
    	Assert.notNull(expressType, "must not be null");
    	ExpressCharge expressCharge = new ExpressCharge();
    	expressCharge.setDeliCity(deliCity);
    	expressCharge.setExpressType(expressType);
    	expressCharge.setExpressCharge(new BigDecimal(11.22));
    	this.expressChargeDao.save(expressCharge);
	}

    
//    @Test
//    @Transactional
//    @Rollback(false)
    public void testUpdate(){
    	//相关主表：地市表
    	DeliCity deliCity = this.deliCityDao.findByUnique("sid", 9l);
    	Assert.notNull(deliCity, "must not be null");
    	//相关主表：邮递类型表
    	ExpressType expressType = this.expressTypeDao.findByUnique("sid", 2l);
    	Assert.notNull(expressType, "must not be null");
    	ExpressCharge expressCharge = this.expressChargeDao.findByUnique("sid", 2l);
    	expressCharge.setDeliCity(deliCity);
    	expressCharge.setExpressType(expressType);
    	expressCharge.setExpressCharge(new BigDecimal(22.33));
    	this.expressChargeDao.save(expressCharge);
    }
    
    
    @Test
    @Transactional
    @Rollback(false)
    public void testSelect(){
    	//多表关联查询，使用hql查询关联表
    	String hql = "from ExpressCharge charge, ExpressType type where charge.expressTypeSid=type.sid and charge.deliCitySid=? order by charge.sid desc";
		List list = this.expressChargeDao.find(hql, 6l);
		Assert.notEmpty(list,"list must not be null");
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
    
//    @Test
//    @Transactional
//    @Rollback(false)
    public void testDelete(){
    	ExpressCharge expressCharge = this.expressChargeDao.findByUnique("sid", 2l);
    	Assert.notNull(expressCharge, "must not be null");
    	this.expressChargeDao.delete(expressCharge);
    }

}

/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.dao.DeliCityTest.java
 * @Create By jingpeng
 * @Create In 2013-6-9 下午12:40:02
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.DeliCity;
import net.shopin.entity.DeliProvince;

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
 * @Desc deli_city表的测试类(命名规范 entity + Test)
 * @Class Name DeliCityTest
 * @Author jingpeng
 * @Create In 2013-7-10
 */
public class DeliCityTest extends BaseTestContext{
	
	private SimpleHibernateDao<DeliCity, Integer> deliCityDao;
	
	private SimpleHibernateDao<DeliProvince, Integer> deliProvinceDao;
	
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
    	 deliCityDao = new SimpleHibernateDao<DeliCity, Integer>(sessionFactory, DeliCity.class);
    	 deliProvinceDao = new SimpleHibernateDao<DeliProvince, Integer>(sessionFactory, DeliProvince.class);
    }
    
//    @Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		Assert.notNull(this.deliCityDao);
		//相关主表：省市
		DeliProvince deliProvince = this.deliProvinceDao.findByUnique("sid", 3l);
		DeliCity deliCity = new DeliCity();
		deliCity.setCity("广东");
		deliCity.setZipcode("2342");
		deliCity.setDeliProvince(deliProvince);
		this.deliCityDao.save(deliCity);
	}
    
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate(){
		//相关主表： 省市
		DeliProvince deliProvince = this.deliProvinceDao.findByUnique("sid", 6l);
		Assert.notNull(deliProvince, "must not be null");
		DeliCity deliCity = this.deliCityDao.findByUnique("sid", 9l);
		Assert.notNull(deliCity,"must not be null");
		deliCity.setCity("厦门");
		deliCity.setDeliProvince(deliProvince);
		this.deliCityDao.save(deliCity);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testSelect(){
		//多表关联的查询  使用hql查询关联表
		String hql = "from  DeliCity city, DeliProvince province where city.deliProvinceSid = province.sid and city.sid=? order by city.sid desc";
		List list = this.deliCityDao.find(hql, 6l);
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
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		DeliCity deliCity = this.deliCityDao.findByUnique("sid", 8l);
		Assert.notNull(deliCity,"must not be null");
		this.deliCityDao.delete(deliCity);
	}
}

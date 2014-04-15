/**
 * @Probject Name: business
 * @Path: net.shopin.dao.BrandDisplayTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午2:56:59
 * TODO
 */
package net.shopin.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.Brand;
import net.shopin.entity.BrandDisplay;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name BrandDisplayTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class BrandDisplayTest extends BaseTestContext{

	private SimpleHibernateDao<BrandDisplay, Integer> brandDisplayDao;
	private SimpleHibernateDao<Brand, Integer> brandDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		brandDisplayDao = new SimpleHibernateDao<BrandDisplay, Integer>(sessionFactory, BrandDisplay.class);
		brandDao = new SimpleHibernateDao<Brand, Integer>(sessionFactory, Brand.class);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert() {
		Assert.notNull(brandDisplayDao);
		//相关主表查询：品牌表
		Brand brand = this.brandDao.findByUnique("sid", 5);
		Assert.notNull(brand);
		BrandDisplay brandDisplay = new BrandDisplay();
		brandDisplay.setActivityBigPic("");
		brandDisplay.setActivitySmallPic("activitySmallPic");
		brandDisplay.setBrand(brand);
		brandDisplay.setBrandCreateCountry("中国");
		brandDisplay.setBrandCreateTime(new Timestamp((new Date()).getTime()));
		brandDisplay.setBrandDesc("李宁促销");
		brandDisplay.setBrandName("李宁");
		brandDisplay.setBrandNameAlias("brandNameAlias");
		brandDisplay.setBrandNameEn("LingNing");
		brandDisplay.setBrandNameSpell("lingning");
		brandDisplay.setBrandPict("");
		brandDisplay.setBrandSpecialty("brandSpecialty");
		brandDisplay.setBrandSuitability("brandSuitability");
		brandDisplay.setFactoryBicPic("factoryBicPic");
		brandDisplay.setFactoryOrder(3);
		brandDisplay.setFactorySmallPic("factorySmallPic");
		brandDisplay.setIsFactoryStore(33);
		brandDisplay.setLogoPic("logoPic");
		brandDisplay.setParentFactoryStore(22);
		
		this.brandDisplayDao.save(brandDisplay);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate() {
		//相关主表查询：品牌表
				Brand brand = this.brandDao.findByUnique("sid", 5);
				Assert.notNull(brand);
				BrandDisplay brandDisplay = this.brandDisplayDao.findByUnique("sid", 15);
				brandDisplay.setActivityBigPic("");
				brandDisplay.setActivitySmallPic("activitySmallPic");
				brandDisplay.setBrand(brand);
				brandDisplay.setBrandCreateCountry("中国");
				brandDisplay.setBrandCreateTime(new Timestamp((new Date()).getTime()));
				brandDisplay.setBrandDesc("阿迪达斯促销");
				brandDisplay.setBrandName("阿迪达斯");
				brandDisplay.setBrandNameAlias("brandNameAlias");
				brandDisplay.setBrandNameEn("adida");
				brandDisplay.setBrandNameSpell("adidasi");
				brandDisplay.setBrandPict("");
				brandDisplay.setBrandSpecialty("brandSpecialty");
				brandDisplay.setBrandSuitability("brandSuitability");
				brandDisplay.setFactoryBicPic("factoryBicPic");
				brandDisplay.setFactoryOrder(3);
				brandDisplay.setFactorySmallPic("factorySmallPic");
				brandDisplay.setIsFactoryStore(33);
				brandDisplay.setLogoPic("logoPic");
				brandDisplay.setParentFactoryStore(22);
				
				this.brandDisplayDao.save(brandDisplay);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testSelect() {
		//相关主表查询
		String hql = "from BrandDisplay bd, Brand b where bd.brandSid = b.sid and b.sid = ?";
		List list = brandDisplayDao.find(hql, 10);
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
		System.out.println(list);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testDelete() {
		this.brandDisplayDao.delete(11);
	}
}

/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.dao.BrandRankTest.java
 * @Create By kongm
 * @Create In 2013-6-7 下午2:19:08
 * TODO
 */
package net.shopin.dao;

import java.math.BigInteger;
import java.util.List;

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

import net.shopin.base.BaseTestContext;
import net.shopin.entity.Brand;
import net.shopin.entity.BrandRank;
import net.shopin.entity.RankType;

/**
 * 
 * @Description： 品牌排行（brand_rank表）测试类
 * @ClassName:BrandRankTest
 * @author： huyy
 * @date: 2013-7-9
 */
public class BrandRankTest extends BaseTestContext {

	private SimpleHibernateDao<BrandRank, Integer> rankDao;

	private SimpleHibernateDao<Brand, Integer> brandDao;

	private SimpleHibernateDao<RankType, Integer> rankTypeDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		rankTypeDao = new SimpleHibernateDao<RankType, Integer>(sessionFactory,
				RankType.class);
		rankDao = new SimpleHibernateDao<BrandRank, Integer>(sessionFactory,
				BrandRank.class);
		brandDao = new SimpleHibernateDao<Brand, Integer>(sessionFactory,
				Brand.class);
	}

	/*
	 * 测试添加
	 */

	// @Test
	// @Transactional
	// @Rollback(false)
	public void testInsert() {
		// 查询相关主表 :排行分类表
		RankType rankType = this.rankTypeDao.findByUnique("sid", 7);
		Assert.notNull(rankType, "ranktype must not be null");
		// 相关主表: 品牌
		Brand brand = this.brandDao.findByUnique("sid", 3);
		Assert.notNull(brand, "brand must not be null");
		BrandRank record = new BrandRank();
		record.setBrand(brand);
		record.setRankType(rankType);
		record.setSalesNum(100);
		// record.setType(BigInteger.valueOf(1l));
		record.setType(Integer.valueOf(1));
		this.rankDao.save(record);
	}

	/*
	 * 测试修改
	 */
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testUpdate() {
		BrandRank brandRank = this.rankDao.findByUnique("sid", 20);
		Assert.notNull(brandRank, "brandRank must not be null");
		// RankType rankType = this.rankTypeDao.findByUnique("sid",3l);
		// brandRank.setRankType(rankType);
		brandRank.setSalesNum(2000);
		this.rankDao.save(brandRank);
	}

	/*
	 * 测试查询
	 */
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testSelect() {
		// 多表关联的查询 使用hql查询关联表
		String hql = "from  BrandRank rank, Brand brand where rank.brandSid=brand.sid and rank.rankTypeSid=? order by rank.salesNum desc";
		List list = this.rankDao.find(hql, 2);
		Assert.notNull(list, "list must not be null");
		for (Object obj : list) {
			Object[] os = (Object[]) obj;
			for (int i = 0; i < os.length; i++) {
				Object o = os[i];
				switch (i) {
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

	/*
	 * 测试删除
	 */
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testDelete() {
		BrandRank record = this.rankDao.findByUnique("sid", 20);
		Assert.notNull(record, "record must not be null");
		this.rankDao.delete(record);
	}

}

package net.shopin.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.shopin.entity.ProColorDict;
import net.shopin.entity.ProductList;
import net.shopin.service.HibernateProductSerice;
import net.shopin.service.IProColorService;
import net.shopin.service.IProductClassService;
import net.shopin.service.IProductService;
import net.shopin.view.ProductVO;

import org.hibernate.SessionFactory;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import base.framework.orm.Page;
import base.framework.orm.hibernate.SimpleHibernateDao;

@ContextConfiguration(locations = { "classpath*:/applicationContext*.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class TestSerice extends  AbstractTransactionalJUnit4SpringContextTests {

	@Autowired
	private IProductService productService;
	  
	private SimpleHibernateDao<ProductList, Integer> productDao;
	
	@Autowired
	private HibernateProductSerice productHibernateService;
	
	@Autowired
	private IProColorService proColorService;
	
	@Autowired
	private IProductClassService productClassService;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){
		productDao = new SimpleHibernateDao<ProductList, Integer>(sessionFactory, ProductList.class);
	}
	
	
	@Test
	@Transactional
	public void testProductClassService(){
		Assert.assertNotNull(this.productClassService);
		this.productClassService.getAllProductClasses();
	}
	
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testProductService(){
		ProColorDict record = new ProColorDict();
//		record.setSid(1);
		record.setProColor("灰色");
		record.setProColorBit(1);
		record.setProColorDesc("bluegrey");
		record.setBrandSid(1);
		this.proColorService.save(record);
		
//		List<ProductList> list = this.productDao.getAll();
//		for(Iterator<ProductList> iter = list.iterator();iter.hasNext();){
//			ProductList pro = iter.next();
//			pro.setProSellingTime(new Timestamp(new Date().getTime()));
//			this.productDao.save(pro);
//		}
		
//		Assert.assertNotNull(this.productService);
//		ProductVO vo = this.productService.getProduct("1");
//		System.out.println(vo);
	}
	
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testHibernate(){
		Page<ProductList> page = new Page<ProductList>();
		page.setPageNo(1);
		this.productDao.find(page, " from ProductList");
		
		
		
	}
	  
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testService(){
//		List<Integer> list = this.productHibernateService.listByProjection();
//		List list = this.productHibernateService.listByDetachedQuery();
//		List list = this.productHibernateService.listBySqlQuery();
//		System.out.println(list);
//		for(ProductList obj : list){
//			System.out.println(obj);
//		}
//		
//		List<ProductList> list = this.productHibernateService.listByExample();
//		Assert.assertNotNull(productHibernateService);
//		List<ProductList> list = this.productHibernateService.list();
//		list = this.productHibernateService.listByCriterion();
////		System.out.println(list);
//		for(ProductList obj : list){
//			System.out.println(obj);
//		}
		
//		List list = this.productService.getAll();
//		System.out.println(list);
//		List list = this.productService.findByCriteria("proSku", "test");
//		System.out.println(list);
//		ProductList record = this.productService.findByUnique("sid",1);
//		System.out.println(record);
//		List list =	this.productService.queryForList("from ProductList where sid = ?", 1);
//		System.out.println(list);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("sid", 1);
//		List list = this.productService.queryForList("from ProductList ", map);
//		System.out.println(list);
//		Assert.assertNotNull(productDao);
////		ProductList record =  this.productDao.findUnique("from ProductList where sid = ?", 1);
////		System.out.println(record);
////		Map paraMap = new HashMap();
////		paraMap.put("proSku", "skusku");
////		paraMap.put("sid", 1);
////		this.productDao.batchExecute("update ProductList set proSku = :proSku where sid = :sid", paraMap);
////		Page<ProductList> page = this.productDao.getAll(new Page<ProductList>());
////		System.out.println(page);
//		Page<ProductList> page = new Page<ProductList>();
//		Page<ProductList> result =  this.productDao.find(page, "from ProductList");
//		System.out.println(result);
	}	
	
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDeleteBySid(){
//		this.productService.deleteBySid(1);
		ProductList record = this.productService.load(1);
		System.out.println(record);
		this.productDao.initObject(record);
	}
	
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testGet(){
		Assert.assertNotNull(productService);
		ProductList record = this.productService.get(new Integer(1));
		System.out.println(record);
	}
	
	
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testProduct(){
		Assert.assertNotNull(productService);
		ProductList record = new ProductList();
		record.setSid(1);
		record.setBrandSid(2);
		record.setProActiveBit(1);
		record.setProDesc("test");
		record.setProductName("test product");
		record.setProSelling(1);
		record.setProSku("test sku");
		record.setProType(1);
		this.productService.save(record);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		Assert.assertNotNull(productService);
		ProductList record = new ProductList();
		record.setSid(1);
		this.productService.delete(record);
	}
	
	
	
	
	
	
	
}

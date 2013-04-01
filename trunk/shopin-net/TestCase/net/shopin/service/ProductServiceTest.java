package net.shopin.service;

import java.util.List;

import net.shopin.entity.ProductClass;
import net.shopin.view.ProductVO;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import base.framework.util.json.JsonUtil;

public class ProductServiceTest extends BaseServiceTest{
	
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IProductClassService productClassService;
	
	@Test
	@Transactional
	public void testSession(){
//		List list = this.productService.getAll();
//		System.out.println(list);
		List list = this.productClassService.getAllProductClasses();
		String json = JsonUtil.Object2JsonFilter(list);
		System.out.println(json);
	}
	
	
	
//	@Test
//	@Transactional
	//@Rollback(false)
	public void testGetProduct(){
//		Assert.assertNotNull(this.productService);
//		Assert.assertNotNull(this.productClassService);
//		this.productService.findCurrentCateList();
//		List list = this.productClassService.getAllProductClasses();
		String json = this.productClassService.getAllProductClassesJson();
		System.out.println(json);
		
//		List<ProductClass> list = this.productClassService.getAllProductClasses();
//		System.out.println(list);
//		System.out.println(list.get(0).getChildProductClasses());
//		
//		ProductVO vo  = this.productService.getProduct("1");
		
		
		
//		System.out.println(vo);
//		ProductVO pro = this.productService.getProductByDetailSid("1");
//		System.out.println(pro);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

/**
 * @Probject Name: business
 * @Path: net.shopin.service.ProductServiceImplTest.java
 * @Create By wangdg
 * @Create In 2013-7-11 下午3:57:41
 * TODO
 */
package net.shopin.service;

import java.text.ParseException;

import net.shopin.api.IProductService;
import net.shopin.entity.PageLayout;
import net.shopin.service.PageFieldUtil;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @Class Name ProductServiceImplTest
 * @Author wangdg
 * @Create In 2013-7-11
 */
public class ProductServiceImplTest {

	private static AbstractApplicationContext context;
	private IProductService productService;
	private PageFieldUtil pageFieldUtil;

	@Before
	public void setUp() throws Exception {
		context = new ClassPathXmlApplicationContext("spring.xml");
		productService = (IProductService) context.getBean("productService");
		pageFieldUtil = (PageFieldUtil) context.getBean("pageFieldUtil");

	}

	@Test
	public void testGetPageLayoutProducts() {
		System.out.println(this.productService.getPageLayoutProducts(70059, 1));
	}

	@Test
	public void testGetProduct() {
		System.out.println(this.productService.getProduct(798027 + ""));
	}
	
	@Test
	public void testGetStockByDetail() {
		System.out.println(this.productService.getStockByDetail(6559001+"", 275+"","0"));
	}
}

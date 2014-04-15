package net.shopin.service;

import java.util.List;
import java.util.Map;

import net.shopin.api.IBrandService;
import net.shopin.view.BrandVO;
import net.shopin.view.SsdBrandDisplay;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.Assert;

/**
 *  根据栏目ID获取栏目品牌信息业务测试类
 * @Class Name BrandServiceImplTest
 * @Author huyy
 * @Create In 2013-7-12
 */
public class BrandServiceImplTest {
	   private static AbstractApplicationContext context;
	   private IBrandService brandService;
	  @Before
	  public void setUp() throws Exception {
	      context = new ClassPathXmlApplicationContext("spring.xml");
	      this.brandService = (IBrandService) context.getBean("brandService");

	  }
	 
	  //@Test
	  public void testGetPageLayoutBrands(){
		  List<BrandVO> lb=this.brandService.getPageLayoutBrands(70047);
		  Assert.notNull(lb,"must not be null");
		  for(BrandVO bv:lb){
			  System.out.println("brandName:=="+bv.getBrandName()+"============");
			  System.out.println("spell:=="+bv.getSpell()+"======");
		  }
	  }
	  
	  @Test
	  public void getAllBrands(){
		  
		  Map<String, List<SsdBrandDisplay>>  list= this.brandService.getAllBrands();
		  System.out.println("List=="+list.get("A"));
		  
	  }
}

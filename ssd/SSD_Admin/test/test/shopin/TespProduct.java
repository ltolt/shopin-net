package test.shopin;

import java.util.ArrayList;
import java.util.List;

import net.shopin.product.domin.entity.MongoProduct;
import net.shopin.product.domin.entity.MongoProductPicture;
import net.shopin.product.repository.impl.ProductRepositoryImpl;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



public class TespProduct {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ConfigurableApplicationContext context = new ClassPathXmlApplicationContext("classpath:/applicationContext_mongo.xml");
		ProductRepositoryImpl repository = context.getBean(ProductRepositoryImpl.class);
		repository.dropCollection();
		repository.createCollection();
		
		 MongoProduct mp = new MongoProduct();
		 MongoProductPicture mppt = new MongoProductPicture();
		 mp.setSid(2500001L);
		 mp.setProductName("fute_上衣");
		 mp.setProductSku("fumejt");
		 mp.setBrandSid(112L);
		 mp.setBrandName("aa");
		 mp.setProType(10037L);
		 mp.setProActiveBit(123L);
		 mp.setProSelling(1003L);
		 mp.setPresentFlg(1L);
		 mp.setActivityFlg(132L);
		 mp.setProPicture("123/10jogn.jpg");
		 
		 mppt.setSid(1L);
		 mppt.setProductSid(2500001L);
		 mppt.setProPictName("ccfaon");
		 mppt.setProPictDir("sllgnlafng");
		 mppt.setProPictOrder(1L);
		 List<MongoProductPicture> lists = new ArrayList<MongoProductPicture>();
		 lists.add(mppt);
		 mp.setList(lists);
		 repository.saveProduct(mp);
		 
		 System.out.println("aa");
		
	}

}

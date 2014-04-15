/**
 * @Probject Name: business
 * @Path: net.shopin.service.PaymentServiceTest.java
 * @Create By kongm
 * @Create In 2013-9-2 上午11:43:07
 * TODO
 */
package net.shopin.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import net.shopin.api.IPaymentService;
import net.shopin.base.BaseTestContext;

/**
 * @Class Name PaymentServiceTest
 * @Author kongm
 * @Create In 2013-9-2
 */
public class PaymentServiceTest extends BaseTestContext{
	
	@Autowired
	private IPaymentService paymentService;
	
	
	@Test
	public void testQuery(){
		Assert.notNull(this.paymentService);
		List list = this.paymentService.getAllPaymentTypes();
		System.out.println(list);
	}

	
}

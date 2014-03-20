package test.shopin;

import java.math.BigDecimal;
import java.util.List;

import net.shopin.stock.domain.entity.DocSsdProductStockPrice;
import net.shopin.stock.domain.entity.SsdProductStockPrice;
import net.shopin.stock.service.IDocSsdProductStockPriceService;
import net.shopin.stock.service.ISsdProductStockPriceService;
import net.shopin.test.domain.entity.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.transaction.annotation.Transactional;

@ContextConfiguration(locations = { "classpath*:/applicationContext.xml" })
public class TestUnit extends AbstractTransactionalJUnit4SpringContextTests {

//	@Autowired
//	private IDocSsdProductStockPriceService docSsdProductStockPriceService;
	
	@Autowired
	private ISsdProductStockPriceService ssdProductStockPriceService;
	
	@Autowired
	private IDocSsdProductStockPriceService docSsdProductStockPriceService;

	@org.junit.Test
	@Transactional
	@Rollback(false)
	public void test() {
		Test test = new Test();
//		SsdProductStockPrice record=new SsdProductStockPrice();
//		List list=ssdProductStockPriceService.selectList(record);
//		System.out.println(list.size());
//		
//		
//		record.setProductSid(148308l);
//		BigDecimal ss=ssdProductStockPriceService.getSupplyMinPrice(record);
//		System.out.println(ss);
//		
//		record=new SsdProductStockPrice();
//		record.setProductDetail(422820l);
//		record.setSaleCodeSid(476l);
//		record.setStockTypeSid(0l);
//		List<SsdProductStockPrice> ssd=ssdProductStockPriceService.selectByProDetailSid(record);
//		System.out.println(ssd.size());
//		
//		
//		record=new SsdProductStockPrice();
//		record.setProductDetail(422820l);
//		record.setPromotionPrice(new BigDecimal("67"));
//		List<SsdProductStockPrice> ssdd=ssdProductStockPriceService.seleteQuantity(record);
//		System.out.println(ssdd.size());
		
		System.out.println(docSsdProductStockPriceService==null);
		
		DocSsdProductStockPrice dspsp=new DocSsdProductStockPrice();
		dspsp.setSid(34L);
		docSsdProductStockPriceService.save(dspsp);
		
		

	}
}

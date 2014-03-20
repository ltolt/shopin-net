package test.shopin;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import net.shopin.category.domain.entity.SsdCategory;
import net.shopin.category.domain.vo.CriteriaVO;
import net.shopin.category.domain.vo.ProductCateVO;
import net.shopin.category.domain.vo.ProductQueryVO;
import net.shopin.category.persistence.CriteriaVOMapper;
import net.shopin.category.service.SsdCategoryService;
import net.shopin.category.service.SsdProductCategoryService;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.transaction.annotation.Transactional;

@ContextConfiguration(locations = { "classpath*:/applicationContext.xml" })
public class TestCategory extends AbstractTransactionalJUnit4SpringContextTests {

	@Autowired
	private SsdCategoryService categoryService;
	
	@Autowired
	private SsdProductCategoryService productCategoryService; 
	
	@Autowired
	private CriteriaVOMapper criteriaVOMapper;
	
	//@Test
	@Transactional
	@Rollback(false)
	public void testSave() {
		SsdCategory category = new SsdCategory();
		category.setName("男士内衣");
		category.setParentSid(4L);
		category.setIsParent(0L);
		category.setStatus(1L);
		category.setSortOrder(2L);
		category.setCreateTime(new Date());
		this.categoryService.insert(category);

	}
	
	//@Test
	@Transactional
	@Rollback(false)
	public void testGet() {
		SsdCategory category = new SsdCategory();
		List<SsdCategory> list = this.categoryService.selectList(category);
		System.out.println(list.size());
		list = this.categoryService.getByParentSid(5L);
		System.out.println(list.size());
		int count = this.productCategoryService.getProCount(24L);
		System.out.println(count);
		List<Long> cateIds = new ArrayList<Long>();
		cateIds.add(1058L);
		cateIds.add(1081L);
		list = this.categoryService.selectListIn(cateIds);
		System.out.println(list.size());
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testCriteria(){
		ProductQueryVO queryVO = new ProductQueryVO();
		queryVO.setSprice("3000");
		queryVO.setEprice("6000");
		//queryVO.setProBrand("55");
		queryVO.setEoffprice("0.85");
		queryVO.setSoffprice("0.25");
		//queryVO.setProCate("1182");
		queryVO.setProCate("1046");
		System.out.println(queryVO.getProCates());
		ProductCateVO pc = this.categoryService.findCurrentCateList(queryVO);
		System.out.println(pc.getChildCatesMap().values());
		System.out.println(pc.getChildCates());
		System.out.println(pc.getProductCount()+"\t"+pc.getName()+"\t"+pc.getSid());
		if (pc.getChildCates().size() > 0) {
			Collection<ProductCateVO> list = pc.getChildCates();
			Iterator<ProductCateVO> iterator = list.iterator();
			while (iterator.hasNext()) {
				ProductCateVO pcv = iterator.next();
				System.out.println(pcv);
				if (pcv.getChildCates().size() > 0) {
					Collection<ProductCateVO> pcv1 = pcv.getChildCates();
					Iterator<ProductCateVO> it = pcv1.iterator();
					while (it.hasNext()) {
						ProductCateVO pcv2 = it.next();
						System.out.println("--"+pcv2);
						if (pcv2.getChildCates().size() > 0) {
							Collection<ProductCateVO> pcv3 = pcv2.getChildCates();
							Iterator<ProductCateVO> it3 = pcv3.iterator();
							while (it3.hasNext()) {
								System.out.println("----"+it3.next());						
							}
						}						
					}
				}
			}
		}
	}
	
	//@Test
	@Transactional
	@Rollback(false)
	public void testCriteria1(){
		CriteriaVO criteriaVO = new CriteriaVO();
		criteriaVO.setPresentFlg(1L);
		criteriaVO.setActivityFlg(1L);
		criteriaVO.setProSelling(1L);
		criteriaVO.setProType(1L);
		//criteriaVO.setSoffprice(5000.0);
		//criteriaVO.setEoffprice(6000.0);
		List<Long> cateIds = new ArrayList<Long>();
		cateIds.add(1234L);
		cateIds.add(1081L);
		criteriaVO.setCateIds(cateIds);
		List<ProductCateVO> list = this.criteriaVOMapper.selectList(criteriaVO);
		System.out.println(list.size());
		System.out.println(list.get(0).getSid());
	}
}

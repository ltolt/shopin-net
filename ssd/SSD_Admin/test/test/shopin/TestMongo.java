package test.shopin;

import java.util.ArrayList;
import java.util.List;

import net.shopin.category.domain.entity.DocCategory;
import net.shopin.category.domain.entity.SsdCategory;
import net.shopin.category.service.DocCategoryService;
import net.shopin.category.service.SsdCategoryService;
import net.shopin.category.service.SsdProductCategoryService;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.transaction.annotation.Transactional;

@ContextConfiguration(locations = { "classpath*:/applicationContext*.xml" })
public class TestMongo extends AbstractTransactionalJUnit4SpringContextTests {

	@Autowired
	private SsdCategoryService categoryService;
	
	@Autowired
	private SsdProductCategoryService productCategoryService;
	
	@Autowired
	private DocCategoryService categoryRepository;
	
	//@Test
	@Transactional
	@Rollback(false)
	public void testInsert(){
		
		categoryRepository.dropCollection();
		categoryRepository.createCollection();
		
		SsdCategory category = new SsdCategory();
		List<SsdCategory> list = this.categoryService.selectList(category);
		//遍历一级节点
		for (SsdCategory c : list) {
			DocCategory doc = new DocCategory();
			doc.setSid(c.getSid());
			doc.setName(c.getName());
			doc.setParentSid(c.getParentSid());
			doc.setIsParent(c.getIsParent());
			doc.setStatus(c.getStatus());
			int count = 0;
			List<DocCategory> docs = new ArrayList<DocCategory>();
			if (c.getIsParent() != 1) {
				count = this.productCategoryService.getProCount(c.getSid());
				doc.setCount(count);
				doc.setList(docs);
				categoryRepository.save(doc);
			}else{
				List<SsdCategory> ca = this.categoryService.getByParentSid(c.getSid());
				//遍历二级节点
				for (SsdCategory c1 : ca) {
					DocCategory doc1 = new DocCategory();
					doc1.setSid(c1.getSid());
					int size = 0;
					if (c1.getIsParent() != 1) {
						size = this.productCategoryService.getProCount(c1.getSid());
						doc1.setCount(size);
					}else{
						List<SsdCategory> ca1 = this.categoryService.getByParentSid(c1.getSid());
						//遍历三级节点
						for (SsdCategory c2 : ca1) {
							if (c2.getIsParent() != 1) {
								size += this.productCategoryService.getProCount(c2.getSid());
							}else{
								List<SsdCategory> ca2 = this.categoryService.getByParentSid(c2.getSid());
								for (SsdCategory s2 : ca2) {
									size += this.productCategoryService.getProCount(s2.getSid());
								}
							}
						}
					}
					doc1.setName(c1.getName());
					//System.out.println("name="+doc1.getName()+"\tsize="+size+"\tcount="+count);
					doc1.setParentSid(c1.getParentSid());
					doc1.setIsParent(c1.getIsParent());
					doc1.setStatus(c1.getStatus());
					doc1.setCount(size);
					docs.add(doc1);
					count += size;
				}
				doc.setList(docs);
				doc.setCount(count);
				categoryRepository.save(doc);
			}
		}
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testQuery(){
		DocCategory doc = this.categoryRepository.get(1L);
		System.out.println(doc.getName());
		List<DocCategory> docs = doc.getList();
		for (DocCategory d1 : docs) {
			System.out.println("--"+d1.getName()+"("+d1.getCount()+")");
			List<DocCategory> docs2 = this.categoryRepository.getByParentSid(d1.getSid());
			for (DocCategory d2 : docs2) {
				System.out.println("----"+d2.getName()+"("+d2.getCount()+")");
			}
		}
	}
}

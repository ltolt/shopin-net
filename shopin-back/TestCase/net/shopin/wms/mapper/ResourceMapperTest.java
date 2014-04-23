/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.mapperResourceMapperTest.java
 * @Create By Administrator
 * @Create In 2013-7-5 下午2:59:56
 * TODO
 */
package net.shopin.wms.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.Resources;
import net.shopin.wms.persistence.ResourcesMapper;

/**
 * @Class Name ResourceMapperTest
 * @Author Administrator
 * @Create In 2013-7-5
 */
public class ResourceMapperTest extends BaseTestContext{
	
	@Autowired
	private ResourcesMapper resourcesMapper;
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect(){
		Assert.notNull(this.resourcesMapper);
		Resources record = this.resourcesMapper.selectByPrimaryKey(1l);
		System.out.println(record);
	}
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		Assert.notNull(this.resourcesMapper);
		Resources record = new Resources();
		//record.setSid(111l);
		record.setResourceName("资源名称");
		record.setUrl("http:8080");
		this.resourcesMapper.insert(record);
		
	}
//	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsertSelective(){
		Assert.notNull(this.resourcesMapper);
		Resources record = new Resources();
		//record.setSid(111l);
		record.setResourceName("又是资源名称");
		record.setUrl("http:80808");
		this.resourcesMapper.insertSelective(record);
		
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		Assert.notNull(this.resourcesMapper);
		this.resourcesMapper.deleteByPrimaryKey(1023l);
		
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelectList(){
		Assert.notNull(this.resourcesMapper);
		
		//List< Resources> re=new ArrayList<Resources>();
		List re =this.resourcesMapper.selectAllResources();
		System.out.println(re);
		
	}
	
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testupdateByPrimaryKeySelective(){
		Assert.notNull(this.resourcesMapper);
		
	
		Resources record = new Resources();
		record.setSid(1023L);
		record.setResourceName("又是资源名称");
		record.setUrl("http:80808");
	int i =	this.resourcesMapper.updateByPrimaryKeySelective(record);
		
	System.out.println(i);
		
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testupdateByPrimaryKey(){
		Assert.notNull(this.resourcesMapper);
		
	
		Resources record = new Resources();
		record.setSid(1023L);
		record.setResourceName("王东阁的资源");
		record.setUrl("http:80808");
	int i =	this.resourcesMapper.updateByPrimaryKey(record);
		
	System.out.println(i);
		
	}

	
	@Test
	@Transactional
	@Rollback(false)
	public void testQueryName(){
		Assert.notNull(this.resourcesMapper);
		Resources name = new Resources();
	name.setResourceName("频道");
	List list =	this.resourcesMapper.selectResourceByName(name);
	System.out.println(list.toString());
		
	}

	
	@Test
	public void testSelectOthers(){
		List<Long> list =new ArrayList<Long>();
		list.add(2L);
		list.add(3L);
		List  record = this.resourcesMapper.selectOthersByPrimaryKey(list);
		System.out.println(record.size());
	}


}

/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceResourcesServiceTest.java
 * @Create By shiying
 * @Create In 2013-7-5 下午4:21:50
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.Resources;
import net.shopin.wms.domain.entity.Roles;

/**
 * @Class Name ResourcesServiceTest
 * @Author shiying
 * @Create In 2013-7-5
 */
public class ResourcesServiceTest extends BaseTestContext{
	
	@Autowired
	private IResourcesService resourcesService;
	
	
	//@Test
	public void testSelect(){
		Assert.notNull(this.resourcesService);
		Resources record =  this.resourcesService.selectByPrimaryKey(1024l);
		System.out.println(record);
	}
	
	//@Test
	public void testInsert(){
		Assert.notNull(this.resourcesService);
		Resources record = new Resources();
		//record.setSid(111l);
		record.setResourceName("资源名称");
		record.setUrl("http:8080");
		this.resourcesService.insert(record);
		System.out.println(record);
	}
	
	//@Test
	public void testInsertSelective(){
		Assert.notNull(this.resourcesService);
		Resources record = new Resources();
		//record.setSid(111l);
		record.setResourceName("资源de名称");
		record.setUrl("http:8080");
		this.resourcesService.insertSelective(record);
		System.out.println(record);
	}
	
	//@Test
	public void testupdateByPrimaryKeySelective(){
		Assert.notNull(this.resourcesService);
		Resources record = new Resources();
		record.setSid(1025l);
		record.setResourceName("资源de名称");
		record.setUrl("http:8080");
	int i =	this.resourcesService.updateByPrimaryKeySelective(record);
		System.out.println(i);
	}
	//@Test
	public void testupdateByPrimaryKey(){
		Assert.notNull(this.resourcesService);
		Resources record = new Resources();
		record.setSid(1026l);
		record.setResourceName("资源1026名称");
		record.setUrl("http:8080");
	int i =	this.resourcesService.updateByPrimaryKeySelective(record);
	System.out.println(i);
	}
	
	//@Test
		public void testdeleteByPrimaryKey(){
			Assert.notNull(this.resourcesService);
			this.resourcesService.deleteByPrimaryKey(1025l);
		
		}
	
	//@Test
	public void testQueryAllAResources(){
		Assert.notNull(this.resourcesService);
		List re =
		 this.resourcesService.selectAllResources();
		
		System.out.println(re);
	
	}
	
	@Test
		public void testQueryName(){
			Assert.notNull(this.resourcesService);
			
			Resources name = new Resources();
			name.setResourceName("频道");
			List re =
			 this.resourcesService.selectResourceByName(name);
			
			System.out.println(re);
		
		}

//	@Test
//		public void testQueryOthersAResources(){
//			Assert.notNull(this.resourcesService);
//			List re = this.resourcesService.selectOthersByPrimaryKey(2L);
//			
//			System.out.println(re);
//		
//		}
}

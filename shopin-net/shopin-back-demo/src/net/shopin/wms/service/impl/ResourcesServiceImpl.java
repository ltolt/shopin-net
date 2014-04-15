/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.implResourcesServiceImpl.java
 * @Create By shiying
 * @Create In 2013-7-5 下午3:45:09
 * TODO
 */
package net.shopin.wms.service.impl;

import java.sql.SQLException;
import java.util.List;

import net.shopin.wms.domain.entity.Resources;
import net.shopin.wms.domain.entity.Roles;
import net.shopin.wms.persistence.ResourcesMapper;
import net.shopin.wms.service.IResourcesService;
import net.shopin.wms.service.IRolesService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;

/**
 * @Class Name ResourcesServiceImpl
 * @Author shiying
 * @Create In 2013-7-5
 */

@Component("resourcesService")
@Scope("prototype")
@Transactional
public class ResourcesServiceImpl implements IResourcesService{

	
	@Autowired
	private ResourcesMapper resourcesMapper;

	@Override
	public int deleteByPrimaryKey(Long sid) {
		return this.resourcesMapper.deleteByPrimaryKey(sid);
	}

	@Override
	public int insert(Resources record) {
		
		return this.resourcesMapper.insert(record);
	}

	@Override
	public int insertSelective(Resources record) {
		return this.resourcesMapper.insertSelective(record);
	}

	@Override
	public Resources selectByPrimaryKey(Long sid) {
		return this.resourcesMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int updateByPrimaryKeySelective(Resources record) {
		return this.resourcesMapper.updateByPrimaryKey(record);
	}

	@Override
	public int updateByPrimaryKey(Resources record) {
		return this.resourcesMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List selectAllResources() {
		
		return this.resourcesMapper.selectAllResources();
	}


	@Override
	public List selectResourceByName(Resources record) {
		
		return this.resourcesMapper.selectResourceByName(record);
	}



	@Override
	public List selectList(Resources record) {
		return this.resourcesMapper.selectList(record);
	}

	@Override
	public List selectOthersByPrimaryKey(List<Long> sids) {
		return this.resourcesMapper.selectOthersByPrimaryKey(sids);
	}

	
	
}

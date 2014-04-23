/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.service.implBrandServiceImpl.java
 * @Create By wangdg
 * @Create In 2013-5-13 下午1:56:00
 * TODO
 */
package net.shopin.back.service.impl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;

import net.shopin.back.entity.cond.BrandCond;
import net.shopin.back.entity.vo.BrandVO;
import net.shopin.back.mapper.BrandMapper;
import net.shopin.back.service.IBrandservice;

/**
 * @Class Name BrandServiceImpl
 * @Author wangdg
 * @Create In 2013-5-13
 */

@Service(value="brandService")
public class BrandServiceImpl implements IBrandservice {
	
	@Autowired
	BrandMapper brandMapper;

	/* (non-Javadoc)
	 * @see com.framework.IAbstractService#findObjBySid(com.framework.returnObj.Infos, java.lang.Long)
	 */
	public BrandVO findObjBySid(Infos infos, Long sid) throws SQLException {
		return brandMapper.findObjBySid(sid);
	}

	/* (non-Javadoc)
	 * @see com.framework.IAbstractService#queryObjs(com.framework.returnObj.Infos, com.framework.AbstractCondtion)
	 */
	public Paginator queryObjs(Infos infos, BrandCond cond) throws SQLException {
		
		Paginator page = new Paginator();
		page.setList(this.brandMapper.queryObjsList(cond));
		page.setTotalRecords(this.brandMapper.queryObjsCount(cond));
		page.setPage(cond);
		return page;
	}

	/* (non-Javadoc)
	 * @see com.framework.IAbstractService#insert(com.framework.returnObj.Infos, com.framework.AbstractCondtion)
	 */
	public void insert(Infos infos, BrandCond cond) throws SQLException {
		this.brandMapper.insert(cond.getBrand());
	}

	/* (non-Javadoc)
	 * @see com.framework.IAbstractService#update(com.framework.returnObj.Infos, com.framework.AbstractCondtion)
	 */
	public void update(Infos infos, BrandCond cond) throws SQLException {
		this.brandMapper.update(cond.getBrand());
	}

	/* (non-Javadoc)
	 * @see com.framework.IAbstractService#delete(com.framework.returnObj.Infos, java.lang.Long)
	 */
	public void delete(Infos infos, Long sid) throws SQLException {
		this.brandMapper.delete(sid);
	}

}

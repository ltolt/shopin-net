/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.service.implProConSearchServiceImpl.java
 * @Create By kongm
 * @Create In 2013-5-10 下午1:37:42
 * TODO
 */
package net.shopin.back.service.impl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;

import net.shopin.back.entity.cond.ProConSearchCond;
import net.shopin.back.entity.vo.ProConSearchVO;
import net.shopin.back.mapper.ProConSearchMapper;
import net.shopin.back.service.IProConSearchService;
import net.shopin.back.view.ProductKey;

/**
 * @Class Name ProConSearchServiceImpl
 * @Author kongm
 * @Create In 2013-5-10
 */
@Service(value = "proConSearchService")
public class ProConSearchServiceImpl implements IProConSearchService {
	
	@Autowired
	private ProConSearchMapper proConSearchMapper;
	

	/* (non-Javadoc)
	 * @see com.framework.IAbstractService#findObjBySid(com.framework.returnObj.Infos, java.lang.Long)
	 */
	public ProConSearchVO findObjBySid(Infos infos, Long sid)
			throws SQLException {
		return this.proConSearchMapper.findObjBySid(sid);
	}

	/* (non-Javadoc)
	 * @see com.framework.IAbstractService#queryObjs(com.framework.returnObj.Infos, com.framework.AbstractCondtion)
	 */
	public Paginator queryObjs(Infos infos, ProConSearchCond cond)
			throws SQLException {
		Paginator page = new Paginator();
		page.setList(this.proConSearchMapper.queryObjsList(cond));
		page.setTotalRecords(this.proConSearchMapper.queryObjsCount(cond));
		page.setPage(cond);
		return page;
	}

	/* (non-Javadoc)
	 * @see com.framework.IAbstractService#insert(com.framework.returnObj.Infos, com.framework.AbstractCondtion)
	 */
	public void insert(Infos infos, ProConSearchCond cond) throws SQLException {
		this.proConSearchMapper.insert(cond.getProConSearch());
	}

	/* (non-Javadoc)
	 * @see com.framework.IAbstractService#update(com.framework.returnObj.Infos, com.framework.AbstractCondtion)
	 */
	public void update(Infos infos, ProConSearchCond cond) throws SQLException {
		this.proConSearchMapper.update(cond.getProConSearch());
	}

	/* (non-Javadoc)
	 * @see com.framework.IAbstractService#delete(com.framework.returnObj.Infos, java.lang.Long)
	 */
	public void delete(Infos infos, Long sid) throws SQLException {
		this.proConSearchMapper.delete(sid);
	}
	
	public void updateProConSearch(ProductKey productKey){
		this.proConSearchMapper.updateProConSearch(productKey);
	}

}

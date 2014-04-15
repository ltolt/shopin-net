/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.impl.ProConSearchMqlServiceImpl.java
 * @Create By wangdg
 * @Create In 2013-9-16 下午2:09:11
 * TODO
 */
package net.shopin.wms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.back.view.ProductKey;
import net.shopin.wms.domain.entity.ProConSearchMql;
import net.shopin.wms.persistence.ProConSearchMqlMapper;
import net.shopin.wms.service.IProConSearchMqlService;

/**
 * @Class Name ProConSearchMqlServiceImpl
 * @Author wangdg
 * @Create In 2013-9-16
 */
@Component("proConSearchMqlService")
@Scope("prototype")
@Transactional
public class ProConSearchMqlServiceImpl implements IProConSearchMqlService {

	@Autowired
	ProConSearchMqlMapper proConSearchMapper;

	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.proConSearchMapper.deleteByPrimaryKey(sid);
	}

	@Override
	public int insert(ProConSearchMql record) {
		// TODO Auto-generated method stub
		return this.proConSearchMapper.insert(record);
	}

	@Override
	public int insertSelective(ProConSearchMql record) {
		// TODO Auto-generated method stub
		return this.proConSearchMapper.insertSelective(record);
	}

	@Override
	public ProConSearchMql selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.proConSearchMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int updateByPrimaryKeySelective(ProConSearchMql record) {
		// TODO Auto-generated method stub
		return this.proConSearchMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(ProConSearchMql record) {
		// TODO Auto-generated method stub
		return this.proConSearchMapper.updateByPrimaryKey(record);
	}

	@Override
	public void updateProConSearch(ProductKey productKey) {
		this.updateProConSearch(productKey);

	}

}

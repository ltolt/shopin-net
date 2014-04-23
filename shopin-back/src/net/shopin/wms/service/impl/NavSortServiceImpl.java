package net.shopin.wms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.wms.domain.entity.NavSort;
import net.shopin.wms.persistence.NavSortMapper;
import net.shopin.wms.service.INavSortService;

@Component("navSortService")
@Scope("prototype")
@Transactional
public class NavSortServiceImpl  implements INavSortService{

	@Autowired
	NavSortMapper navSortMapper;
	@Override
	public int deleteByPrimaryKey(Integer sid) {
		return this.navSortMapper.deleteByPrimaryKey(sid);
	}

	@Override
	public int insert(NavSort record) {
		return this.navSortMapper.insert(record);
	}

	@Override
	public int insertSelective(NavSort record) {
		return this.navSortMapper.insertSelective(record);
	}

	@Override
	public NavSort selectByPrimaryKey(Integer sid) {
		return this.navSortMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int updateByPrimaryKeySelective(NavSort record) {
		return this.navSortMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(NavSort record) {
		return this.navSortMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<NavSort> queryList(Integer shopChannelsSid) {
		return this.navSortMapper.queryList(shopChannelsSid);
	}

	@Override
	public int enableSort(NavSort record) {
		return this.navSortMapper.enableSort(record)+this.navSortMapper.unableSort(record);
	}

}

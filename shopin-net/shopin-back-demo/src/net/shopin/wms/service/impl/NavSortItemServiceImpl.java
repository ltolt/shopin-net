package net.shopin.wms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.wms.domain.entity.NavSortItem;
import net.shopin.wms.persistence.NavSortItemMapper;
import net.shopin.wms.service.INavSortItemService;


@Component("navSortItemService")
@Scope("prototype")
@Transactional
public class NavSortItemServiceImpl implements INavSortItemService {
	@Autowired
	NavSortItemMapper navSortItemMapper;
	@Override
	public int deleteByPrimaryKey(Integer sid) {
		return this.navSortItemMapper.deleteByPrimaryKey(sid);
	}

	@Override
	public int insert(NavSortItem record) {
		return this.navSortItemMapper.insert(record);
	}

	@Override
	public int insertSelective(NavSortItem record) {
		return this.navSortItemMapper.insertSelective(record);
	}

	@Override
	public NavSortItem selectByPrimaryKey(Integer sid) {
		return this.navSortItemMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int updateByPrimaryKeySelective(NavSortItem record) {
		return this.navSortItemMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(NavSortItem record) {
		return this.navSortItemMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<NavSortItem> queryList(Integer navSortSid) {
		return this.navSortItemMapper.queryList(navSortSid);
	}

	@Override
	public List<NavSortItem> queryItemList(NavSortItem record) {
		return this.navSortItemMapper.queryItemList(record);
	}

}

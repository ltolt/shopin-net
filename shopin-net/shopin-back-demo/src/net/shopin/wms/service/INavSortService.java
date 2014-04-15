package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.NavSort;

public interface INavSortService {

	int deleteByPrimaryKey(Integer sid);

    int insert(NavSort record);

    int insertSelective(NavSort record);

    NavSort selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(NavSort record);

    int updateByPrimaryKey(NavSort record);
    
    List queryList(Integer shopChannelsSid);
    
    int enableSort(NavSort record);
    
}

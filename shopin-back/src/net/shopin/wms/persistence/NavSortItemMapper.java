package net.shopin.wms.persistence;

import java.util.List;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.NavSortItem;

@ShoppinMysqlMapper
public interface NavSortItemMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(NavSortItem record);

    int insertSelective(NavSortItem record);

    NavSortItem selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(NavSortItem record);

    int updateByPrimaryKey(NavSortItem record);

    List<NavSortItem> queryList(Integer navSortSid); 
    
    List<NavSortItem> queryItemList(NavSortItem record); 
}
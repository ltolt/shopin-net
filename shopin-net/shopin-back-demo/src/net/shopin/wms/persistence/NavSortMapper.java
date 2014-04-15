package net.shopin.wms.persistence;

import java.util.List;

import net.shopin.wms.domain.entity.NavSort;
import net.shopin.wms.domain.view.NavSortVO;

import com.framework.persistence.ShoppinMysqlMapper;

@ShoppinMysqlMapper
public interface NavSortMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(NavSort record);

    int insertSelective(NavSort record);

    NavSort selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(NavSort record);

    int updateByPrimaryKey(NavSort record);
    
    List<NavSort> queryList(Integer shopChannelsSid); 
    
    int enableSort(NavSort record);
    
    int unableSort(NavSort record);
}
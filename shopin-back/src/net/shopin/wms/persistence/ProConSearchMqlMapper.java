package net.shopin.wms.persistence;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.back.view.ProductKey;
import net.shopin.wms.domain.entity.ProConSearchMql;

@ShoppinMysqlMapper
public interface ProConSearchMqlMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(ProConSearchMql record);

    int insertSelective(ProConSearchMql record);

    ProConSearchMql selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(ProConSearchMql record);

    int updateByPrimaryKey(ProConSearchMql record);
    
    void updateProConSearch(ProductKey productKey);
}
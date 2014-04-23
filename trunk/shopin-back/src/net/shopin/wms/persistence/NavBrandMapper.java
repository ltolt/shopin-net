package net.shopin.wms.persistence;

import java.util.List;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.NavBrand;

@ShoppinMysqlMapper
public interface NavBrandMapper {
    int deleteByPrimaryKey(Long sid);

    int insert(NavBrand record);

    int insertSelective(NavBrand record);

    NavBrand selectByPrimaryKey(Long sid);

    int updateByPrimaryKeySelective(NavBrand record);

    int updateByPrimaryKey(NavBrand record);

    List selectNavBrandByNavSid(NavBrand record);
    
    int countNavBrandRecord(NavBrand record);
}
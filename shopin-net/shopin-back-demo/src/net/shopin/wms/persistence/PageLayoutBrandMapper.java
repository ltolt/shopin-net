package net.shopin.wms.persistence;

import net.shopin.wms.domain.entity.PageLayoutBrand;

public interface PageLayoutBrandMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(PageLayoutBrand record);

    int insertSelective(PageLayoutBrand record);

    PageLayoutBrand selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(PageLayoutBrand record);

    int updateByPrimaryKey(PageLayoutBrand record);
}
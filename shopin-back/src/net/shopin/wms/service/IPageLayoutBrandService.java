package net.shopin.wms.service;

import net.shopin.wms.domain.entity.PageLayoutBrand;

public interface IPageLayoutBrandService {
    int deleteByPrimaryKey(Integer sid);

    int insert(PageLayoutBrand record);

    int insertSelective(PageLayoutBrand record);

    PageLayoutBrand selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(PageLayoutBrand record);

    int updateByPrimaryKey(PageLayoutBrand record);
}

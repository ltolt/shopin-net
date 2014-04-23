package net.shopin.wms.persistence;

import java.util.List;

import net.shopin.wms.domain.entity.PageTemplate;

public interface PageTemplateMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(PageTemplate record);

    int insertSelective(PageTemplate record);

    PageTemplate selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(PageTemplate record);

    int updateByPrimaryKey(PageTemplate record);
    
    List queryBySelective(PageTemplate record);
}
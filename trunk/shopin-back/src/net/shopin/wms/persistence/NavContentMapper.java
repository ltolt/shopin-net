package net.shopin.wms.persistence;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.NavContent;

@ShoppinMysqlMapper
public interface NavContentMapper {
	int deleteByPrimaryKey(Long sid);

	int insert(NavContent record);

	int insertSelective(NavContent record);

	NavContent selectByPrimaryKey(Long sid);

	int updateByPrimaryKeySelective(NavContent record);

	int updateByPrimaryKey(NavContent record);
}
package net.shopin.wms.persistence;

import java.util.List;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.PageLayoutMql;

@ShoppinMysqlMapper
public interface PageLayoutMqlMapper {
	int deleteByPrimaryKey(Integer sid);

	int insert(PageLayoutMql record);

	int insertSelective(PageLayoutMql record);

	PageLayoutMql selectByPrimaryKey(Integer sid);

	int updateByPrimaryKeySelective(PageLayoutMql record);

	int updateByPrimaryKey(PageLayoutMql record);

	int queryObjsCount(PageLayoutMql record);

	List queryBySelective(Integer channelSid);

	int queryMaxSid();

	List queryChildPageLayout(Long pageLayoutSid);
}
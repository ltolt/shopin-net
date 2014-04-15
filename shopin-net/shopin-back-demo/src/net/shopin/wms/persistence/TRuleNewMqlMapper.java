package net.shopin.wms.persistence;

import java.util.List;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.TRuleNewMql;
@ShoppinMysqlMapper
public interface TRuleNewMqlMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(TRuleNewMql record);

    int insertSelective(TRuleNewMql record);

    TRuleNewMql selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(TRuleNewMql record);

    int updateByPrimaryKey(TRuleNewMql record);

	List<TRuleNewMql> findAllRules();
	
	Integer queryMaxSidNum();
}
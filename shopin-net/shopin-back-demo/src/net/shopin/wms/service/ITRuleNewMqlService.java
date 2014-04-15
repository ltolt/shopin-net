/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceITRuleNewMqlService.java
 * @Create By shiying
 * @Create In 2013-9-18 上午11:00:04
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import org.springframework.stereotype.Service;

import net.shopin.wms.domain.entity.TRuleNewMql;

/**
 * @Class Name ITRuleNewMqlService
 * @Author shiying
 * @Create In 2013-9-18
 */
@Service(value="truleNewMqlService")
public interface ITRuleNewMqlService {
	int deleteByPrimaryKey(Integer sid);

    int insert(TRuleNewMql record);

    int insertSelective(TRuleNewMql record);

    TRuleNewMql selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(TRuleNewMql record);

    int updateByPrimaryKey(TRuleNewMql record);

	List<TRuleNewMql> findAllRules();
	
	Integer queryMaxSidNum();

}

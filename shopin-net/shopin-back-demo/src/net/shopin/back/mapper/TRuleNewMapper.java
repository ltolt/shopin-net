/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperTRuleNewMapper.java
 * @Create By Administrator
 * @Create In 2013-5-27 下午7:00:52
 * TODO
 */
package net.shopin.back.mapper;

import java.util.List;

import net.shopin.back.entity.cond.TRuleNewCond;
import net.shopin.back.entity.po.TRuleNew;
import net.shopin.back.entity.vo.TRuleNewVO;

import com.framework.IAbstractDAO;
import com.framework.persistence.ShoppinMapper;

/**
 * @Class Name TRuleNewMapper
 * @Author Administrator
 * @Create In 2013-5-27
 */
@ShoppinMapper
public interface TRuleNewMapper extends IAbstractDAO<TRuleNewCond, TRuleNew, TRuleNewVO>{
	
	Integer queryMaxSidNum();
	List<TRuleNewVO> findAllRules();
}

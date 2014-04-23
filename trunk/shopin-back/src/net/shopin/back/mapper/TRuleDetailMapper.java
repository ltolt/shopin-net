/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperTRuleDetail.java
 * @Create By shiying
 * @Create In 2013-6-24 下午2:16:02
 * TODO
 */
package net.shopin.back.mapper;

import java.util.List;

import net.shopin.back.entity.cond.TRuleDetailCond;
import net.shopin.back.entity.po.TRuleDetail;
import net.shopin.back.entity.vo.TRuleDetailVO;
import com.framework.IAbstractDAO;
import com.framework.persistence.ShoppinMapper;

/**
 * @Class Name TRuleDetail
 * @Author shiying
 * @Create In 2013-6-24
 */
@ShoppinMapper
public interface  TRuleDetailMapper extends IAbstractDAO<TRuleDetailCond, TRuleDetail, TRuleDetailVO>{

	List<TRuleDetailVO> findObjByRuleSid(Integer ruleSid);
	public void deleteByRuleSid(Integer ruleSid);
}

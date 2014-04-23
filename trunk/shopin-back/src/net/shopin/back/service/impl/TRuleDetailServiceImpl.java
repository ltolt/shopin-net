/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.service.implTRuleDetailServiceImpl.java
 * @Create By Administrator
 * @Create In 2013-6-24 下午4:09:54
 * TODO
 */
package net.shopin.back.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;

import net.shopin.back.entity.cond.TRuleDetailCond;
import net.shopin.back.entity.vo.TRuleDetailVO;
import net.shopin.back.mapper.TRuleDetailMapper;
import net.shopin.back.service.ITRuleDetailService;

/**
 * @Class Name TRuleDetailServiceImpl
 * @Author Administrator
 * @Create In 2013-6-24
 */

@Service(value="truleDetailService")
public class TRuleDetailServiceImpl implements ITRuleDetailService {

	@Autowired
	TRuleDetailMapper truleDetailMapper;
	
	public TRuleDetailVO findObjBySid(Infos infos, Long sid)
			throws SQLException {
	
		return truleDetailMapper.findObjBySid(sid);
	}

	
	public Paginator queryObjs(Infos infos, TRuleDetailCond cond)
			throws SQLException {
		Paginator page = new Paginator();
		page.setList(this.truleDetailMapper.queryObjsList(cond));
		page.setTotalRecords(this.truleDetailMapper.queryObjsCount(cond));
		page.setPage(cond);
		return page;
	}

	
	public void insert(Infos infos, TRuleDetailCond cond)
			throws SQLException {
		this.truleDetailMapper.insert(cond.getTruleDetail());
		
	}

	
	public void update(Infos infos, TRuleDetailCond cond)
			throws SQLException {
		this.truleDetailMapper.update(cond.getTruleDetail());
		
	}
	
	public void delete(Infos infos, Long sid) throws SQLException {
		this.truleDetailMapper.delete(sid);
		
	}

	public List<TRuleDetailVO> findDetails(Integer ruleSid) {
		return truleDetailMapper.findObjByRuleSid(ruleSid);
	}

	public void deleteByRuleSid(Integer ruleSid) {
		this.truleDetailMapper.deleteByRuleSid(ruleSid);
	}


	


}

/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.service.implTRuleNewServiceImpl.java
 * @Create By Administrator
 * @Create In 2013-5-28 上午11:16:11
 * TODO
 */
package net.shopin.back.service.impl;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.cond.TRuleNewChannelCond;
import net.shopin.back.entity.cond.TRuleNewCond;
import net.shopin.back.entity.po.TRuleNew;
import net.shopin.back.entity.po.TRuleNewChannel;
import net.shopin.back.entity.vo.ProBestDetailVO;
import net.shopin.back.entity.vo.TRuleNewVO;
import net.shopin.back.mapper.TRuleNewMapper;
import net.shopin.back.service.ITRuleNewService;
import net.shopin.back.view.TRuleNewKey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;

/**
 * @Class Name TRuleNewServiceImpl
 * @Author Administrator
 * @Create In 2013-5-28
 */
@Service(value="truleNewService")
public class TRuleNewServiceImpl implements ITRuleNewService  {
	
	@Autowired
	TRuleNewMapper truleNewMapper;

	
	public TRuleNewVO findObjBySid(Infos infos, Long sid) throws SQLException {
		// TODO Auto-generated method stub
		return truleNewMapper.findObjBySid(sid);
	}


	public Paginator queryObjs(Infos infos, TRuleNewCond cond)
			throws SQLException {
		Paginator page = new Paginator();
		page.setList(this.truleNewMapper.queryObjsList(cond));
		page.setTotalRecords(this.truleNewMapper.queryObjsCount(cond));
		page.setPage(cond);
		return page;
	}

	
	public void insert(Infos infos, TRuleNewCond cond) throws SQLException {
		this.truleNewMapper.insert(cond.getTruleNew());
		
	}

	
	public void update(Infos infos, TRuleNewCond cond) throws SQLException {
		this.truleNewMapper.update(cond.getTruleNew());
		
	}

	
	public void delete(Infos infos, Long sid) throws SQLException {
		this.truleNewMapper.delete(sid);
		
	}

	public List<TRuleNewVO> findAllRules() {
		List<TRuleNewVO> list =this.truleNewMapper.findAllRules();
		return list;
	}


	
	public Integer queryMaxSidNum() {
		Integer num = this.truleNewMapper.queryMaxSidNum();
		return num;
	}


	
	public void insertRule(TRuleNewKey truleNewKey) throws ParseException {
		

		
		TRuleNew truleNew = new TRuleNew();
		
		
		
		if (truleNewKey.getRuleName() != null
				&& !"".equals(truleNewKey.getRuleName())) {
			truleNew.setRuleName(truleNewKey.getRuleName());
		}
		if (truleNewKey.getActiveBeginTime() != null
				&& !"".equals(truleNewKey.getActiveBeginTime())) {
			SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setActiveBeginTime(sim.parse(truleNewKey
					.getActiveBeginTime()));
		}
		if (truleNewKey.getActiveEndTime() != null
				&& !"".equals(truleNewKey.getActiveEndTime())) {
			SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setActiveEndTime(sim.parse(truleNewKey
					.getActiveEndTime()));
		}
		if (truleNewKey.getCreateUser() != null
				&& !"".equals(truleNewKey.getCreateUser())) {
			truleNew.setCreateUser(truleNewKey.getCreateUser());
		}
		if (truleNewKey.getCreateTime() != null
				&& !"".equals(truleNewKey.getCreateTime())) {
			SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setCreateTime(sim.parse(truleNewKey.getCreateTime()));
		}
		if (truleNewKey.getUpdateUser() != null
				&& !"".equals(truleNewKey.getUpdateUser())) {
			truleNew.setUpdateUser(truleNewKey.getUpdateUser());
		}
		if (truleNewKey.getUpdateTime() != null
				&& !"".equals(truleNewKey.getUpdateTime())) {
			SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setUpdateTime(sim.parse(truleNewKey.getUpdateTime()));
		}

		
		
		TRuleNewCond cond = new TRuleNewCond();
		cond.setTruleNew(truleNew);
		
		TRuleNewChannelCond channelcond  = new TRuleNewChannelCond();
		
		try {
			this.truleNewMapper.insert(cond.getTruleNew());
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}


public void updateRule(TRuleNewKey truleNewKey) throws ParseException {
		
		
		TRuleNew truleNew = new TRuleNew();
		
		if (truleNewKey.getSid() != null
				&& !"".equals(truleNewKey.getSid())) {
			truleNew.setSid(Long.valueOf(truleNewKey.getSid()));
		}
		
		if (truleNewKey.getRuleName() != null
				&& !"".equals(truleNewKey.getRuleName())) {
			truleNew.setRuleName(truleNewKey.getRuleName());
		}
		if (truleNewKey.getActiveBeginTime() != null
				&& !"".equals(truleNewKey.getActiveBeginTime())) {
			SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setActiveBeginTime(sim.parse(truleNewKey
					.getActiveBeginTime()));
		}
		if (truleNewKey.getActiveEndTime() != null
				&& !"".equals(truleNewKey.getActiveEndTime())) {
			SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setActiveEndTime(sim.parse(truleNewKey
					.getActiveEndTime()));
		}
		if (truleNewKey.getCreateUser() != null
				&& !"".equals(truleNewKey.getCreateUser())) {
			truleNew.setCreateUser(truleNewKey.getCreateUser());
		}
		if (truleNewKey.getCreateTime() != null
				&& !"".equals(truleNewKey.getCreateTime())) {
			SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setCreateTime(sim.parse(truleNewKey.getCreateTime()));
		}
		if (truleNewKey.getUpdateUser() != null
				&& !"".equals(truleNewKey.getUpdateUser())) {
			truleNew.setUpdateUser(truleNewKey.getUpdateUser());
		}
		if (truleNewKey.getUpdateTime() != null
				&& !"".equals(truleNewKey.getUpdateTime())) {
			SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setUpdateTime(sim.parse(truleNewKey.getUpdateTime()));
		}
		
		
		TRuleNewCond cond = new TRuleNewCond();
		cond.setTruleNew(truleNew);
		
		
		try {
			this.truleNewMapper.update(cond.getTruleNew());
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	

}

/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.service.implRuleChannelServiceImpl.java
 * @Create By shiying
 * @Create In 2013-6-19 上午9:51:00
 * TODO
 */
package net.shopin.back.service.impl;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.shopin.back.entity.po.TRuleNewChannel;
import net.shopin.back.entity.vo.TRuleDetailVO;
import net.shopin.back.entity.vo.TRuleNewChannelVO;
import net.shopin.back.entity.vo.TRuleNewVO;
import net.shopin.back.mapper.TRuleDetailMapper;
import net.shopin.back.mapper.TRuleNewChannelMapper;
import net.shopin.back.mapper.TRuleNewMapper;
import net.shopin.back.service.ITRulesService;
import net.shopin.back.view.ChannelsVO;
import net.shopin.back.view.DetailsVO;
import net.shopin.back.view.RulesVO;

/**
 * @Class Name RuleChannelServiceImpl
 * @Author shiying
 * @Create In 2013-6-19
 */
@Service(value="rulesService")
public class TRulesServiceImpl implements ITRulesService{
	
	@Autowired
	TRuleNewChannelMapper truleNewChannelMapper;
	@Autowired
	TRuleNewMapper truleNewMapper;
	@Autowired
	TRuleDetailMapper truleDetailMapper;

	
	public List<ChannelsVO> findRules() throws SQLException {
		List<ChannelsVO> channelsVO = new ArrayList<ChannelsVO>();
		   List<TRuleNewChannelVO> channelList = truleNewChannelMapper.findChannels();
		   if(channelList!=null&&!"".equals(channelList)){
			   for(int i=0;i<channelList.size();i++){
				   TRuleNewChannelVO trvo = new TRuleNewChannelVO();
				   ChannelsVO chvo = new ChannelsVO();
				   trvo=channelList.get(i);
				   chvo.setChannelName(trvo.getChannelName());
				   chvo.setChannelSid(trvo.getChannelSid()+"");
				   List<TRuleNewChannelVO> ruleSidList =  truleNewChannelMapper.findRuleSid(Integer.valueOf(trvo.getChannelSid()+""));
				   List<RulesVO> RulesVO = new ArrayList<RulesVO>();
				   
				    if(ruleSidList!=null&&!"".equals(ruleSidList)){
				    	for(int j=0;j<ruleSidList.size();j++){
				    		TRuleNewChannelVO channelVO = new TRuleNewChannelVO();
				    		channelVO=ruleSidList.get(j);
				    	if(channelVO.getRuleSid()!=null&&!"".equals(channelVO.getRuleSid())){
				    			TRuleNewVO ruleList = truleNewMapper.findObjBySid(channelVO.getRuleSid());
				    			RulesVO rules = new RulesVO();
				    		if(ruleList!=null&&!"".equals(ruleList)){
				    			if(ruleList.getActiveBeginTime()!=null&&!"".equals(ruleList.getActiveBeginTime())){
				    				rules.setActiveBeginTime(ruleList.getActiveBeginTime()+"");
								}
				    			if(ruleList.getActiveEndTime()!=null&&!"".equals(ruleList.getActiveEndTime())){
				    				rules.setActiveEndTime(ruleList.getActiveEndTime()+"");
								}
				    			if(ruleList.getCreateTime()!=null&&!"".equals(ruleList.getCreateTime())){
				    				rules.setCreateTime(ruleList.getCreateTime()+"");
								}
				    			if(ruleList.getCreateUser()!=null&&!"".equals(ruleList.getCreateUser())){
				    				rules.setCreateUser(ruleList.getCreateUser());
								}
				    			if(ruleList.getRuleName()!=null&&!"".equals(ruleList.getRuleName())){
				    				rules.setRuleName(ruleList.getRuleName());
								}
				    			if(ruleList.getSid()!=null&&!"".equals(ruleList.getSid())){
				    				rules.setSid(ruleList.getSid()+"");
								}
				    			if(ruleList.getUpdateTime()!=null&&!"".equals(ruleList.getUpdateTime())){
				    				rules.setUpdateTime(ruleList.getUpdateTime()+"");
								}
				    			if(ruleList.getFlag()!=null&&!"".equals(ruleList.getFlag())){
				    				rules.setFlag(ruleList.getFlag()+"");
								}
				    			if(ruleList.getUpdateUser()!=null&&!"".equals(ruleList.getFlag())){
				    				rules.setUpdateUser(ruleList.getUpdateUser()+"");
								}
				    		}
						    	List <DetailsVO> detailvo =getDetailMap(Integer.valueOf(channelVO.getRuleSid()+""));
						    	 if(detailvo!=null)
								 { 
						    		 rules.setDetails(detailvo);
									 }	
						    	RulesVO.add(rules);
							}
				    	
				    	
				    	}
				    }
				   
				    chvo.setRules(RulesVO);
				   channelsVO.add(chvo);
			   }
			 
			   return channelsVO;
		   }
		return null;
		
	}

	private List<DetailsVO> getDetailMap(Integer ruleSid) {
		List<DetailsVO> list = new ArrayList<DetailsVO>();
		List<TRuleDetailVO> list1 = truleDetailMapper.findObjByRuleSid(ruleSid);
		if(list1!=null&&list1.size()>0){
			for(int i=0;i<list1.size();i++){
				DetailsVO vo = new DetailsVO();
				TRuleDetailVO truleDetailVO=list1.get(i);
				if(truleDetailVO.getBrandName()!=null&&!"".equals(truleDetailVO.getBrandName())){
					vo.setBrandName(truleDetailVO.getBrandName());
				}
				if(truleDetailVO.getBrandSid()!=null&&!"".equals(truleDetailVO.getBrandSid())){
					vo.setBrandSid(truleDetailVO.getBrandSid()+"");
				}
				if(truleDetailVO.getProductClassName()!=null&&!"".equals(truleDetailVO.getProductClassName())){
					vo.setProductClassName(truleDetailVO.getProductClassName());
				}
				if(truleDetailVO.getProductClassSid()!=null&&!"".equals(truleDetailVO.getProductClassSid())){
					vo.setProductClassSid(truleDetailVO.getProductClassSid()+"");
				}
				if(truleDetailVO.getRuleSid()!=null&&!"".equals(truleDetailVO.getRuleSid())){
					vo.setRuleSid(truleDetailVO.getRuleSid()+"");
				}
				if(truleDetailVO.getSid()!=null&&!"".equals(truleDetailVO.getSid())){
					vo.setSid(truleDetailVO.getSid()+"");
				}
				
				if(truleDetailVO.getOffMax()!=null&&!"".equals(truleDetailVO.getOffMax())){
					vo.setOffMax(truleDetailVO.getOffMax()+"");
				}
				if(truleDetailVO.getOffMin()!=null&&!"".equals(truleDetailVO.getOffMin())){
					vo.setOffMin(truleDetailVO.getOffMin()+"");
				}
				if(truleDetailVO.getPriceMax()!=null&&!"".equals(truleDetailVO.getPriceMax())){
					vo.setPriceMax(truleDetailVO.getPriceMax()+"");
				}
				if(truleDetailVO.getPriceMin()!=null&&!"".equals(truleDetailVO.getPriceMin())){
					vo.setPriceMin(truleDetailVO.getPriceMin()+"");
				}
				if(truleDetailVO.getPriceUpdateTime()!=null&&!"".equals(truleDetailVO.getPriceUpdateTime())){
					vo.setPriceUpdateTime(truleDetailVO.getPriceUpdateTime()+"");
				}
				if(truleDetailVO.getSaleCode()!=null&&!"".equals(truleDetailVO.getSaleCode())){
					vo.setSaleCode(truleDetailVO.getSaleCode());
				}
				if(truleDetailVO.getSaleSum()!=null&&!"".equals(truleDetailVO.getSaleSum())){
					vo.setSaleSum(truleDetailVO.getSaleSum()+"");
				}
				if(truleDetailVO.getShopName()!=null&&!"".equals(truleDetailVO.getShopName())){
					vo.setShopName(truleDetailVO.getShopName());
				}
				if(truleDetailVO.getShopSid()!=null&&!"".equals(truleDetailVO.getShopSid())){
					vo.setShopSid(truleDetailVO.getShopSid()+"");
				}
				if(truleDetailVO.getStockMax()!=null&&!"".equals(truleDetailVO.getStockMax())){
					vo.setStockMax(truleDetailVO.getStockMax()+"");
				}
				if(truleDetailVO.getStockMin()!=null&&!"".equals(truleDetailVO.getStockMin())){
					vo.setStockMin(truleDetailVO.getStockMin()+"");
				}
				list.add(vo);
				
			}
			return list;
		}
	return null;
		
	}



	
}

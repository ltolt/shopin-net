package net.shopin.wms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.shopin.wms.domain.entity.TRuleNewChannelMql;
import net.shopin.wms.persistence.TRuleNewChannelMqlMapper;
import net.shopin.wms.service.ITRuleNewChannelMqlService;

@Service(value="truleNewChannelMqlService")
public class TRuleNewChannelMqlServiceImpl implements ITRuleNewChannelMqlService {

	@Autowired
	private TRuleNewChannelMqlMapper truleNewChannelMqlMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.truleNewChannelMqlMapper.deleteByPrimaryKey(sid);
	}

	@Override
	public int insert(TRuleNewChannelMql record) {
		// TODO Auto-generated method stub
		return this.truleNewChannelMqlMapper.insert(record);
	}

	@Override
	public int insertSelective(TRuleNewChannelMql record) {
		// TODO Auto-generated method stub
		return this.truleNewChannelMqlMapper.insertSelective(record);
	}

	@Override
	public TRuleNewChannelMql selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.truleNewChannelMqlMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int updateByPrimaryKeySelective(TRuleNewChannelMql record) {
		// TODO Auto-generated method stub
		return this.truleNewChannelMqlMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(TRuleNewChannelMql record) {
		// TODO Auto-generated method stub
		return this.truleNewChannelMqlMapper.updateByPrimaryKey(record);
	}

}

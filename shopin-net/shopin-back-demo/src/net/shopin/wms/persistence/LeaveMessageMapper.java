package net.shopin.wms.persistence;

import java.util.List;

import net.shopin.wms.domain.entity.LeaveMessage;
import net.shopin.wms.domain.view.LeaveMessageVO;

import com.framework.persistence.ShoppinMysqlMapper;

@ShoppinMysqlMapper
public interface LeaveMessageMapper {
    int deleteByPrimaryKey(Integer msgid);

    int insert(LeaveMessage record);

    int insertSelective(LeaveMessage record);

    LeaveMessage selectByPrimaryKey(Integer msgid);

    int updateByPrimaryKeySelective(LeaveMessage record);

    int updateByPrimaryKey(LeaveMessage record);
    
    List<LeaveMessage> selectByParms(LeaveMessageVO record);
    
    int selectPageCount(LeaveMessageVO record);
}
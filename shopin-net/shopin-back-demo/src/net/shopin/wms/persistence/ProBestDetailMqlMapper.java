package net.shopin.wms.persistence;

import java.util.List;

import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.po.ProBestDetail;
import net.shopin.back.entity.vo.ProBestDetailVO;
import net.shopin.wms.domain.entity.ProBestDetailMql;

public interface ProBestDetailMqlMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(ProBestDetailMql record);

    int insertSelective(ProBestDetailMql record);

    ProBestDetailMql selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(ProBestDetailMql record);

    int updateByPrimaryKey(ProBestDetailMql record);
    
    List<ProBestDetailMql>  queryProList(Integer pageLayoutSid);
    
    Integer queryMaxOrderNum(Integer pageLayoutSid);
    
    Integer queryObjsCount(ProBestDetailMql record);

    public void deleteByProductListSid(ProBestDetailMql proBestDetailMql);
    
    ProBestDetailMql queryOrderNumber(ProBestDetailMql record);
    
}
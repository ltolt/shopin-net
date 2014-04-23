/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceIProBestDetailMqlService.java
 * @Create By jingpeng
 * @Create In 2013-8-29 下午6:43:43
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.po.ProBestDetail;
import net.shopin.back.entity.vo.ProBestDetailVO;
import net.shopin.wms.domain.entity.ProBestDetailMql;

/**
 * @Class Name IProBestDetailMqlService
 * @Author jingpeng
 * @Create In 2013-8-29
 */
public interface IProBestDetailMqlService {
	int deleteByPrimaryKey(Integer sid);

    int insert(ProBestDetailMql record);

    int insertSelective(ProBestDetailMql record);

    ProBestDetailMql selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(ProBestDetailMql record);

    int updateByPrimaryKey(ProBestDetailMql record);
    
    List<ProBestDetailMql>  queryProList(Integer pageLayoutSid);
    
    public void deleteByProductListSid(ProBestDetailMql proBestDetailMql);
    
    void insertBatch(String pageLayoutSid, String[] productSidsArray);
    
    ProBestDetailMql queryOrderNumber(ProBestDetailMql record);
}

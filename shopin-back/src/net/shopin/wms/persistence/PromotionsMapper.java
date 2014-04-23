package net.shopin.wms.persistence;

import java.util.List;

import net.shopin.wms.domain.entity.Promotions;
import net.shopin.wms.domain.view.PromotionsVO;

import com.framework.persistence.ShoppinMysqlMapper;

@ShoppinMysqlMapper
public interface PromotionsMapper {
	int deleteByPrimaryKey(Integer sid);

	int insert(Promotions record);

	int insertSelective(Promotions record);

	Promotions selectByPrimaryKey(Integer sid);

	int updateByPrimaryKeySelective(Promotions record);

	int updateByPrimaryKey(Promotions record);
	
    List selectAllPromotions();
    
    List selectByTitle(Promotions record);
    
    int queryMaxSid();
    
    List<Promotions> selectByPrams(PromotionsVO record);
    
    Integer selectCountByParms(PromotionsVO record);
}
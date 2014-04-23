package net.shopin.wms.persistence;

import java.util.List;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.NavBrand;
import net.shopin.wms.domain.entity.NavPromotion;

@ShoppinMysqlMapper
public interface NavPromotionMapper {
	int insert(NavPromotion record);
	
	int deleteByNavPro(NavPromotion record);
	
	int countNavPromotionRecord(NavPromotion record);

	int insertSelective(NavPromotion record);
	
	List<NavPromotion> selectByNavSid(NavPromotion record);
}
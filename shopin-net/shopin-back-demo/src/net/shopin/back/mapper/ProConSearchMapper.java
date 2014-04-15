/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperProConSearchMapper.java
 * @Create By k
 * @Create In 2013-5-9 下午3:22:46
 * TODO
 */
package net.shopin.back.mapper;

import net.shopin.back.entity.cond.ProConSearchCond;
import net.shopin.back.entity.po.ProConSearch;
import net.shopin.back.entity.vo.ProConSearchVO;
import net.shopin.back.view.ProductKey;

import com.framework.IAbstractDAO;
import com.framework.persistence.ShoppinMapper;

/**
 * @desc  mapper 
 * @Class Name ProConSearchMapper
 * @Author kongm
 * @Create In 2013-5-9
 */
@ShoppinMapper
public interface ProConSearchMapper extends IAbstractDAO<ProConSearchCond, ProConSearch, ProConSearchVO>{

	void updateProConSearch(ProductKey productKey);
	
}

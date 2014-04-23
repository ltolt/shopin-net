/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperProBestDetailMapper.java
 * @Create By shiying
 * @Create In 2013-5-13 上午11:32:53
 * TODO
 */
package net.shopin.back.mapper;

import java.util.List;

import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.po.ProBestDetail;
import net.shopin.back.entity.vo.ProBestDetailVO;

import com.framework.IAbstractDAO;
import com.framework.persistence.ShoppinMapper;

/**
 * @Class Name ProBestDetailMapper
 * @Author shiying
 * @Create In 2013-5-13
 */
@ShoppinMapper
public interface ProBestDetailMapper extends IAbstractDAO<ProBestDetailCond, ProBestDetail, ProBestDetailVO> {

	List queryProductsByPsid(Long pageLayoutSid);

	void updateProBestDetail(Integer productListSid, Integer pageLayoutSid);

	ProBestDetailVO queryOrderNumber(ProBestDetailCond cond);

	int deleteByProductListSid(ProBestDetail proBestDetail);


	Integer queryMaxOrderNum(Long pageLayoutSid);

	
	
}

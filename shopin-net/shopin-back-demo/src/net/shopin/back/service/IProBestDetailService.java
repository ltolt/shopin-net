/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceIProBestDetailService.java
 * @Create By shiying
 * @Create In 2013-5-13 下午3:02:05
 * TODO
 */
package net.shopin.back.service;

import java.util.List;

import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.po.ProBestDetail;
import net.shopin.back.entity.vo.ProBestDetailVO;

import com.framework.IAbstractService;

/**
 * @Class Name IProBestDetailService
 * @Author shiying
 * @Create In 2013-5-13
 */
public interface IProBestDetailService extends IAbstractService<ProBestDetailCond,ProBestDetail,ProBestDetailVO>{

	List queryProductsByPsid(Long pageLayoutSid);
	

	void updateProBestDetail(Integer productListSid,Integer pageLayoutSid);
	
	ProBestDetailVO queryOrderNumber(ProBestDetailCond cond);
	 
	public void deleteByProductListSid(ProBestDetail proBestDetail);

	/**
	 * @Methods Name insertBatch
	 * @Create In 2013-5-20 By kongm
	 * @param pageLayoutSid
	 * @param productSidsArray void
	 */
	void insertBatch(String pageLayoutSid, String[] productSidsArray);
	

}

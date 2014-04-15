/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.service.implPageLayoutService.java
 * @Create By shiying
 * @Create In 2013-5-13 下午2:35:15
 * TODO
 */
package net.shopin.back.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;
import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.po.ProBestDetail;
import net.shopin.back.entity.vo.ProBestDetailVO;
import net.shopin.back.mapper.ProBestDetailMapper;
import net.shopin.back.service.IProBestDetailService;

/**
 * @Class Name ProBestDetailService
 * @Author shiying
 * @Create In 2013-5-13
 */
@Service(value = "proBestDetailService")
public class ProBestDetailServiceImpl implements IProBestDetailService {
	@Autowired
	private ProBestDetailMapper proBestDetailMapper;

	public ProBestDetailVO findObjBySid(Infos infos, Long sid)
			throws SQLException {
		return proBestDetailMapper.findObjBySid(sid);
	}

	public Paginator queryObjs(Infos infos, ProBestDetailCond cond)
			throws SQLException {
		Paginator page = new Paginator();
		page.setList(proBestDetailMapper.queryObjsList(cond));
		page.setTotalRecords(proBestDetailMapper.queryObjsCount(cond));
		page.setPage(cond);
		return page;
	}

	public void insert(Infos infos, ProBestDetailCond cond) throws SQLException {
		proBestDetailMapper.insert(cond.getProBestDetail());
	}

	public void update(Infos infos, ProBestDetailCond cond) throws SQLException {
		proBestDetailMapper.update(cond.getProBestDetail());
	}

	public void delete(Infos infos, Long sid) throws SQLException {
		proBestDetailMapper.delete(sid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * net.shopin.back.service.IProBestDetailService#queryProductsByPsid(java
	 * .lang.Long)
	 */
	public List queryProductsByPsid(Long pageLayoutSid) {
		List list = this.proBestDetailMapper.queryProductsByPsid(pageLayoutSid);
		return list;
	}

	public void deleteByProductListSid(ProBestDetail proBestDetail) {
		proBestDetailMapper.deleteByProductListSid(proBestDetail);
	}


	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * net.shopin.back.service.IProBestDetailService#insertBatch(java.lang.String
	 * , java.lang.String[])
	 */
	public void insertBatch(String pageLayoutSid, String[] productSidsArray) {
		try {
			Integer ordernum = this.proBestDetailMapper.queryMaxOrderNum(Long.valueOf(pageLayoutSid));
			ordernum = (ordernum==null)?0:ordernum;
			ProBestDetail po = null;
			for (int i = 0; i < productSidsArray.length; i++) {
				ProBestDetailCond cond = null;
				cond = new ProBestDetailCond();
				cond.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
				cond.setProductListSid(Integer.valueOf(productSidsArray[i]));
				Integer resultnum = this.proBestDetailMapper.queryObjsCount(cond);
				if(resultnum==0){
				       po = new ProBestDetail();
				       po.setOrderNumber(++ordernum);
				       po.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
				       po.setProductListSid(Integer.valueOf(productSidsArray[i]));
				this.proBestDetailMapper.insert(po);
				}else{
					System.out.println("此商品已保存");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

	}
	



	public void updateProBestDetail(Integer productListSid,Integer pageLayoutSid) {
		this.proBestDetailMapper.updateProBestDetail(productListSid,pageLayoutSid);
	}

	public ProBestDetailVO queryOrderNumber(ProBestDetailCond cond) {
		return this.proBestDetailMapper.queryOrderNumber(cond);
	}


}

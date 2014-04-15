/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.implProBestDetailMqlServiceImpl.java
 * @Create By jingpeng
 * @Create In 2013-8-29 下午7:00:30
 * TODO
 */
package net.shopin.wms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.po.ProBestDetail;
import net.shopin.wms.domain.entity.ProBestDetailMql;
import net.shopin.wms.persistence.ProBestDetailMqlMapper;
import net.shopin.wms.service.IProBestDetailMqlService;

/**
 * @Class Name ProBestDetailMqlServiceImpl
 * @Author jingpeng
 * @Create In 2013-8-29
 */
@Component("proBestDetailMqlService")
@Scope("prototype")
@Transactional
public class ProBestDetailMqlServiceImpl implements IProBestDetailMqlService {
	
	@Autowired
	ProBestDetailMqlMapper proBestDetailMqlMapper;
	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IProBestDetailMqlService#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.proBestDetailMqlMapper.deleteByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IProBestDetailMqlService#insert(net.shopin.wms.domain.entity.ProBestDetailMql)
	 */
	@Override
	public int insert(ProBestDetailMql record) {
		// TODO Auto-generated method stub
		return this.proBestDetailMqlMapper.insert(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IProBestDetailMqlService#insertSelective(net.shopin.wms.domain.entity.ProBestDetailMql)
	 */
	@Override
	public int insertSelective(ProBestDetailMql record) {
		// TODO Auto-generated method stub
		return this.proBestDetailMqlMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IProBestDetailMqlService#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public ProBestDetailMql selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.proBestDetailMqlMapper.selectByPrimaryKey(sid);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IProBestDetailMqlService#updateByPrimaryKeySelective(net.shopin.wms.domain.entity.ProBestDetailMql)
	 */
	@Override
	public int updateByPrimaryKeySelective(ProBestDetailMql record) {
		// TODO Auto-generated method stub
		return this.proBestDetailMqlMapper.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see net.shopin.wms.service.IProBestDetailMqlService#updateByPrimaryKey(net.shopin.wms.domain.entity.ProBestDetailMql)
	 */
	@Override
	public int updateByPrimaryKey(ProBestDetailMql record) {
		// TODO Auto-generated method stub
		return this.proBestDetailMqlMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<ProBestDetailMql> queryProList(Integer pageLayoutSid) {
		
		return this.proBestDetailMqlMapper.queryProList(pageLayoutSid);
	}

	@Override
	public void insertBatch(String pageLayoutSid, String[] productSidsArray) {
		try {
			Integer ordernum = this.proBestDetailMqlMapper.queryMaxOrderNum(Integer.valueOf(pageLayoutSid));
			ordernum = (ordernum==null)?0:ordernum;
			ProBestDetailMql po = null;
			for (int i = 0; i < productSidsArray.length; i++) {
				ProBestDetailMql record = new ProBestDetailMql();
			
				record.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
				record.setProductListSid(Integer.valueOf(productSidsArray[i]));
				Integer resultnum = this.proBestDetailMqlMapper.queryObjsCount(record);
				if(resultnum==0){
				       po = new ProBestDetailMql();
				       po.setOrderNumber(++ordernum);
				       po.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
				       po.setProductListSid(Integer.valueOf(productSidsArray[i]));
				this.proBestDetailMqlMapper.insertSelective(po);
				}else{
					System.out.println("此商品已保存");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		
	}

	@Override
	public void deleteByProductListSid(ProBestDetailMql roBestDetailMql) {
		proBestDetailMqlMapper.deleteByProductListSid(roBestDetailMql);
		
	}

	@Override
	public ProBestDetailMql queryOrderNumber(ProBestDetailMql record) {
		return this.proBestDetailMqlMapper.queryOrderNumber(record);
	}

}

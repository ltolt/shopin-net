/**
 * @Probject Name: business
 * @Path: net.shopin.service.ProductServiceImpl.java
 * @Create By wangdg
 * @Create In 2013-7-11 上午11:04:42
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.shopin.api.IProductService;
import net.shopin.constants.ErrorCodeConstants.ErrorCode;
import net.shopin.entity.ProBestDetail;
import net.shopin.entity.ProConSearch;
import net.shopin.exception.SSDRemoteException;
import net.shopin.exception.SystemException;
import net.shopin.util.Constants;
import net.shopin.util.HttpUtil;
import net.shopin.util.JsonUtil;
import net.shopin.util.StringUtils;
import net.shopin.view.SsdProductVO;
import net.shopin.view.ValueIntervalVO;
import net.shopin.view.WebProductVO;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.interceptor.MethodCache;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name ProductServiceImpl
 * @Author wangdg
 * @Create In 2013-7-11
 */
@Component("productService")
@Scope("prototype")
@Transactional(readOnly = true)
public class ProductServiceImpl implements IProductService {

	protected final Logger log = LoggerFactory.getLogger(getClass());
	private SimpleHibernateDao<ProConSearch, Integer> proConSearchDao;
	private SimpleHibernateDao<ProBestDetail, Integer> proBestDetailDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.proConSearchDao = new SimpleHibernateDao<ProConSearch, Integer>(
				sessionFactory, ProConSearch.class);
		this.proBestDetailDao = new SimpleHibernateDao<ProBestDetail, Integer>(
				sessionFactory, ProBestDetail.class);
	}

	@Transactional(readOnly = true, propagation = Propagation.REQUIRES_NEW)
	@MethodCache(expire = 3600)
	public List<WebProductVO> getPageLayoutProducts(Integer sid,
			int minProQuantity) {
		String json = "";
		List<WebProductVO> listVo = new ArrayList<WebProductVO>();
		List<WebProductVO> list = new ArrayList<WebProductVO>();

		List<String> proSidsList = this.proBestDetailDao.createCriteria()
				.add(Restrictions.eq("pageLayoutSid", sid))
				.setProjection(Projections.property("productListSid"))
				.addOrder(Order.asc("orderNumber")).list();
		if (proSidsList != null && !"".equals(proSidsList)
				&& proSidsList.size() > 0) {
			String str = StringUtils.listToString(proSidsList);

			Map paraMap = new HashMap();
			paraMap.put("param", str);
			try {
				json = HttpUtil.HttpPost(Constants.SSD_SYSTEM,
						"bw/getByProductSids.html", paraMap);
				listVo = JsonUtil.jsonToProductsVO(json);

				for (int i = 0; i < proSidsList.size(); i++) {
					for (int j = 0; j < listVo.size(); j++) {
						String proSid = String.valueOf(proSidsList.get(i));
						if (proSid.equals(listVo.get(j).getId())) {
							list.add(listVo.get(j));
							break;
						}
					}
				}
			} catch (SystemException e) {
				throw new SSDRemoteException(
						ErrorCode.SSD_REMOTE_ERROR.getErrorCode(), e);
			}
			if (list != null && (list.size() < minProQuantity)) {
				this.log.warn("需要根据抓取条件生成商品");
				list.addAll(getProducts(sid.intValue(),
						minProQuantity - list.size()));

			}
		} else {
			this.log.warn("需要根据抓取条件生成商品");
			list.addAll(getProducts(sid.intValue(), minProQuantity));
		}
		return list;
	}

	@Override
	public List<WebProductVO> getProducts(int layoutId, int size) {
		String json = "";
		List volist = new ArrayList();
		ProConSearch con = (ProConSearch) this.proConSearchDao.findByUnique(
				"pageLayoutSid", Integer.valueOf(layoutId));
		if (con == null) {
			return new ArrayList();
		}
		try {
			Map paraMap = new HashMap();
			if ((con.getSaleCodeSid() != null)
					&& (!"".equals(con.getSaleCodeSid()))) {
				paraMap.put("saleCodeSid", con.getSaleCodeSid());
			}
			if ((con.getProductClassSid() != null)
					&& (!"".equals(con.getProductClassSid()))) {
				paraMap.put("productClassSid", con.getProductClassSid());
			}
			if ((con.getBrandSid() != null) && (!"".equals(con.getBrandSid()))) {
				paraMap.put("brandSid", con.getBrandSid());
			}
			if ((con.getProSku() != null) && (!"".equals(con.getProSku()))) {
				paraMap.put("proSku", con.getProSku());
			}
			if ((con.getProStockNum() != null)
					&& (!"".equals(con.getProStockNum()))) {
				paraMap.put("proStockNum", con.getProStockNum());
			}
			if ((con.getOffMin() != null) && (!"".equals(con.getOffMin()))) {
				paraMap.put("offMin", con.getOffMin());
			}
			if ((con.getOffMax() != null) && (!"".equals(con.getOffMax()))) {
				paraMap.put("offMax", con.getOffMax());
			}
			if ((con.getPriceMin() != null) && (!"".equals(con.getPriceMin()))) {
				paraMap.put("priceMin", con.getPriceMin());
			}
			if ((con.getPriceMax() != null) && (!"".equals(con.getPriceMax()))) {
				paraMap.put("priceMax", con.getPriceMax());
			}
			if ((con.getProBeginTime() != null)
					&& (!"s".equals(con.getProBeginTime()))) {
				paraMap.put("proBeginTime",
						String.valueOf(con.getProBeginTime()));
			}
			if ((con.getProEndTime() != null)
					&& (!"".equals(con.getProEndTime()))) {
				paraMap.put("proEndTime", String.valueOf(con.getProEndTime()));
			}
			// 调接口
			// json = HttpUtil.HttpPost(Constants.SSD_SYSTEM,
			// "bw/getByProductSids.html", paraMap);
			// List<WebProductVO> listVo = JsonUtil.jsonToProductsVO(json);
			// volist.add(listVo);
		} catch (Exception px) {
			px.printStackTrace();
		}
		return volist;
	}

	/**
	 * 说明:获取ssd单品信息
	 */
	@MethodCache(expire = 1800)
	@Transactional(readOnly = true)
	public SsdProductVO getProduct(String productId) {
		String json = "";
		Map parmMap = new HashMap();
		parmMap.put("sid", Integer.valueOf(productId));
		SsdProductVO vo;
		try {
			json = HttpUtil.HttpPost(Constants.SSD_SYSTEM, "web/product.html",
					parmMap);
			vo = JsonUtil.jsonToSsdProductVO(json);
			// 若ssd没有该商品信息返回
			if (vo == null)
				return null;
			Double offvalue = vo.getOffValue();
			offvalue = (double) Math.round(offvalue * 100) / 100;

			vo.setOffValue(offvalue);
			return vo;
		} catch (SystemException e) {
			throw new SSDRemoteException(
					ErrorCode.SSD_REMOTE_ERROR.getErrorCode(), e);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public long getStockByDetail(String proDetailSid, String price, String flag) {
		String json = "";
		Long stock = null;
		Map parmMap = new HashMap();
		parmMap.put("proDetailSid", proDetailSid);
		parmMap.put("price", price);
		parmMap.put("flag", flag);
		try {
			json = HttpUtil.HttpPost(Constants.SSD_SYSTEM, "web/getStock.html",
					parmMap);
			stock = JsonUtil.jsonToLong(json);

		} catch (Exception e) {
			log.error("ssd网络异常");
			e.getStackTrace();
		}
		return stock;
	}
}

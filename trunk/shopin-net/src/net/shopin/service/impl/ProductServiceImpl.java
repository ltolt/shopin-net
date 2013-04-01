package net.shopin.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import base.framework.cache.interceptor.MethodCache;
import base.framework.orm.hibernate.SimpleHibernateDao;
import base.framework.util.DozerMapper;
import base.framework.util.FormatUtil;

import net.shopin.entity.Brand;
import net.shopin.entity.ProductClass;
import net.shopin.entity.ProductList;
import net.shopin.service.IProductService;
import net.shopin.view.BrandVO;
import net.shopin.view.ProductCateVO;
import net.shopin.view.ProductVO;

@Component("productService")
@Scope("prototype")
@Transactional(readOnly = true)
public class ProductServiceImpl implements IProductService {

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private SimpleHibernateDao<ProductList,Integer> productDao;
	
	private SimpleHibernateDao<ProductClass,Integer> productClassDao;
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){
		this.productDao = new SimpleHibernateDao<ProductList, Integer>(sessionFactory,ProductList.class);
		this.productClassDao = new SimpleHibernateDao<ProductClass, Integer>(sessionFactory,ProductClass.class);
	}
	
	
	@Transactional
	public void save(ProductList record) {
		this.productDao.save(record);
	}

	@Transactional
	public void delete(ProductList record) {
		this.productDao.delete(record);
	}

	@Transactional
	public ProductList get(Integer sid) {
		return this.productDao.get(sid);
	}

	@Transactional
	public void deleteBySid(Integer sid) {
		this.productDao.delete(sid);
	}

	@Transactional
	public ProductList load(Integer sid) {
		return this.productDao.load(sid);
	}

	@Transactional
	public List getAll() {
		return this.productDao.getAll();
	}

	@Transactional
	public List findByCriteria(String propertyName, Object value) {
		return this.productDao.findBy(propertyName, value);
	}

	@Transactional
	public ProductList findByUnique(String propertyName, Object value) {
		return this.productDao.findByUnique(propertyName, value);
	}

	@Transactional
	public List queryForList(String hql, Object... values) {
		return (List) this.productDao.find(hql, values);
	}

	@Override
	public List queryForList(String hql, Map map) {
		return this.productDao.find(hql, map);
	}

	@Transactional(readOnly = true)
	//@MethodCache(expire = 1800)
	public ProductVO getProduct(String productId) {
		//校验参数
		if(productId == null || "".equals(productId.trim())){
			throw new IllegalArgumentException("productId = " + productId);
		}
		ProductList pro = (ProductList)this.productDao.createCriteria()
				//.add(Restrictions.eq("proType", 1))
				//.add(Restrictions.eq("proActiveBit", 1))
				.setFetchMode("brand", FetchMode.JOIN)
				.setFetchMode("proDetails", FetchMode.JOIN)
				.add(Restrictions.eq("sid", Integer.valueOf(productId)))
				.uniqueResult();
		//System.out.println("productList : " + pro);
		if(pro == null){
			return new ProductVO();
		}
		
		
		return mapProductListToVO(pro,true,true);
	}

	/**
	 * po 转化为 vo
	 * @param pro
	 * @param b
	 * @param c
	 * @return
	 */
	private ProductVO mapProductListToVO(ProductList pro, Boolean...fields) {
		if(pro == null){
			throw new IllegalArgumentException("pro = " + pro);
		}
		//商品基本信息
		ProductVO vo = new ProductVO();
		//如果vo和po属性名字一样(包括集合)会自动映射
		DozerMapper.getInstance().map(pro, vo);
		try {
			
//			BeanUtils.copyProperties(vo, pro);
			//品牌附加信息
			if(pro.getBrand() != null){
				BrandVO brandVo = vo.getBrand();
				Brand brand = pro.getBrand();
				DozerMapper.getInstance().map(brand, brandVo);
//				BeanUtils.copyProperties(brandVo, brand);
				vo.setBrand(brandVo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Transactional
	public ProductVO getProductByDetailSid(String proDetailSid) {
		if(proDetailSid == null || "".equals(proDetailSid.trim())){
			//校验参数
			throw new IllegalArgumentException("productDetailSid = " + proDetailSid);
		}
		ProductList pro = (ProductList)this.productDao.createCriteria()
				.createAlias("proDetails", "proDetail")
				.add(Restrictions.eq("proActiveBit", 1))
				.setFetchMode("brand", FetchMode.JOIN)
				.setFetchMode("proDetails", FetchMode.JOIN)
				.add(Restrictions.eq("proDetail.sid", Integer.valueOf(proDetailSid)))
				.uniqueResult();
		if(pro == null)return new ProductVO();
		
		return this.mapProductListToVO(pro);
	}
	@Transactional(readOnly = true)
	public ProductCateVO findCurrentCateList() {
		Criteria criteria = getQueryCriteria();
		criteria.createAlias("productClasses", "productClasses");
		//叶子
		List list = criteria.setProjection(Projections.projectionList()
				.add(Projections.countDistinct("sid"))
				.add(Projections.groupProperty("productClasses.sid"))
				.add(Projections.groupProperty("productClasses.nodeSeq"))
				.add(Projections.groupProperty("productClasses.nodeLevel"))
				).addOrder(Order.desc("productClasses.nodeLevel"))
				.list();
		if(list == null || list.isEmpty()){
			return new ProductCateVO();
		}
		Map<String, ProductCateVO> map = new TreeMap<String, ProductCateVO>();
		for(int i = 0;i<list.size();i++){
			Object[] obj = (Object[]) list.get(i);
			if(obj == null) continue;
			ProductCateVO vo = new ProductCateVO();
			vo.setProductCount(Integer.parseInt(obj[0] + ""));
			String seq = FormatUtil.formatBinary(""+ obj[2], 2);
			String level = FormatUtil.formatBinary(""+ obj[3],2);
			vo.setSid( Integer.valueOf(obj[1] + ""));
//			vo.setSerialNumber("" + obj[1]);
			String sid = FormatUtil.formatBinary(""+obj[1],4);
			map.put(level + seq +sid,vo );
		}
		return getProClassDictVO(map);
	}

	/**
	 * 由叶子节点构造目录树
	 * @param map
	 * @return
	 */
	@Transactional(readOnly = true)
	private ProductCateVO getProClassDictVO(Map<String, ProductCateVO> map) {
		Iterator<ProductCateVO> iterator =  map.values().iterator();
		TreeMap<String, ProductCateVO> newMap = new TreeMap<String, ProductCateVO>();
		while(iterator.hasNext()){
			ProductCateVO catVO = iterator.next();
			ProductClass proClass = this.productClassDao.get(Integer.parseInt("" + catVO.getSid()));
			DozerMapper.getInstance().map(proClass, catVO);
			String cateseq = FormatUtil.formatBinary(catVO.getNodeSeq(),2);
			String cateLevel = FormatUtil.formatBinary(catVO.getNodeLevel(),2);
			String catSid = FormatUtil.formatBinary(catVO.getSid()+"",4);
			String catekey = cateLevel + cateseq + catSid;
			ProductClass father = proClass.getFatherProductClass();
			ProductCateVO fatherVo = new ProductCateVO();
			if(null!= father){
				DozerMapper.getInstance().map(father,fatherVo);
				String fatherseq = FormatUtil.formatBinary(fatherVo.getNodeSeq(), 2);
                String fatherlevel = FormatUtil.formatBinary(fatherVo.getNodeLevel(), 2);
                String fathersid = FormatUtil.formatBinary(""+fatherVo.getSid(), 4);
                String fatherkey = fatherlevel + fatherseq + fathersid;
                if(newMap.containsKey(fatherkey)){
                	fatherVo = newMap.get(fatherkey);
                }
                Map<String, ProductCateVO> list = fatherVo.getChildCatesMap();
                if(list == null){
                	list = new HashMap<String, ProductCateVO>();
                }
                if(list.containsKey(catekey)){
                	ProductCateVO productCateVO = list.get(catekey);
                	productCateVO.getChildCatesMap().putAll(catVO.getChildCatesMap());
                	productCateVO.setProductCount(productCateVO.getProductCount() + catVO.getProductCount());
                }else{
                	list.put(catekey, catVO);
                }
                fatherVo.setProductCount(fatherVo.getProductCount() + catVO.getProductCount());
                fatherVo.setChildCatesMap(list);
                newMap.put(fatherkey, fatherVo);
			}else{
				if(newMap.containsKey(catekey)){
					fatherVo = newMap.get(catekey);
					 String fatherseq = FormatUtil.formatBinary(fatherVo.getNodeSeq(), 2);
	                    String fatherlevel = FormatUtil.formatBinary(fatherVo.getNodeLevel(), 2);
	                    String fathersid = FormatUtil.formatBinary(fatherVo.getSid() + "", 4);
	                    String fatherkey = fatherlevel + fatherseq + fathersid;
					    Map<String,ProductCateVO> list = fatherVo.getChildCatesMap();
					    if(list.containsKey(catekey)){
					    	 ProductCateVO productCateVO = list.get(catekey);
		                        productCateVO.getChildCatesMap().putAll(catVO.getChildCatesMap());
		                        productCateVO.setProductCount(productCateVO.getProductCount() + catVO.getProductCount());
					    }else{
					    	newMap.put(catekey, catVO);
					    }
					
					
				}
			}
			
		}
		if(newMap.size() == 1 && newMap.containsKey("00000001")){
			return newMap.get("00000001");
		}else{
			return getProClassDictVO(newMap);
		}
	}

	private Criteria getQueryCriteria() {
		//基本约束下的Criteria
		Criteria criteria = this.productDao.createCriteria()
				.add(Restrictions.eq("proActiveBit",1));
		
		return criteria;
	}

}

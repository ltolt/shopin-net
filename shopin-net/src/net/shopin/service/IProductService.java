package net.shopin.service;

import java.util.List;
import java.util.Map;

import net.shopin.entity.ProductList;
import net.shopin.view.ProductCateVO;
import net.shopin.view.ProductVO;
/**
 * 网站用到的商品查询接口
 * @author Lucas kong
 *
 */
public interface IProductService {
	/**
	 * 当前查询条件下的分类 需要统计每个叶子类别
	 * 下的商品数量
	 * 
	 * @return
	 */
	ProductCateVO findCurrentCateList();
	
	/**
	 * 根据商品id取得商品信息 
	 * @param productId
	 * @return
	 */
	ProductVO getProduct(String productId);
	
	/**
	 * 根据商品明细sid得到商品信息
	 * @param proDetailSid
	 * @return
	 */
	ProductVO getProductByDetailSid(String proDetailSid);
	
	
	void save(ProductList record);

	void delete(ProductList record);
	
	ProductList get(Integer sid);
	
	void deleteBySid(Integer sid);
	
	ProductList load(Integer sid);
	
	List  getAll();
	
	List findByCriteria(String propertyName,Object value);
	
	ProductList findByUnique(String propertyName,Object value);
	
	List queryForList(String hql,Object... values);

	List queryForList(String hql,Map map);
	
	
}

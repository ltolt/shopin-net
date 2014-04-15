/**
 * 说明：
 *     收藏功能接口实现
 * @Probject Name: business
 * @Path: net.shopin.service.FavorServiceImpl.java
 * @Create By kongm
 * @Create In 2013-8-5 下午4:22:07
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.orm.Page;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import com.shopin.modules.utils.DozerMapper;
import com.shopin.modules.web.view.PageVO;

import net.shopin.api.IFavorService;
import net.shopin.entity.FavoriteProduct;
import net.shopin.entity.Favorites;
import net.shopin.view.FavoriteProductVO;
import net.shopin.view.FavoritesVO;
import net.shopin.view.SsdProductVO;

/**
 * @Class Name FavorServiceImpl
 * @Author kongm
 * @Create In 2013-8-5
 */
@Component("favorService")
@Scope("prototype")
@Transactional
public class FavorServiceImpl implements IFavorService {

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.shopin.api.IFavorService#addProduct(java.lang.String,
	 * java.lang.String)
	 */
	private SimpleHibernateDao<Favorites, Integer> favoritesDao;
	private SimpleHibernateDao<FavoriteProduct, Integer> favoriteProductDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.favoritesDao = new SimpleHibernateDao<Favorites, Integer>(
				sessionFactory, Favorites.class);
		this.favoriteProductDao = new SimpleHibernateDao<FavoriteProduct, Integer>(
				sessionFactory, FavoriteProduct.class);
	}

	@Transactional
	public void addProduct(String memberId, SsdProductVO productVO) {

		FavoritesVO favoritesVO = getFavorites(memberId);
		Favorites favorites = new Favorites();
		FavoriteProduct favoriteProduct = new FavoriteProduct();
		if (favoritesVO != null && favoritesVO.getSid() != null) {
			favorites.setSid(favoritesVO.getSid());
			favorites.setFavoritesName(favoritesVO.getFavoritesName());
			
			if (productVO != null && productVO.getSid() != null
					&& !productVO.getSid().equals("")) {
				favoriteProduct.setFavorites(favorites);
				favoriteProduct.setSsdProductSid(Long.parseLong(productVO
						.getSid()));
				favoriteProduct.setOriginalPrice(Double.valueOf(productVO
						.getOriginalPrice()));
				favoriteProduct.setProductName(productVO.getProductName());
				favoriteProduct.setPicUrl(productVO.getProPictureUrl());
				favoriteProduct.setPromotionPrice(Double.valueOf(productVO
						.getPromotionPrice()));
			}

		} else {
			favorites.setFavoritesName("默认");
			favorites.setMemberSid(Integer.parseInt(memberId));
			favoritesDao.save(favorites);
			FavoritesVO favoritesVO2 = getFavorites(memberId);
			favorites.setFavoritesName(favoritesVO2.getFavoritesName());
			favorites.setSid(favoritesVO2.getSid());
			if (productVO != null && productVO.getSid() != null
					&& !productVO.getSid().equals("")) {
				favoriteProduct.setFavorites(favorites);
				favoriteProduct.setSsdProductSid(Long.parseLong(productVO
						.getSid()));
				favoriteProduct.setOriginalPrice(Double.valueOf(productVO
						.getOriginalPrice()));
				favoriteProduct.setProductName(productVO.getProductName());
				favoriteProduct.setPicUrl(productVO.getProPictureUrl());
				favoriteProduct.setPromotionPrice(Double.valueOf(productVO
						.getPromotionPrice()));
			}
		}
		favoriteProductDao.save(favoriteProduct);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.shopin.api.IFavorService#getFavorites(java.lang.String)
	 */
	@Transactional
	public FavoritesVO getFavorites(String memberId) {
		Favorites favorites = favoritesDao.findByUnique("memberSid",
				Integer.parseInt(memberId));
		FavoritesVO favoritesVO = new FavoritesVO();
		if (favorites != null && favorites.getSid() != null) {
			favoritesVO.setFavoritesName(favorites.getFavoritesName());
			favoritesVO.setSid(favorites.getSid());
		}

		return favoritesVO;

	}

	/**
	 * 根据用户SID获取用户收藏的商品
	 * 
	 * @Methods Name getFavoriteProducts
	 * @Create In 2013-9-5 By huyy
	 * @param pageNo
	 * @param memberSid
	 * @return pageVO
	 */
	@Transactional(readOnly = true)
	public PageVO<FavoriteProductVO> getFavoriteProducts(int pageNo,
			String memberSid) {
		List<FavoriteProductVO> favoriteProductVOList = new ArrayList<FavoriteProductVO>();
		// 查询语句
		Criteria criteria = this.favoriteProductDao
				.createCriteria(new Criterion[0])
				.createAlias("favorites", "favorite")
				.add(Restrictions.eq("favorite.memberSid",
						Integer.valueOf(Integer.parseInt(memberSid))));
		// 每页显示的数量
		PageVO<FavoriteProductVO> pageVO = new PageVO<FavoriteProductVO>(10,
				true);
		pageVO.setPageNo(pageNo);// 第几页
		Page<FavoriteProduct> page = new Page<FavoriteProduct>();
		DozerMapper.getInstance().map(pageVO, page);
		page = this.favoriteProductDao.find(page, criteria);// 执行查询操作
		List<FavoriteProduct> favoriteProductList = page.getResult();
		if ((favoriteProductList == null) || (favoriteProductList.isEmpty())) {
			return pageVO;
		}
		DozerMapper.getInstance().map(page, pageVO);
		for (FavoriteProduct favorites : favoriteProductList) {
			FavoriteProductVO vo = new FavoriteProductVO();
			vo.setFavorotesSid(favorites.getFavorotesSid());
			vo.setOriginalPrice(favorites.getOriginalPrice());
			vo.setPicUrl(favorites.getPicUrl());
			vo.setProductName(favorites.getProductName());
			vo.setPromotionPrice(favorites.getPromotionPrice());
			vo.setSid(favorites.getSid());
			vo.setSsdProductSid(favorites.getSsdProductSid());
			favoriteProductVOList.add(vo);
		}
		pageVO.setList(favoriteProductVOList);
		return pageVO;
	}

	/**
	 * 删除收藏商品
	 * 
	 * @Methods Name delFavoriteProducts
	 * @Create In 2013-10-10 By huyy
	 * @param favoriteProductVO
	 *            void
	 */
	public boolean delFavoriteProducts(Long sid) {
		boolean flag = false;
		FavoriteProduct product = new FavoriteProduct();
		if (sid != 0) {
			product.setSid(sid);
		}
		try {
			favoriteProductDao.delete(product);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}

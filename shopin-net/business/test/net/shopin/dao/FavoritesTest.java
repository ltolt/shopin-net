/**
 * @Probject Name: business
 * @Path: net.shopin.dao.FavoritesTest.java
 * @Create By jianghzenxue
 * @Create In 2013-7-9 下午4:27:00
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.Brand;
import net.shopin.entity.BrandDisplay;
import net.shopin.entity.Favorites;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

public class FavoritesTest extends BaseTestContext{
    private SimpleHibernateDao<Favorites, Integer> favoritesDao;
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
	favoritesDao = new SimpleHibernateDao<Favorites, Integer>(sessionFactory, Favorites.class);
    }
    
//    @Test
//    @Transactional
//    @Rollback(false)
    public void testInsert(){
	Favorites favorites = new Favorites();
	favorites.setMemberSid(10);
	favorites.setFavoritesName("篮球");
	this.favoritesDao.save(favorites);
    }
    
//    @Test
//    @Transactional
//    @Rollback(false)
    public void testUpdate(){
	Favorites favorites = this.favoritesDao.findByUnique("sid", 2);
	favorites.setFavoritesName("足球");
	this.favoritesDao.save(favorites);
    }
    
//    @Test
//    @Transactional
//    @Rollback(false)
//    public void testSelect(){
//	List<Favorites> list = this.favoritesDao.findBy("memberSid", 10);
//	for (Favorites favorites : list) {
//	    System.out.println(favorites.getFavoritesName());
//	}
//    }
    @Test
    @Transactional
    @Rollback(false)
    public void testdel(){
	Favorites favorites = this.favoritesDao.findByUnique("sid", 2l);
	this.favoritesDao.delete(favorites);
    }
}

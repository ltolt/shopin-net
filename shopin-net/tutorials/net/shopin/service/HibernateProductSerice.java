package net.shopin.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.shopin.entity.Brand;
import net.shopin.entity.ProductList;

import oracle.net.aso.l;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * @author Lucas kong
 * 
 */
@Service("productHibernateService")
public class HibernateProductSerice {

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	@Transactional
	public List listBySqlQuery() {
		Session session = sessionFactory.getCurrentSession();
		//
		// These will return a List of Object arrays (Object[]) with scalar
		// values for each column in the CATS table. Hibernate will use
		// ResultSetMetadata to deduce the actual order and types of the
		// returned scalar values.
		// List<ProductList> list = session.createSQLQuery(
		// "select * from PRODUCT_LIST").list();
		// To avoid the overhead of using ResultSetMetadata, or simply to be
		// more explicit in what is returned, one can use addScalar():
		// List list = session.createSQLQuery("SELECT * FROM PRODUCT_LIST")
		// .addScalar("SID",Hibernate.INTEGER)
		// .addScalar("PRO_SKU", Hibernate.STRING)
		// .list();
		// The above queries were all about returning scalar values, basically
		// returning the "raw" values from the resultset. The following shows
		// how to get entity objects from a native sql query via addEntity().

		List list = session.createSQLQuery("SELECT * FROM PRODUCT_LIST").addEntity(ProductList.class).list();
		return list;
	}

	// @Transactional
	public List listByDetachedQuery() {
		DetachedCriteria query = DetachedCriteria.forClass(ProductList.class)
				.add(Property.forName("proSku").eq("ee"));
		Session session = sessionFactory.getCurrentSession();
		Transaction txn = session.beginTransaction();
		List list = query.getExecutableCriteria(session).setMaxResults(100)
				.list();
		txn.commit();
		session.close();
		return list;
	}

	// The class org.hibernate.criterion.Projections is a factory for Projection
	// instances. You can apply a projection to a query by calling
	// setProjection().
	@Transactional
	public List listByProjection() {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ProductList.class);
		// List list = crit.setProjection(Projections.rowCount())
		// .add(Projections.avg(""))
		// .add(Restrictions.eq("proType", 1))
		// .list();
		// List list = crit.setProjection(Projections.projectionList()
		// .add(Projections.rowCount(),"ct")
		// //.add(Projections.avg("proSelling"))
		// .add(Projections.groupProperty("brandSid").as("bd")))
		// .addOrder(Order.asc("bd"))
		// .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
		// .list();
		// An alias can be assigned to a projection so that the projected value
		// can be referred to in restrictions or orderings. Here are two
		// different ways to do this:
		// List list =
		// crit.setProjection(Projections.alias(Projections.rowCount(),
		// "count"))
		// .addOrder(Order.asc("sid"))
		// .list();
		List list = crit
				.setProjection(
						Projections
								.projectionList()
								.add(Projections.rowCount(), "count")
								.add(Projections.max("proType"))
								.add(Projections.groupProperty("brandSid"),
										"bd"))
				.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

		return list;

	}

	// The class org.hibernate.criterion.Example allows you to construct a query
	// criterion from a given instance.
	@Transactional
	public List listByExample() {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ProductList.class);
		ProductList p = new ProductList();
		// p.setProActiveBit(1);
		// List result = crit.add(Example.create(p)).list();
		Example example = Example.create(p).excludeZeroes()// exclude zero
															// valued properties
				.excludeProperty("sid") // exclude the property named sid
				.ignoreCase() // perform case insensitive string comparsoons
				.enableLike(); // use like for String comparisons
		List result = crit.add(example).list();

		return result;

	}

	/**
	 * 17.2. Narrowing the result set
	 * 
	 * An individual query criterion is an instance of the interface
	 * org.hibernate.criterion.Criterion. The class
	 * org.hibernate.criterion.Restrictions defines factory methods for
	 * obtaining certain built-in Criterion types.
	 * 
	 * @return
	 */
	@Transactional
	public List listByCriterion() {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ProductList.class);

		List list;
		// List list = crit.add(Restrictions.like("proSku", "%s%"))
		// .add(Restrictions.between("proActiveBit", 0, 2)).list();
		// Restrictions can be grouped logically
		// list = crit.add(Restrictions.or(Restrictions.eq("proActiveBit", 1),
		// Restrictions.isNull("proSelling"))).list();
		// list = crit
		// .add(Restrictions.disjunction().add(Restrictions.eq("proType", 1))
		// .add(Restrictions.eq("proType", 3)).add(Restrictions.eq("proType",
		// 2))).list();
		// You can also obtain a criterion from a Property instance. You can
		// create a Property by calling Property.forName():
		// Property protype = Property.forName("proType");
		// list = crit.add(Restrictions.disjunction()
		// .add(protype.isNull())
		// .add(protype.eq(1))
		// .add(protype.eq(2)))
		// .addOrder(Order.asc("proType"))
		// .addOrder(Order.desc("sid"))
		// .list();
		// You can order the results using org.hibernate.criterion.Order.

		// The second createCriteria() returns a new instance of Criteria that
		// refers to the elements of the brand entity.
		// list = crit.createCriteria("brand")
		// .add(Restrictions.eq("brandName", "nike")).list();

		// (createAlias() does not create a new instance of Criteria.)
		// list = crit.createAlias("brand","b")
		// .add(Restrictions.eqProperty("b.sid","brandSid" ))
		// .list();
		//
		// list = crit.createCriteria("brand","b")
		// .add(Restrictions.eq("brandName", "nike"))
		// .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
		// .list();
		// Iterator iter = list.iterator();
		// while(iter.hasNext()){
		// Map map = (Map) iter.next();
		// ProductList product = (ProductList) map.get(Criteria.ROOT_ALIAS);
		// Brand brand = (Brand) map.get("b");
		// System.out.println(product);
		// System.out.println(brand);
		// }
		// Additionally you may manipulate the result set using a left outer
		// join:
		//
		// //
		// list =
		// crit.createAlias("brand","b",Criteria.LEFT_JOIN,Restrictions.eq("b.sid",
		// 1))
		// .addOrder(Order.asc("b.sid"))
		// .list();
		// //You can specify association fetching semantics at runtime using
		// setFetchMode().
		list = crit.add(Restrictions.eq("proType", 1))
		// .setFetchMode("brand", FetchMode.EAGER)
				.list();
		return list;

	}

	/**
	 * The interface org.hibernate.Criteria represents a query against a
	 * particular persistent class. The Session is a factory for Criteria
	 * instances.
	 * 
	 * @return
	 */
	@Transactional
	public List list() {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ProductList.class);
		crit.setMaxResults(50);
		List products = crit.list();
		return products;
	}

}

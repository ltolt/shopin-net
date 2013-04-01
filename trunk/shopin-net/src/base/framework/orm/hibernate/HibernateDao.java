package base.framework.orm.hibernate;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import base.framework.util.ReflectionUtils;
/**
 * 
 * @author Lucas kong
 *
 * @param <T>
 * @param <PK>
 */
public class HibernateDao<T,PK extends Serializable> {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected SessionFactory sessionFactory;
	
	protected Class<T> entityClass;

	/**
	 * 用于Dao层子类使用的构造函数
	 * 通过子类的泛型定义取得对象类型的class
	 * eg.
	 * public class UserDao extends SimpleHibernateDao<User, Long>
	 */
	public HibernateDao() {
		this.entityClass = ReflectionUtils.getSuperClassGenricType(getClass());
	}

	/**
	 * 用于省略dao层 在service层直接使用通用SimpleHibernateDao的构造函数
	 * 在构造函数中定义对象类型的class
	 * eg.
	 * SimpleHibernateDao<User, Long> userDao = new SimpleHibernateDao<User, Long>(sessionFactory, User.class);
	 * @param sessionFactory
	 * @param entityClass
	 */
	public HibernateDao(final SessionFactory sessionFactory,final Class<T> entityClass) {
		this.sessionFactory = sessionFactory;
		this.entityClass = entityClass;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * 采用@Autowired按类型注入SessionFactory 当有多个SessionFactory的时候Override本函数
	 * @param sessionFactory
	 */
	@Autowired
	public void setSessionFactory(final SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		Assert.notNull(sessionFactory.getCurrentSession());
//		sessionFactory.getCurrentSession();
		return sessionFactory.getCurrentSession();
	}
	/**
	 * 保存新增或修改的entity
	 * @param entity
	 */
	public void save(final T entity){
		Assert.notNull(entity,"entity不能为空");
		getSession().saveOrUpdate(entity);
		logger.info("save entity:{}",entity);
	}
	/**
	 *  删除对象 对象必须是session中的对象或含id属性的transient对象
	 * @param entity
	 */
	public void delete(final T entity){
		Assert.notNull(entity,"entity不能为空");
		getSession().delete(entity);
		logger.debug("delete entity {}",entity);
	}
	
	/**
	 * 按id删除对象
	 * @param id
	 */
	public void delete(final PK id){
		Assert.notNull(id,"id不能为空");
		delete(get(id));
		logger.debug("delete entity {},id is {}",entityClass.getSimpleName(),id);
	}
	
	/**
	 * 按id获取对象
	 * @param id
	 * @return
	 */
	public T get(final PK id){
		Assert.notNull(id,"id不能为空");
		return (T) getSession().get(entityClass, id);
	}
	
	/**
	 * 按id获取对象
	 * @param id
	 * @return
	 */
	public T load(final PK id){
		Assert.notNull(id,"id不能为空");
		return (T) getSession().load(entityClass, id);
	}
	
	/**
	 * 获取全部对象
	 * @return
	 */
	public List<T> getAll(){
		return find();
	}
	
	/**
	 * 暗属性查找对象列表 匹配方式为相等
	 * @param propertyName
	 * @param value
	 * @return
	 */
	public List<T> findBy(final String propertyName,final Object value){
		Assert.hasText(propertyName,"propertyName不能为空");
		Criterion criterion = Restrictions.eq(propertyName, value);
		return find(criterion);
	}
	/**
	 * 按属性查找唯一对象 匹配方式为相等
	 * @param propertyName
	 * @param value
	 * @return
	 */
	public T findByUnique(final String propertyName,final Object value){
		Assert.hasText(propertyName,"propertyName不能为空");
		Criterion criterion = Restrictions.eq(propertyName, value);
		return (T) createCriteria(criterion).uniqueResult();
	}
	
	/**
	 * 按criteria查询对象列表
	 * @param criterions 数量可变的Criterion
	 * @return
	 */
	public List<T> find(final Criterion... criterions){
		return createCriteria(criterions).list();
	}

	/**
	 * 根据Criterion条件创建Criteria
	 * 本类封装的find()函数全部默认返回对象类型为T当不为T时使用本函数
	 * @param criterions 数量可变的Criterion
	 * @return
	 */
	public Criteria createCriteria(final Criterion... criterions) {
		Criteria criteria = getSession().createCriteria(entityClass);
		for(Criterion c : criterions){
			criteria.add(c);
		}
		return criteria;
	}
	
	/**
	 * 按hql查询对象列表
	 * @param hql 
	 * @param values 数量可变的参数 按顺序绑定
	 * @return
	 */
	public <X> List<X> find(final String hql,final Object... values){
		return createQuery(hql, values).list();
	}
	
	
	
	
	/**
	 * 按HQL查询对象列表
	 * @param hql 
	 * @param values 数量可变的参数 按顺序绑定
	 * @return
	 */
	public <X> List<X> find(final String hql,final Map<String, Object> values){
		return createQuery(hql,values).list();
	}
	/**
	 * 根据查询HQL与参数列表创建Query对象.
	 * 
	 * @param values 命名参数,按名称绑定.eg:map.put("sid", 1);
	 */
	public Query createQuery(final String queryString,final Map<String, Object> values){
		Assert.hasText(queryString,"queryString不能为空");
		Query query = getSession().createQuery(queryString);
		if(values != null){
			query.setProperties(values);
		}
		return query;
	}
	
	/**
	 * 按HQL查询唯一对象.
	 *
	 * @param values 数量可变的参数,按顺序绑定.
	 */
	public <X> X findUnique(final String hql, final Object... values) {
		return (X) createQuery(hql, values).uniqueResult();
	}
	/**
	 * 按HQL查询唯一对象.
	 *
	 * @param values 命名参数,按名称绑定.
	 */
	public <X> X findUnique(final String hql,final Map<String,Object> values){
		return (X) createQuery(hql, values).uniqueResult();
	}
	
	/**
	 * 执行hql进行批量修改、删除操作
	 * @param hql
	 * @param values
	 * @return
	 */
	public int batchExecute(final String hql,final Object... values ){
		return createQuery(hql, values).executeUpdate();
	}
	/**
	 * 执行HQL进行批量修改/删除操作.
	 * @param hql
	 * @param values
	 * @return更新记录数
	 */
	public int batchExecute(final String hql,final Map<String, Object> values){
		return createQuery(hql, values).executeUpdate();
	}
	/**
	 * 根据查询HQL与参数列表创建Query对象.
	 *
	 * 本类封装的find()函数全部默认返回对象类型为T,当不为T时使用本函数.
	 *
	 * @param values 数量可变的参数,按顺序绑定.
	 */
	public Query createQuery(final String queryString, final Object... values) {
		Assert.hasText(queryString, "queryString不能为空");
		Query query = getSession().createQuery(queryString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query;
	}
	/**
	 * 初始化对象
	 * 使用load()方法得到的仅是对象proxy后 在传到view层前需要进行初始化
	 * initObject(User) 初始化user的直接属性 但不会初始化延迟加载的关联集合和属性
	 * initObject(user.getRoles())，初始化User的直接属性和关联集合.
	 * initObject(user.getDescription())，初始化User的直接属性和延迟加载的Description属性.
	 * @param object
	 */
	public void initObject(Object object){
		Hibernate.initialize(object);
	}
	

	/**
	 * 批量初始化对象.
	 * @see #initObject(Object)
	 */
	public void initObjects(List list){
		for(Object obj : list){
			Hibernate.initialize(obj);
		}
	}
	
	/**
	 * 为query添加distinct transformer
	 * @param query
	 * @return
	 */
	public Query distinct(Query query){
		query.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		return query;
	}

	/**
	 * 为Criteria添加distinct transformer.
	 */
	public Criteria distinct(Criteria criteria) {
		criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		return criteria;
	}
    
	
	
	
	

	
	
	
	
	
}

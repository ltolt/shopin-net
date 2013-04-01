package net.shopin.service.impl;

import java.util.Iterator;
import java.util.List;

import org.apache.tomcat.jni.Proc;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import base.framework.orm.hibernate.SimpleHibernateDao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.entity.ProductClass;
import net.shopin.service.IProductClassService;
import net.shopin.service.IProductService;

@Service("productClassService")
@Transactional
public class ProductClassServiceImpl implements IProductClassService {

	protected final static Logger logger = LoggerFactory
			.getLogger(ProductClassServiceImpl.class);

	private SimpleHibernateDao<ProductClass, Integer> productClassDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.productClassDao = new SimpleHibernateDao<ProductClass, Integer>(
				sessionFactory, ProductClass.class);
	}

	@Transactional(readOnly = true)
	public List getAllProductClasses() {

		return this.productClassDao.getAll();
	}

	@Transactional(readOnly = true)
	public String getAllProductClassesJson() {
		@SuppressWarnings("rawtypes")
		List list = this.getAllProductClasses();
		JSONArray json = new JSONArray();
		JSONObject object;
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				ProductClass proClass = (ProductClass) list.get(i);
				object = new JSONObject();
				object.put("id", proClass.getSid());
				object.put("text", proClass.getNodeName());
				if (proClass.getIsLeaf()!=null && proClass.getIsLeaf() == 1) {
					object.put("leaf", true);
				} else {
					object.put("leaf", false);
				}
				json.add(object);
			}
		}
		return json.toString();
	}

	@Transactional
	public String getChildProductClassJson(Integer fatherNodeSid) {
		List list = this.productClassDao.createCriteria().add(Restrictions.eq("fatherNodeSid", fatherNodeSid)).list();
		JSONArray json = new JSONArray();
		JSONObject object = null;
		if(list!=null&&list.size()>0){
			for(Iterator<ProductClass> iter = list.iterator();iter.hasNext(); ){
				ProductClass proClass= iter.next();
				object = new JSONObject();
				object.put("id",proClass.getSid());
				object.put("text", proClass.getNodeName());
				if(proClass.getIsLeaf()!=null &&1== proClass.getIsLeaf()){
					object.put("leaf", true);
				}else{
					object.put("leaf", false);
				}
				//ExtJs中的节点提示信息
				object.put("qtip", (proClass.getMemo()==null||"".equals(proClass.getMemo())?"":proClass.getMemo()));
				//在树形节点中直接设置超链接
				object.put("href", "http://localhost:8080/shopin/" + proClass.getSid() + ".html");
				json.add(object);
			}
			
		}
		
		return json.toString();
	}
}

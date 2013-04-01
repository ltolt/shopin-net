package net.shopin.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import base.framework.orm.hibernate.SimpleHibernateDao;
import net.shopin.entity.ProColorDict;
import net.shopin.service.IProColorService;

@Service("proColorService")
public class ProColorServiceImpl implements IProColorService
{
	
	private SimpleHibernateDao<ProColorDict, Integer> proColorDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){
		proColorDao = new SimpleHibernateDao<ProColorDict, Integer>(sessionFactory,ProColorDict.class);
	}

	@Transactional
	public void save(ProColorDict record) {
		this.proColorDao.save(record);
	}

}

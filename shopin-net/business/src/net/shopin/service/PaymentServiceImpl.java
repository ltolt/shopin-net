/**
 * @Probject Name: business
 * @Path: net.shopin.service.PaymentServiceImpl.java
 * @Create By kongm
 * @Create In 2013-9-2 上午11:21:51
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.interceptor.MethodCache;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import com.shopin.modules.utils.DozerMapper;

import net.shopin.api.IPaymentService;
import net.shopin.entity.PaymentType;
import net.shopin.view.PaymentTypeVO;

/**
 * @Class Name PaymentServiceImpl
 * @Author kongm
 * @Create In 2013-9-2
 */
@Transactional(readOnly = true)
@Scope("prototype")
@Component("paymentService")
public class PaymentServiceImpl implements IPaymentService {
	private SimpleHibernateDao<PaymentType, Integer> paymentTypeDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		paymentTypeDao = new SimpleHibernateDao<PaymentType, Integer>(
				sessionFactory, PaymentType.class);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.shopin.api.IPaymentService#getAllPaymentTypes()
	 */
	@Transactional
	public List<PaymentTypeVO> getAllPaymentTypes() {
		List<PaymentTypeVO> resultList = new ArrayList<PaymentTypeVO>();
		List<PaymentType> list = this.paymentTypeDao.createCriteria()
				.add(Restrictions.ge("show", 1))
				.addOrder(Order.asc("seq")).list();
		for(PaymentType record : list){
			PaymentTypeVO paymentTypeVO = new PaymentTypeVO();
			DozerMapper.getInstance().map(record, paymentTypeVO);
			resultList.add(paymentTypeVO);
		}
		return resultList;
	}

}

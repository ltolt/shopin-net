package com.shopin.modules.orm.hibernate;

import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.event.SaveOrUpdateEvent;
import org.hibernate.event.SaveOrUpdateEventListener;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-7-30
 * Time: 11:30:09
 */
public class AuditListener implements SaveOrUpdateEventListener {

	public void onSaveOrUpdate(SaveOrUpdateEvent event) throws HibernateException {
		Object object = event.getObject();
		if (object instanceof AuditableEntity) {
			AuditableEntity entity = (AuditableEntity) object;
            // TODO 获取操作用户名
            String userName = "";
			if (entity.getSid() == null) {
				entity.setCreateTime(new Date());
				entity.setCreateBy(userName);
			} else {
				entity.setLastModifyTime(new Date());
				entity.setLastModifyBy(userName);
			}
		}
	}
}
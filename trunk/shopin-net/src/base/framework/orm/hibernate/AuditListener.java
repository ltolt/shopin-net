package base.framework.orm.hibernate;

import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.event.SaveOrUpdateEvent;
import org.hibernate.event.SaveOrUpdateEventListener;

public class AuditListener implements SaveOrUpdateEventListener {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void onSaveOrUpdate(SaveOrUpdateEvent event)
			throws HibernateException {
		Object object = event.getObject();
		if (object instanceof AuditableEntity) {
			AuditableEntity entity = (AuditableEntity) object;
			// TODO 獲取操作用戶名
			String username = "";
			if (entity.getSid() == null) {
				entity.setCreateTime(new Date());
				entity.setCreateBy(username);
			} else {
				entity.setLastModifyTime(new Date());
				entity.setLastModifuBy(username);
			}
		}

	}

}

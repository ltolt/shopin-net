package net.shopin.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

import net.shopin.api.ISysParameterService;
import net.shopin.entity.SysParameterType;
import net.shopin.entity.SysParameterValue;

/**
 * 根据参数类型获取参数键值对业务实现类
 * @Class Name SysParameterServiceImpl
 * @Author huyy
 * @Create In 2013-7-12
 */
@Transactional(readOnly=true)
@Component("sysParameterService")
@Scope("prototype")
public class SysParameterServiceImpl implements ISysParameterService
{
  private SimpleHibernateDao<SysParameterType, Long> sysParameterDao;

  @Autowired
  public void setSessionFactory(SessionFactory sessionFactory)
  {
    this.sysParameterDao = new SimpleHibernateDao<SysParameterType, Long>(sessionFactory, SysParameterType.class);
  }

  /**
   * 根据参数类型获取参数键值对
   *
   * @param key  
   * @return
   */
  @Transactional(readOnly=true)
  public Map<String, String> getSysParameter(String key) {
    Map map = new HashMap();//创建储存键值的MAP集合
    //根据key查找SysParameterType对象
    SysParameterType sysParameter = (SysParameterType)this.sysParameterDao.findByUnique("code", key);
    //获取SysParameterType对象的sysParameterValues集合
    Iterator iterator = sysParameter.getSysParameterValues().iterator();
    //循环遍历获取sysParameterValue值，并将sysParameterValue的name,value存入MAP中返回
    while (iterator.hasNext()) {
      SysParameterValue sysParameterValue = (SysParameterValue)iterator.next();
      map.put(sysParameterValue.getName(), sysParameterValue.getValue());
    }
    return map;
  }
}
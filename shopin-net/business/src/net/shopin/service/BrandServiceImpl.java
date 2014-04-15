package net.shopin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.interceptor.MethodCache;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import net.shopin.api.IBrandService;
import net.shopin.entity.PageLayoutBrand;
import net.shopin.util.Constants;
import net.shopin.util.HttpUtil;
import net.shopin.util.JsonUtil;
import net.shopin.util.StringUtils;
import net.shopin.view.BrandVO;
import net.shopin.view.SsdBrandDisplay;
import net.shopin.view.SsdProductVO;

/**
 * 根据栏目ID获取栏目品牌信息业务实现类
 * @Class Name BrandServiceImpl
 * @Author huyy
 * @Create In 2013-7-12
 */
@Component("brandService")
@Scope("prototype")
@Transactional(readOnly = true)
public class BrandServiceImpl implements IBrandService {
	
	protected final Logger log = LoggerFactory.getLogger(getClass());
	private SimpleHibernateDao<PageLayoutBrand, Integer> pageLayoutBrandDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.pageLayoutBrandDao = new SimpleHibernateDao<PageLayoutBrand, Integer>(
				sessionFactory, PageLayoutBrand.class);
	}

	/**
     * 根据栏目ID获取栏目品牌信息(从ssd获取)
     *
     * @param sid  栏目ID
     * @return
     */
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true, propagation = Propagation.REQUIRES_NEW)
	public List<BrandVO> getPageLayoutBrands(Integer sid) {
		String resultJson = "";
		List<String> brandSidList = this.pageLayoutBrandDao.createCriteria()
				.add(Restrictions.eq("pageLayoutSid", sid))
				.setProjection(Projections.property("brandSid")).list();
		List<BrandVO> bradListVo = null;
		if(!brandSidList.isEmpty() && brandSidList != null && brandSidList.size() > 0) {
			String str = StringUtils.listToString(brandSidList);
			Map map = new HashMap();
			map.put("param", str);
			resultJson = HttpUtil.HttpPost(Constants.SSD_SYSTEM,
					"bw/getByBrandSids.html", map);
			bradListVo = JsonUtil.jsonToBrandVO(resultJson);
		}
		
		return bradListVo;
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true, propagation = Propagation.REQUIRES_NEW)
	@MethodCache(expire = 3600)
	public Map<String, List<SsdBrandDisplay>> getAllBrands() {
		
		String json="";
		Map parmMap = new HashMap();
		try{
			json = HttpUtil.HttpPost(Constants.SSD_SYSTEM, "web/displayList.html",
					parmMap);
			
		}catch(Exception e){
			log.error("ssd网络异常");
			return new HashMap();
		}	
		List<SsdBrandDisplay> list =JsonUtil.jsonToMap(json);
		Map<String, List<SsdBrandDisplay>> displaymap = new TreeMap<String, List<SsdBrandDisplay>>();
		for (int i = 0; i < list.size(); i++) {
			SsdBrandDisplay brand = list.get(i);
            if (brand.getBrandNameSpell() != null && !"".equals(brand.getBrandNameSpell())) {
                String key = brand.getBrandNameSpell().toUpperCase().substring(0, 1);
                List<SsdBrandDisplay> brands = null;
                if (displaymap.containsKey(key)) {
                    brands = displaymap.get(key);
                    brands.add(brand);
                    displaymap.put(key, brands);
                } else {
                    brands = new ArrayList<SsdBrandDisplay>();
                    brands.add(brand);
                    displaymap.put(key, brands);
                }
            }
        }
		return displaymap;
		
	}

}

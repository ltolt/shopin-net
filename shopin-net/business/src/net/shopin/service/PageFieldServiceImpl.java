/**
 * @Probject Name: business
 * @Path: net.shopin.servicePageFieldServiceImpl.java
 * @Create By shiying
 * @Create In 2013-7-11 下午2:26:40
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.shopin.api.IPageFieldService;
import net.shopin.api.ISysParameterService;
import net.shopin.api.ITemplateService;
import net.shopin.entity.PageLayout;
import net.shopin.exception.TemplateException;
import net.shopin.view.PageColumnVO;
import net.shopin.view.PageFieldTemplateVO;
import net.shopin.view.PageFieldVO;

import org.hibernate.FetchMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.interceptor.MethodCache;
import com.shopin.modules.interceptor.ObjectCache;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name PageFieldServiceImpl
 * @Author shiying
 * @Create In 2013-7-11
 */

@Component("pageFieldService")
@Scope("prototype")
@Transactional(readOnly = true)
@ObjectCache(expire = 600)
public class PageFieldServiceImpl implements IPageFieldService {

	protected final Logger log = LoggerFactory.getLogger(getClass());
	private SimpleHibernateDao<PageLayout, Integer> pageLayoutDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.pageLayoutDao = new SimpleHibernateDao<PageLayout, Integer>(
				sessionFactory, PageLayout.class);
	}

	@Autowired
	private ITemplateService templateService;

	@Autowired
	private ISysParameterService sysParameterService;

	@Autowired
	private PageFieldUtil pageFieldUtil;

	@MethodCache(expire = 1800)
	@Transactional(readOnly = true)
	public List<PageColumnVO> findColumnsByChannel(String channelId)
			throws TemplateException {

		Map map = this.sysParameterService
				.getSysParameter("TEMPLATE_PARAMETER");
		if ((channelId == null) || ("".equals(channelId.trim()))) {
			throw new IllegalArgumentException("channelId=" + channelId);
		}

		List<PageFieldVO> listField = findFieldsByChannel(channelId);

		List<PageColumnVO> listColumn = new ArrayList<PageColumnVO>();
		if ((listField != null) && (!listField.isEmpty())) {

			for (PageFieldVO fieldVo : listField) {
				if(fieldVo == null) {
					continue;
				}
				try {
					PageFieldTemplateVO templateVo = fieldVo.getTemplateVo();
					if ((templateVo == null) || (templateVo.getTemplate() == null)
							|| ("".equals(templateVo.getTemplate()))) {
						throw new TemplateException("no template in page field.");
					} else {
						Map root = new HashMap();
						root.put("root", fieldVo);
						root.put("images", map.get("images"));
						root.put("ctx", map.get("ctx"));
						String str = this.templateService.getTemplate(templateVo.getName(), root);
						PageColumnVO columnVo = new PageColumnVO();
						columnVo.setSeq(fieldVo.getSeq());
						columnVo.setTemplate(str);
						listColumn.add(columnVo);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}

		return listColumn;
	}

	@Transactional(readOnly = true)
	public List<PageFieldVO> findFieldsByPageLayoutSid(String sid) {

		PageLayout pageRoot = (PageLayout) this.pageLayoutDao.get(Integer
				.valueOf(Integer.parseInt(sid)));

		return buildPageFieldVOList(pageRoot);
	}

	@Transactional(readOnly = true)
	public List<PageFieldVO> findFieldsByChannel(String channelId) {
		if ((channelId == null) || ("".equals(channelId.trim()))) {
			throw new IllegalArgumentException("channelId=" + channelId);
		}
		PageLayout pageRoot = (PageLayout) this.pageLayoutDao
				.createCriteria(new Criterion[0])
				.setFetchMode("pageLayoutTemplate", FetchMode.JOIN)
				.setFetchMode("childPageLayouts", FetchMode.JOIN)
				.createCriteria("shopChannels")
				.add(Restrictions.eq("sid", Integer.valueOf(channelId)))
				.uniqueResult();
		this.log.debug("get rootNode and subNodes.");
		return buildPageFieldVOList(pageRoot);
	}

	private List<PageFieldVO> buildPageFieldVOList(PageLayout pageRoot) {
		if (pageRoot == null) {
			throw new IllegalArgumentException("pageRoot=" + pageRoot);
		}

		Set<PageLayout> fields = pageRoot.getChildPageLayouts();
		if ((fields == null) || (fields.isEmpty())) {
			return new ArrayList<PageFieldVO>();
		}

		List<PageFieldVO> listPageField = new ArrayList<PageFieldVO>();
		for (PageLayout field : fields) {
			if (field.getStartTime() != null) {
				if (new Date().getTime() >= field.getStartTime().getTime()) {
					if (field.getEndTime() != null) {
						if (new Date().getTime() <= field.getEndTime()
								.getTime()) {
							PageFieldVO fieldVo = this.pageFieldUtil
									.buildNodeVOBySid(field,
											pageRoot.getChannelSid());

							listPageField.add(fieldVo);
						}
					} else {
						PageFieldVO fieldVo = this.pageFieldUtil
								.buildNodeVOBySid(field,
										pageRoot.getChannelSid());
						listPageField.add(fieldVo);
					}
				}
			} else if (field.getEndTime() != null) {
				if (new Date().getTime() <= field.getEndTime().getTime()) {
					PageFieldVO fieldVo = this.pageFieldUtil.buildNodeVOBySid(
							field, pageRoot.getChannelSid());
					listPageField.add(fieldVo);
				}
			} else {
				PageFieldVO fieldVo = this.pageFieldUtil.buildNodeVOBySid(
						field, pageRoot.getChannelSid());
				listPageField.add(fieldVo);
			}
		}

		return listPageField;
	}

	/**
	 * 
	 * @Methods Name findColumnsByPromotion
	 * @Create In 2013-8-6 By jingpeng
	 * @param promotionId
	 * @return List<PageColumnVO>
	 */
	@Transactional(readOnly = true)
	public List<PageColumnVO> findColumnsByPromotion(String promotionId)
			throws TemplateException {
		Map map = this.sysParameterService.getSysParameter("TEMPLATE_PARAMETER");
	    if ((promotionId == null) || ("".equals(promotionId.trim()))) {
	      throw new IllegalArgumentException("promotionId=" + promotionId);
	    }
	    
	    List<PageFieldVO> listField = findFieldsByPromotion(promotionId);

	    List<PageColumnVO> listColumn = new ArrayList<PageColumnVO>();
	    if ((listField != null) && (!listField.isEmpty())) {
	      for (PageFieldVO fieldVo : listField) {
	        PageFieldTemplateVO templateVo = fieldVo.getTemplateVo();
	        if ((templateVo == null) || (templateVo.getTemplate() == null) || ("".equals(templateVo.getTemplate())))
	        {
	          throw new TemplateException("no template in page field.");
	        }

	        Map root = new HashMap();
	        root.put("root", fieldVo);
	        root.put("images", map.get("images"));
	        root.put("ctx", map.get("ctx"));
			try {
				String str = this.templateService.getTemplate(templateVo.getName(), root);
				PageColumnVO columnVo = new PageColumnVO();
				columnVo.setSeq(fieldVo.getSeq());
				columnVo.setTemplate(str);
				listColumn.add(columnVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			continue;
	      }
	    }
	    return listColumn;
	}
	/**
	 * 
	 * @Methods Name findFieldsByPromotion
	 * @Create In 2013-8-6 By jingpeng
	 * @param promotionId
	 * @return List<PageFieldVO>
	 */
	@Transactional(readOnly = true)
	public List<PageFieldVO> findFieldsByPromotion(String promotionId) {
		if ((promotionId == null) || ("".equals(promotionId.trim()))) {
			throw new IllegalArgumentException("promotionId=" + promotionId);
		}
		PageLayout pageRoot = (PageLayout) this.pageLayoutDao
				.createCriteria(new Criterion[0])
				.setFetchMode("pageLayoutTemplate", FetchMode.JOIN)
				.setFetchMode("childPageLayouts", FetchMode.JOIN)
				.createCriteria("promotions")
				.add(Restrictions.eq("sid", Integer.valueOf(promotionId)))
				.uniqueResult();
		
		this.log.debug("get rootNode and subNodes.");
		return buildPageFieldVOList(pageRoot);
	}
}

/**
 * @Probject Name: business
 * @Path: net.shopin.service.PageFieldUtil.java
 * @Create By wangdg
 * @Create In 2013-7-11 下午2:43:11
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import net.shopin.api.IBrandService;
import net.shopin.api.IProductService;
import net.shopin.entity.PageLayout;
import net.shopin.entity.PageLayoutContent;
import net.shopin.entity.PageLayoutTemplate;
import net.shopin.view.BrandVO;
import net.shopin.view.PageFieldContentVO;
import net.shopin.view.PageFieldTemplateVO;
import net.shopin.view.PageFieldVO;
import net.shopin.view.WebProductVO;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.interceptor.ObjectCache;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import com.shopin.modules.utils.DozerMapper;

/**
 * @Class Name PageFieldUtil
 * @Author wangdg
 * @Create In 2013-7-11
 */

@Component("pageFieldUtil")
@Scope("prototype")
@Transactional(readOnly = true)
@ObjectCache(expire = 600)
public class PageFieldUtil {

	private SimpleHibernateDao<PageLayout, Integer> pageLayoutDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.pageLayoutDao = new SimpleHibernateDao<PageLayout, Integer>(
				sessionFactory, PageLayout.class);
	}

	@Autowired
	private IBrandService brandService;

	@Autowired
	private IProductService productService;

	/**
	 * 说明： 递归构造频道下栏目的数据列表
	 * 
	 * @Methods Name buildNodeVOBySid
	 * @Create In 2013-7-16 By wangdg
	 * @param field
	 * @param sid
	 * @return PageFieldVO
	 */
	@Transactional(readOnly = true)
	public PageFieldVO buildNodeVOBySid(PageLayout field, Integer sid) {
		if (field == null) {
			throw new IllegalArgumentException("field=" + field);
		}

		PageFieldVO nodeVo = new PageFieldVO();
		DozerMapper.getInstance().map(field, nodeVo);
		Integer minProQuantity = Integer.valueOf(20);

		PageLayoutTemplate template = field.getPageLayoutTemplate();
		if (template != null) {
			PageFieldTemplateVO templateVo = new PageFieldTemplateVO();
			DozerMapper.getInstance().map(field.getPageLayoutTemplate(),
					templateVo);
			nodeVo.setTemplateVo(templateVo);
			minProQuantity = template.getMinProQuantity();
		} else if ((field.getPageLayout() != null)
				&& (field.getPageLayout().getPageLayoutTemplate() != null)) {
			minProQuantity = field.getPageLayout().getPageLayoutTemplate()
					.getMinProQuantity();
		}

		Set<PageLayout> fields = field.getChildPageLayouts();
		if ((fields == null) || (fields.isEmpty())) {
			List<WebProductVO> productVos = this.productService.getPageLayoutProducts(
					field.getSid(), minProQuantity.intValue());
			if(productVos != null && !productVos.isEmpty() && productVos.size()>0) {
				nodeVo.setProductList(productVos);
			}
			
			List<BrandVO> brandVos = this.brandService.getPageLayoutBrands(field
					.getSid());
			if(brandVos !=null && !brandVos.isEmpty() && brandVos.size()>0) {
				nodeVo.setBrandList(brandVos);
			}

			Set<PageLayoutContent> contents = field.getPageLayoutContents();
			if ((contents != null) && (!contents.isEmpty())) {
				List<PageFieldContentVO> listContentVo = new ArrayList<PageFieldContentVO>();
				for (PageLayoutContent content : contents) {
					PageFieldContentVO contentVo = new PageFieldContentVO();
					DozerMapper.getInstance().map(content, contentVo);
					listContentVo.add(contentVo);
				}
				nodeVo.setContentList(listContentVo);
			}
			return nodeVo;
		}

		List<PageFieldVO> listVo = new ArrayList<PageFieldVO>();
		for (PageLayout pageLayout : fields) {
			PageFieldVO vo = buildNodeVO(pageLayout);
			listVo.add(vo);
		}
		if(listVo.size()>0) {
			nodeVo.setSubList(listVo);
		}
		return nodeVo;
	}

	/**
	 * 说明： 根据栏目节点构造整个栏目
	 * 
	 * @Methods Name buildNodeVO
	 * @Create In 2013-7-16 By wangdg
	 * @param field
	 * @return PageFieldVO
	 */
	@Transactional(readOnly = true)
	public PageFieldVO buildNodeVO(PageLayout field) {
		if (field == null) {
			throw new IllegalArgumentException("field=" + field);
		}

		PageFieldVO nodeVo = new PageFieldVO();
		DozerMapper.getInstance().map(field, nodeVo);
		Integer minProQuantity = Integer.valueOf(20);

		PageLayoutTemplate template = field.getPageLayoutTemplate();
		if (template != null) {
			PageFieldTemplateVO templateVo = new PageFieldTemplateVO();
			DozerMapper.getInstance().map(field.getPageLayoutTemplate(),
					templateVo);
			nodeVo.setTemplateVo(templateVo);
			minProQuantity = template.getMinProQuantity();
		} else if ((field.getPageLayout() != null)
				&& (field.getPageLayout().getPageLayoutTemplate() != null)) {
			minProQuantity = field.getPageLayout().getPageLayoutTemplate()
					.getMinProQuantity();
		}

		Set<PageLayout> fields = field.getChildPageLayouts();
		if ((fields == null) || (fields.isEmpty())) {
			List<WebProductVO> productVos = this.productService.getPageLayoutProducts(
					field.getSid(), minProQuantity.intValue());
			if(productVos != null && !productVos.isEmpty() && productVos.size()>0) {
				nodeVo.setProductList(productVos);
			}
			
			List<BrandVO> brandVos = this.brandService.getPageLayoutBrands(field
					.getSid());
			if(brandVos !=null && !brandVos.isEmpty() && brandVos.size()>0) {
				nodeVo.setBrandList(brandVos);
			}

			Set<PageLayoutContent> contents = field.getPageLayoutContents();
			if ((contents != null) && (!contents.isEmpty())) {
				List<PageFieldContentVO> listContentVo = new ArrayList<PageFieldContentVO>();
				for (PageLayoutContent content : contents) {
					PageFieldContentVO contentVo = new PageFieldContentVO();
					DozerMapper.getInstance().map(content, contentVo);
					listContentVo.add(contentVo);
				}
				nodeVo.setContentList(listContentVo);
			}
			return nodeVo;
		}

		List<PageFieldVO> listVo = new ArrayList<PageFieldVO>();
		for (PageLayout pageLayout : fields) {
			PageFieldVO vo = buildNodeVO(pageLayout);
			listVo.add(vo);
		}
		if(listVo.size()>0) {
			nodeVo.setSubList(listVo);
		}
		return nodeVo;
	}

}

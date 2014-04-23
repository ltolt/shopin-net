/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controller.PromotionController.java
 * @Create By wangdg
 * @Create In 2013-8-30 下午4:35:23
 * TODO
 */
package net.shopin.wms.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.wms.domain.entity.PageLayoutMql;
import net.shopin.wms.domain.entity.PageTemplate;
import net.shopin.wms.domain.entity.PromotionType;
import net.shopin.wms.domain.entity.Promotions;
import net.shopin.wms.domain.view.PromotionsVO;
import net.shopin.wms.service.IPageLayoutMqlService;
import net.shopin.wms.service.IPageTemplateService;
import net.shopin.wms.service.IPromotionService;
import net.shopin.wms.service.IPromotionTypeService;
import net.shopin.wms.util.FtpUtil;
import net.shopin.wms.util.PromotionsKey;
import net.shopin.wms.util.PromotionsUtil;
import net.shopin.wms.util.ResultUtil;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.SystemConfig;
import com.framework.page.Paginator;

/**
 * @Class Name PromotionController
 * @Author wangdg
 * @Create In 2013-8-30
 */
@Controller
@RequestMapping("/promotions")
public class PromotionController {

	@Autowired
	IPromotionService promotionService;

	@Autowired
	IPageLayoutMqlService pageLayoutService;

	@Autowired
	IPageTemplateService pageTemplateService;

	@Autowired
	IPromotionTypeService promotionTypeService;

	private int maxPostSize = 100 * 1024 * 1024;

	@ResponseBody
	@RequestMapping(value = "/selectPageTemplateByType", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String selectPageTemplateByType(HttpServletRequest request,
			HttpServletResponse response) {
		String json = "";
		try {
			PageTemplate pageTemplate = new PageTemplate();
			pageTemplate.setType(2);
			List list = this.pageTemplateService.queryBySelective(pageTemplate);
			json = ResultUtil.createSuccessResult(list);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/selectPromotionType", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String selectPromotionType(HttpServletRequest request,
			HttpServletResponse response) {
		String json = "";
		try {
			PromotionType promotionType = new PromotionType();
			List list = this.promotionTypeService
					.queryBySelective(promotionType);
			json = ResultUtil.createSuccessResult(list);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	/**
	 * 说明： 分页查询活动记录
	 * 
	 * @Methods Name selectPromotions
	 * @Create In 2013-9-2 By jingpeng
	 * @param key
	 */
	@ResponseBody
	@RequestMapping(value = "/selectPromotionListByKey", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String selectPromotionListByKey(PromotionsVO key) {
		Paginator paginator = new Paginator();
		String resultJson = "";
		try {
			paginator.setPageSize(key.getPageSize());
			paginator.setCurrentPage(key.getCurrentPage());
			paginator.setTotalRecordsBuild(this.promotionService
					.selectCountByParms(key));
			paginator.setList(this.promotionService.selectByPrams(key));
			resultJson = ResultUtil.createSuccessResultPage(paginator);
		} catch (Exception e) {
			resultJson = ResultUtil.createFailureResult(e);
		}
		return resultJson;
	}

	/**
	 * 说明： 审核活动/作废活动
	 * 
	 * @Methods Name updateStatus
	 * @Create In 2013-9-3 By jingpeng
	 * @param sid
	 * @param promotionStatus
	 *            void
	 */
	@ResponseBody
	@RequestMapping(value = "/updatePromotionStatus", method = {
			RequestMethod.GET, RequestMethod.POST })
	public void updateStatus(String sid, String promotionStatus) {
		Promotions promotion = null;
		if (sid != null && !"".equals(sid)) {
			promotion = this.promotionService.selectByPrimaryKey(Integer
					.parseInt(sid));
		}
		if (promotion != null && promotionStatus != null
				&& !"".equals(promotionStatus)) {
			promotion.setPromotionStatus(Integer.parseInt(promotionStatus));
			this.promotionService.updateByPrimaryKey(promotion);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/updateAndUploadToFTP", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String updateAndUploadToFTP(String sid, Model m,
			HttpServletRequest request, HttpServletResponse response)
			throws ParseException, IOException, FileUploadException {
		String json = "";
		String name;
		Boolean isVIP=false;
		String encoding = request.getCharacterEncoding();
		OutputStream out = null;
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(maxPostSize);

		List fileItems = upload.parseRequest(request);
		for (int i = 0; i < fileItems.size(); i++) {
			FileItem item = (FileItem) fileItems.get(i);
			if (item.getFieldName() == "sid"
					|| "sid".equals(item.getFieldName())) {
				sid = item.getString();
			}

		}
		Promotions p = this.promotionService.selectByPrimaryKey(Integer
				.valueOf(sid));
		name = FtpUtil.getImagePath();
		for (int i = 0; i < fileItems.size(); i++) {
			FileItem item = (FileItem) fileItems.get(i);
			if (!item.isFormField() && item.getName() != null
					&& !"".equals(item.getName())) {
				String filename = item.getName();
				String upName = "";
				upName = name + i + "." + filename.split("\\.")[1];
				FtpUtil.saveToFtp(out, upName, item);
				Promotions pro = new Promotions();
				pro.setSid(Integer.valueOf(sid));
				if ("promotionSpict".equals(item.getFieldName())
						&& !(item.getString().equals(p.getPromotionSpict()))) {
					pro.setPromotionSpict("/" + SystemConfig.PROMOTION_PATH +"/" + upName);
				}
				if ("promotionBpict".equals(item.getFieldName())
						&& !(item.getString().equals(p.getPromotionBpict()))) {
					pro.setPromotionBpict("/" + SystemConfig.PROMOTION_PATH +"/"+ upName);
				}
				if ("promotionVpict".equals(item.getFieldName())
						&& !(item.getString().equals(p.getPromotionVpict()))) {
					pro.setPromotionVpict("/" + SystemConfig.PROMOTION_PATH +"/" + upName);
				}
				if ("promotionCpict".equals(item.getFieldName())
						&& !(item.getString().equals(p.getPromotionCpict()))) {
					pro.setPromotionCpict("/" + SystemConfig.PROMOTION_PATH +"/" + upName);
				}
				if ("promotionCgpict".equals(item.getFieldName())
						&& !(item.getString().equals(p.getPromotionCgpict()))) {
					pro.setPromotionCgpict("/" + SystemConfig.PROMOTION_PATH +"/" + upName);
				}

				this.promotionService.updateByPrimaryKeySelective(pro);
			} else {
				String key = item.getFieldName();
				String value = item.getString(encoding);
				if("promotionTypeSid".equals(key)&&("5".equals(value)||value=="5")){
					isVIP = true;
				}
				Promotions pt = PromotionsUtil.setPromotions(key, value, sid,isVIP);
				this.promotionService.updateByPrimaryKeySelective(pt);
			}
		}
		json = ResultUtil.createSuccessResult();
		return json;

	}

	@ResponseBody
	@RequestMapping(value = "/saveAndUploadToFTP", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String saveAndUploadToFTP(String sid, HttpServletRequest request,
			HttpServletResponse response) throws FileUploadException,
			ParseException, UnsupportedEncodingException {
		String json = "";
		String name;
		Boolean isVIP=false;
		String encoding = request.getCharacterEncoding();
		OutputStream out = null;
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(maxPostSize);

		if (sid == null || "".equals(sid)) {
			PageLayoutMql pageLayout = new PageLayoutMql();
			pageLayout.setTitle("闪购栏目");
			pageLayout.setPageType(0);
			pageLayout.setNodeLevel(0);
			this.pageLayoutService.insertSelective(pageLayout);
			Promotions promotions = new Promotions();
			promotions.setPageLayoutSid(pageLayoutService.queryMaxSid());
			promotions.setPromotionStatus(0);
			this.promotionService.insertSelective(promotions);
			sid = this.promotionService.queryMaxSid() + "";

		}

		List fileItems = upload.parseRequest(request);
		name = FtpUtil.getImagePath();
		for (int i = 0; i < fileItems.size(); i++) {
			FileItem item = (FileItem) fileItems.get(i);
			if (!item.isFormField() && item.getName() != null
					&& !"".equals(item.getName())) {
				String filename = item.getName();
				String upName = "";
				upName = name + i + "." + filename.split("\\.")[1];
				FtpUtil.saveToFtp(out, upName, item);
				Promotions pro = new Promotions();
				pro.setSid(Integer.valueOf(sid));
				if (item.getFieldName() == "promotionSpict"
						|| "promotionSpict".equals(item.getFieldName())) {
					pro.setPromotionSpict("/" + SystemConfig.PROMOTION_PATH +"/"+ upName);
				}
				if (item.getFieldName() == "promotionBpict"
						|| "promotionBpict".equals(item.getFieldName())) {
					pro.setPromotionBpict("/" + SystemConfig.PROMOTION_PATH +"/" + upName);
				}
				if (item.getFieldName() == "promotionVpict"
						|| "promotionVpict".equals(item.getFieldName())) {
					pro.setPromotionVpict("/" + SystemConfig.PROMOTION_PATH +"/" + upName);
				}
				if (item.getFieldName() == "promotionCpict"
						|| "promotionCpict".equals(item.getFieldName())) {
					pro.setPromotionCpict("/" + SystemConfig.PROMOTION_PATH +"/" + upName);
				}
				if (item.getFieldName() == "promotionCgpict"
						|| "promotionCgpict".equals(item.getFieldName())) {
					pro.setPromotionCgpict("/" + SystemConfig.PROMOTION_PATH +"/" + upName);
				}

				this.promotionService.updateByPrimaryKeySelective(pro);
			} else {
				String key = item.getFieldName();
				String value = item.getString(encoding);
				if("promotionTypeSid".equals(key)&&("5".equals(value)||value=="5")){
					isVIP = true;
				}
				Promotions pt = PromotionsUtil.setPromotions(key, value, sid,isVIP);
				// pt.setSid(Integer.valueOf(sid));
				this.promotionService.updateByPrimaryKeySelective(pt);
			}
		}
		json = ResultUtil.createSuccessResult();
		return json;

	}

}

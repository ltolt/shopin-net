package com.shopin.modules.utils;

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import com.shopin.modules.web.view.PageVO;


import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * @Class Name PageHelper
 * @Author kongm
 * @Create In 2013-9-9
 */
public class PageHelper {
	// ---------------------------------variables
	/**
	 * 如果需要在分页条上保存一些状态信息，需要用到request对象
	 */
	private HttpServletRequest request;
	private String pageTemplate;
	private String url;
	private String param;

	// ------------------------constructors
	public PageHelper(HttpServletRequest request, String pageTemplate,
			String url) {
		this.request = request;
		this.pageTemplate = pageTemplate;
		this.param = request.getQueryString();
		this.url = request.getContextPath() + url;
	}

	/**
	 * 说明: 
	 *     根据模板生成分页条
	 * @Methods Name getPageBreakStr
	 * @Create In 2013-9-9 By kongm
	 * @param pageObj
	 * @return String
	 */
	public String getPageBreakStr(PageVO pageObj) {
		// 分页器参数
		int page = pageObj.getPageNo();
		long total = pageObj.getTotalPages();
		int pageSize = 6;
		int startPage = (page - pageSize / 2) <= 0 ? 1 : page - pageSize / 2;
		int remberStart = 1;
		// 是否翻页可用首页 上一页 下一页 最后一页 true 可用   false不可用
		boolean display1 = false;
		boolean display2 = false;
		boolean display3 = false;
		boolean display4 = false;
		// 是否有url参数
		boolean isHaveParam = false;
		if (null != param && !"".equals(param)) {
			isHaveParam = true;
		}
		// 计算当前页数
		page = getCPage(total, page);
		if (total <= 0)
			return "";
		/**
		 * 保存当前页码
		 */
		this.request.setAttribute("cpage", String.valueOf(page));
		// 计算页数序列(每次显示10个页数)1...10 11..20 21..30
		StringBuffer pageBarBuffer = new StringBuffer();
		StringBuffer prevPageNumStart = new StringBuffer();
		StringBuffer prevPageNumEnd = new StringBuffer();

		StringBuffer nextPageNumStart = new StringBuffer();
		StringBuffer nextPageNumEnd = new StringBuffer();
		/**
		 * 是否在前？页和后？页图片上使用样式
		 */
		boolean isPrevPageNumStyle = false;
		boolean isNextPageNumStyle = false;
		if (startPage > 1) {
			prevPageNumEnd.append("...");
		} else {
			isPrevPageNumStyle = true;
		}
		/**
		 * 分页页码条
		 */
		for (remberStart = startPage; remberStart < startPage + pageSize; remberStart++) {
			if (remberStart == page) {
				pageBarBuffer.append("<span class=\"page_select\">" + remberStart
						+ "</span>");
			} else {
				if (isHaveParam) {
					pageBarBuffer.append("<a href=\"" + url + "/" + remberStart
							+ ".html?" + param + "\">" + remberStart + "</a>");
				} else {
					pageBarBuffer.append("<a href=\"" + url + "/" + remberStart
							+ ".html\">" + remberStart + "</a>");
				}
			}

			if (remberStart == total)
				break;
		}

		if ((remberStart - startPage) >= pageSize) {
			nextPageNumEnd.append("<span class=\"page_dots\">...</span>");
		} else {
			isNextPageNumStyle = true;
		}

		// 首页
		StringBuffer firstPageBuffer = new StringBuffer();
		if (total > 1 && page != 1) {
			firstPageBuffer.append(url + "/1.html");
			if (isHaveParam) {
				firstPageBuffer.append("?" + param);
			}
			display1 = true;
		}

		// 上一页
		StringBuffer perPageBuffer = new StringBuffer();
		if (page > 1) {
			perPageBuffer.append(url + "/" + (page - 1) + ".html");
			if (isHaveParam) {
				perPageBuffer.append("?" + param);
			}
			display2 = true;
		}

		// 下一页
		StringBuffer nextPageBuffer = new StringBuffer();
		if (page < total) {
			nextPageBuffer.append(url + "/" + (page + 1) + ".html");
			if (isHaveParam) {
				nextPageBuffer.append("?" + param);
			}
			display3 = true;
		}

		// 最后一页
		StringBuffer lastPageBuffer = new StringBuffer();
		if (total > 1 && page < total) {
			lastPageBuffer.append(url + "/" + total + ".html");
			if (isHaveParam) {
				lastPageBuffer.append("?" + param);
			}
			display4 = true;
		}

		Configuration cfg = new Configuration();
		Template newsTemplate = null;
		StringWriter out = new StringWriter();
		try {
			Resource res = new ClassPathResource("\\templates\\page");
			cfg.setDirectoryForTemplateLoading(res.getFile());
			cfg.setObjectWrapper(new DefaultObjectWrapper());

			/**
			 * 因为本项目所有页面均为UTF-8编码，故此采用UTF-8, 如果页面编码为GBK,此处也需要改成GBK
			 */
			newsTemplate = cfg.getTemplate(pageTemplate, "UTF-8");

			/**
			 * 以下主要是进行数据填充,将数据填充到模型中
			 */
			Map root = new HashMap();
			root.put("total", String.valueOf(total));
			root.put("page", String.valueOf(page));
			root.put("allPage", String.valueOf(total));

			if (display1) {
				root.put("firstPageStart",
						"<a href=\"" + firstPageBuffer.toString() + "\">");
				root.put("firstPageEnd", "</a>");
			} else {
				root.put("firstPageStart", "<span class=\"page_fir disabled\">");
				root.put("firstPageEnd", "</span>");
			}
			if (display2) {
				root.put("prevPageStart",
						"<a href=\"" + perPageBuffer.toString() + "\">");
				root.put("prevPageEnd", "</a>");
			} else {
				root.put("prevPageStart", "<span class=\"page_pre disabled\">");
				root.put("prevPageEnd", "</span>");
			}
			if (display3) {
				root.put("nextPageStart",
						"<a href=\"" + nextPageBuffer.toString() + "\">");
				root.put("nextPageEnd", "</a>");
			} else {
				root.put("nextPageStart", "<span class=\"page_next disabled\">");
				root.put("nextPageEnd", "</span>");
			}
			if (display4) {
				root.put("lastPageStart",
						"<a href=\"" + lastPageBuffer.toString() + "\">");
				root.put("lastPageEnd", "</a>");
			} else {
				root.put("lastPageStart", "<span class=\"page_last disabled\">");
				root.put("lastPageEnd", "</span>");
			}
			root.put("prevPageNumStart", prevPageNumStart.toString());
			root.put("prevPageNumEnd", prevPageNumEnd.toString());
			root.put("nextPageNumStart", nextPageNumStart.toString());
			root.put("nextPageNumEnd", nextPageNumEnd.toString());
			root.put("pageBar", pageBarBuffer.toString());
			try {
				newsTemplate.process(root, out);
			} catch (TemplateException e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return out.toString();

	}

	/**
	 * 计算总页数
	 * 
	 * @Methods Name getCPage
	 * @Create In 2013-9-9 By kongm
	 * @param total
	 * @param cPage
	 * @return int
	 */
	public int getCPage(long total, int cPage) {
		if (cPage - total == 1) {
			cPage--;
		}
		if (cPage - total > 1 || cPage < 1) {
			cPage = 1;
		}
		return cPage;
	}

}

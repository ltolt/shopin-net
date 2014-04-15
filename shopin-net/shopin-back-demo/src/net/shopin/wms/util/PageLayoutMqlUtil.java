/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.util.PageLayoutMqlUtil.java
 * @Create By wangdg
 * @Create In 2013-8-30 下午4:50:33
 * TODO
 */
package net.shopin.wms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import net.shopin.wms.domain.entity.PageLayoutMql;

/**
 * @Class Name PageLayoutMqlUtil
 * @Author wangdg
 * @Create In 2013-8-30
 */
public class PageLayoutMqlUtil {

	public static PageLayoutMql pageLayoutMqlResult(PageLayoutMqlKey key)
			throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		PageLayoutMql pageLayoutMql = new PageLayoutMql();

		if (key.getSid() != null && !"".equals(key.getSid())) {
			pageLayoutMql.setSid(Integer.valueOf(key.getSid()));
		}
		if (key.getPageLayoutSid() != null
				&& !"".equals(key.getPageLayoutSid())) {
			pageLayoutMql.setPageLayoutSid(Integer.valueOf(key
					.getPageLayoutSid()));
		}
		if (key.getProLinkType() != null
				&& !"".equals(key.getProLinkType())) {
			pageLayoutMql.setProLinkType(Integer.valueOf(key.getProLinkType()));
		}
		if (key.getSeq() != null
				&& !"".equals(key.getSeq())) {
			pageLayoutMql.setSeq(key.getSeq());
		}
		if (key.getPageLayoutTemplateSid() != null
				&& !"".equals(key.getPageLayoutTemplateSid())) {
			pageLayoutMql.setPageLayoutTemplateSid(Integer.valueOf(key.getPageLayoutTemplateSid()));
		}
		if (key.getTitle() != null
				&& !"".equals(key.getTitle())) {
			pageLayoutMql.setTitle(key.getTitle());
		}
		if (key.getTitleLink() != null
				&& !"".equals(key.getTitleLink())) {
			pageLayoutMql.setTitleLink(key.getTitleLink());
		}
		if (key.getPageType() != null
				&& !"".equals(key.getPageType())) {
			pageLayoutMql.setPageType(Integer.valueOf(key
					.getPageType()));
		}
		if (key.getChannelSid() != null
				&& !"".equals(key.getChannelSid())) {
			pageLayoutMql.setChannelSid(Integer.valueOf(key.getChannelSid()));
		}
		if (key.getNodeLevel() != null
				&& !"".equals(key.getNodeLevel())) {
			pageLayoutMql.setNodeLevel(Integer.valueOf(key
					.getNodeLevel()));
		}
		if (key.getStartTime() != null
				&& !"".equals(key.getStartTime())) {
			pageLayoutMql
					.setStartTime(sdf.parse(key.getStartTime()));
		}
		if (key.getEndTime() != null
				&& !"".equals(key.getEndTime())) {
			pageLayoutMql
					.setEndTime(sdf.parse(key.getEndTime()));
		}

		return pageLayoutMql;
	}
}

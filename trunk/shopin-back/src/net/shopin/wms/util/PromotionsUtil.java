/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.util.PromotionsUtil.java
 * @Create By wangdg
 * @Create In 2013-8-30 下午4:50:33
 * TODO
 */
package net.shopin.wms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import net.shopin.wms.domain.entity.Promotions;

/**
 * @Class Name PromotionsUtil
 * @Author wangdg
 * @Create In 2013-8-30
 */
public class PromotionsUtil {

	public static Promotions promotionResult(PromotionsKey key)
			throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Promotions promotions = new Promotions();

		if (key.getSid() != null && !"".equals(key.getSid())) {
			promotions.setSid(Integer.valueOf(key.getSid()));
		}
		if (key.getPageTemplateSid() != null
				&& !"".equals(key.getPageTemplateSid())) {
			promotions.setPageTemplateSid(Integer.valueOf(key
					.getPageTemplateSid()));
		}
		if (key.getPromotionBpict() != null
				&& !"".equals(key.getPromotionBpict())) {
			promotions.setPromotionBpict(key.getPromotionBpict());
		}
		if (key.getPromotionDesc() != null
				&& !"".equals(key.getPromotionDesc())) {
			promotions.setPromotionDesc(key.getPromotionDesc());
		}
		if (key.getPromotionLink() != null
				&& !"".equals(key.getPromotionLink())) {
			promotions.setPromotionLink(key.getPromotionLink());
		}
		if (key.getPromotionSpict() != null
				&& !"".equals(key.getPromotionSpict())) {
			promotions.setPromotionSpict(key.getPromotionSpict());
		}
		if (key.getPromotionTitle() != null
				&& !"".equals(key.getPromotionTitle())) {
			promotions.setPromotionTitle(key.getPromotionTitle());
		}
		if (key.getPromotionTypeSid() != null
				&& !"".equals(key.getPromotionTypeSid())) {
			promotions.setPromotionTypeSid(Integer.valueOf(key
					.getPromotionTypeSid()));
		}
		if (key.getPromotionVpict() != null
				&& !"".equals(key.getPromotionVpict())) {
			promotions.setPromotionVpict(key.getPromotionVpict());
		}
		if (key.getPromotionBeginTime() != null
				&& !"".equals(key.getPromotionBeginTime())) {
			promotions.setPromotionBeginTime(sdf.parse(key
					.getPromotionBeginTime()));
		}
		if (key.getPromotionEndTime() != null
				&& !"".equals(key.getPromotionEndTime())) {
			promotions
					.setPromotionEndTime(sdf.parse(key.getPromotionEndTime()));
		}
		if (key.getSeq() != null && !"".equals(key.getSeq())) {
			promotions.setSeq(key.getSeq());
		}
		if (key.getPromotionCpict() != null
				&& !"".equals(key.getPromotionCpict())) {
			promotions.setPromotionCpict(key.getPromotionCpict());
		}
		if (key.getPromotionCgpict() != null
				&& !"".equals(key.getPromotionCgpict())) {
			promotions.setPromotionCgpict(key.getPromotionCgpict());
		}

		return promotions;
	}

	public static Promotions setPromotions(String key, String value,
			String sid, Boolean isVIP) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Promotions pro = new Promotions();
		if (key.equals("pageTemplateSid") && value != null && !"".equals(value)) {
			pro.setPageTemplateSid(Integer.valueOf(value));
		}
		if (key.equals("promotionTypeSid") && value != null
				&& !"".equals(value)) {
			pro.setPromotionTypeSid(Integer.valueOf(value));
		}
		if (key.equals("promotionTitle") && value != null && !"".equals(value)) {
			pro.setPromotionTitle(value);
		}
		if (key.equals("promotionDesc") && value != null && !"".equals(value)) {
			pro.setPromotionDesc(value);
		}
		if (key.equals("seq") && value != null && !"".equals(value)) {
			pro.setSeq(value);
		}
		if (key.equals("promotionLink")) {
			if (value != null && !"".equals(value)) {
				pro.setPromotionLink(value);
			} else if (isVIP == true) {
				pro.setPromotionLink("/vippromotion/" + sid + ".html");
			} else {
				pro.setPromotionLink("/promotion/" + sid + ".html");
			}
		}
		if (key.equals("promotionBeginTime") && value != null
				&& !"".equals(value)) {
			pro.setPromotionBeginTime(sdf.parse(value));
		}
		if (key.equals("promotionEndTime") && value != null
				&& !"".equals(value)) {
			pro.setPromotionEndTime(sdf.parse(value));
		}
		if (sid != null && !"".equals(sid)) {
			pro.setSid(Integer.valueOf(sid));
		}
		return pro;

	}
}

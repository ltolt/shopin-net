/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.util.LeaveMessageUtil.java
 * @Create By wangdg
 * @Create In 2013-8-14 下午8:03:53
 * TODO
 */
package net.shopin.wms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import net.shopin.wms.domain.view.LeaveMessageKey;
import net.shopin.wms.domain.view.LeaveMessageVO;

/**
 * @Class Name LeaveMessageUtil
 * @Author wangdg
 * @Create In 2013-8-14
 */
public class LeaveMessageUtil {

	public static LeaveMessageVO resultMessage(LeaveMessageKey key)
			throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		LeaveMessageVO vo = new LeaveMessageVO();

		if (key.getStartTime() != null && !"".equals(key.getStartTime())) {
			vo.setStartTime(sdf.parse(key.getStartTime()));
		}
		if (key.getEndTime() != null && !"".equals(key.getEndTime())) {
			vo.setEndTime(sdf.parse(key.getEndTime()));
		}
		if (key.getBlacklist() != null && !"".equals(key.getBlacklist())) {
			vo.setBlacklist(Integer.valueOf(key.getBlacklist()));
		}
		if (key.getLeaveMessageType() != null
				&& !"".equals(key.getLeaveMessageType())) {
			vo.setLeaveMessageType(Integer.valueOf(key.getLeaveMessageType()));
		}
		if (key.getOrderKey() != null && !"".equals(key.getOrderKey())) {
			vo.setOrderKey(key.getOrderKey());
		}
		if (key.getOrderno() != null && !"".equals(key.getOrderno())) {
			vo.setOrderno(key.getOrderno());
		}
		if (key.getPageNo() != null && !"".equals(key.getPageNo())) {
			vo.setPageNo(Integer.valueOf(key.getPageNo()));
		}else{
			vo.setPageNo(1);
		}
		if (key.getPageSize() != null && !"".equals(key.getPageSize())) {
			vo.setPageSize(Integer.valueOf(key.getPageSize()));
		}
		if (key.getReplyStatus() != null && !"".equals(key.getReplyStatus())) {
			vo.setReplyStatus(Integer.valueOf(key.getReplyStatus()));
		}
		if (key.getUserEmail() != null && !"".equals(key.getUserEmail())) {
			vo.setUserEmail(key.getUserEmail());
		}
		vo.setStart((vo.getPageNo() - 1) * (vo.getPageSize()));

		return vo;

	}
}

/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceITRuelsMqlService.java
 * @Create By Administrator
 * @Create In 2013-9-27 上午1:48:11
 * TODO
 */
package net.shopin.wms.service;

import java.sql.SQLException;
import java.util.List;

import net.shopin.wms.util.ChannelsMqlVO;

/**
 * @Class Name ITRuelsMqlService
 * @Author Administrator
 * @Create In 2013-9-27
 */
public interface ITRuelsMqlService {
	List<ChannelsMqlVO> findRules() throws SQLException;
}

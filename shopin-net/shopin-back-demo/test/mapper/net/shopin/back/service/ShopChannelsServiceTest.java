/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceShopChannelsSeerviceTest.java
 * @Create By wangdg
 * @Create In 2013-5-9 下午8:42:06
 * TODO
 */
package net.shopin.back.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.back.controller.ShopChannelsController;
import net.shopin.back.entity.cond.ShopChannelsCond;
import net.shopin.back.entity.po.ShopChannels;
import net.shopin.back.entity.vo.ShopChannelsVO;
import net.shopin.back.mapper.ShopChannelsMapper;
import net.shopin.back.service.IShopChannelsService;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;
import com.framework.testCase.AbstractTest;

/**
 * @Class Name ShopChannelsSeerviceTest
 * @Author wangdg
 * @Create In 2013-5-10
 */
public class ShopChannelsServiceTest extends AbstractTest {

	IShopChannelsService shopChannelsService;
	ShopChannelsCond cond;
	Infos infos;

	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.shopChannelsService = context.getBean(IShopChannelsService.class);
	}

	//@Test
	public void testFindObjBySid() {
		Assert.notNull(this.shopChannelsService);

		try {
			ShopChannelsVO vo = shopChannelsService.findObjBySid(infos, 1L);
			System.out.println(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//@Test
	public void testQueryObjsList() throws SQLException {

		cond = new ShopChannelsCond();
		Paginator page = null;
		page = shopChannelsService.queryObjs(infos, cond);
		System.out.println(page);
	}

	//@Test
	public void testInsert() throws SQLException {
		cond = new ShopChannelsCond();
		ShopChannels table = new ShopChannels();

		//table.setSid(200L);
		table.setPageLayoutSid(20);
		table.setPageTemplateSid(11);
		table.setChannelDesc("aa");
		table.setChannelUrl("aa");
		table.setFlag(1);
		table.setName("aa");
		table.setShow(1);
		table.setDisplayName("s");
		table.setSeq("1");

		cond.setShopChannels(table);
		shopChannelsService.insert(infos, cond);
		System.out.println(cond.getShopChannels().getSid());
	}

	//@Test
	public void testUpdate() throws SQLException {

		cond = new ShopChannelsCond();
		ShopChannels table = new ShopChannels();
		table.setSid(166L);
		table.setChannelDesc("ddddd");
		cond.setShopChannels(table);

		shopChannelsService.update(infos, cond);
		System.out.print(cond.getShopChannels().getChannelDesc());

	}

	//@Test
	public void testDelete() throws SQLException {

		shopChannelsService.delete(infos, 166L);
	}

}

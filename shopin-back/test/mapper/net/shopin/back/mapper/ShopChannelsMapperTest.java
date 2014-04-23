/**
 * @Probject Name: shopin-back-demo
 * @Path: test.com.demo.mapperShopChannelsMapperTest.java
 * @Create By wangdg
 * @Create In 2013-5-9 下午5:24:08
 * TODO
 */
package net.shopin.back.mapper;

import java.sql.SQLException;
import java.util.List;

import net.shopin.back.entity.cond.ShopChannelsCond;
import net.shopin.back.entity.po.ShopChannels;
import net.shopin.back.entity.vo.ShopChannelsVO;
import net.shopin.back.mapper.ShopChannelsMapper;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.demo.entity.cond.UserCond;
import com.demo.entity.po.User;
import com.framework.testCase.AbstractTest;

/**
 * @Class Name ShopChannelsMapperTest
 * @Author wangdg
 * @Create In 2013-5-9
 */
public class ShopChannelsMapperTest extends AbstractTest {

	ShopChannelsMapper shopChannelsMapper;

	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.shopChannelsMapper = context.getBean(ShopChannelsMapper.class);
	}

	// @Test
	public void testFindObjBySid() {
		Assert.notNull(this.shopChannelsMapper);
		try {
			ShopChannelsVO vo = shopChannelsMapper.findObjBySid(1L);
			System.out.println(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// @Test
	public void testQueryObjsList() {
		ShopChannelsCond cond = new ShopChannelsCond();
		cond.setCurrentPage(2);
		try {
			Integer num = shopChannelsMapper.queryObjsCount(cond);
			System.out.println("num - " + num);
			cond.setTotalRecordsBuild(num);
			List<ShopChannelsVO> vos = shopChannelsMapper.queryObjsList(cond);
			System.out.println("vos - " + vos.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//@Test
	public void testQueryObjsCount() {
		ShopChannelsCond cond = new ShopChannelsCond();
		// cond.setSid(1L);
		// cond.setSeq("10");
		cond.setFlag(1);

		try {
			Integer num = shopChannelsMapper.queryObjsCount(cond);
			System.out.println("num - " + num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//@Test
	public void testInsert() {
		ShopChannelsCond cond = new ShopChannelsCond();
		ShopChannels table = new ShopChannels();

		//table.setSid(200L);
		table.setPageLayoutSid(20);
		table.setChannelUrl("aa");
		
		// 添加具体测试代码
		cond.setShopChannels(table);
		try {
			shopChannelsMapper.insert(cond.getShopChannels());
			System.out.println("new sid = " + cond.getShopChannels().getSid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// @Test
	public void testUpdate() {
		ShopChannelsCond cond = new ShopChannelsCond();
		ShopChannels table = new ShopChannels();
		table.setSid(165L);
		table.setSeq("2");
		table.setChannelDesc("ttt");

		cond.setShopChannels(table);
		try {
			shopChannelsMapper.update(cond.getShopChannels());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//@Test
	public void testDelete() {
		try {
			shopChannelsMapper.delete(183L);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

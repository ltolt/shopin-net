package test.com.demo.mapper;

import static org.junit.Assert.fail;

import java.sql.SQLException;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.demo.entity.cond.UserCond;
import com.demo.entity.po.User;
import com.demo.entity.vo.UserVO;
import com.demo.mapper.UserMapper;
import com.framework.returnObj.Infos;
import com.framework.testCase.AbstractTest;

/**
 * desc   : 用户表 mapper测试类
 * author : luxiangxing
 * data   : 2013-04-18
 * email  : xiangxingchina@163.com
 **/
public class UserMapperTest extends AbstractTest {
	UserMapper mapper;
	@Before
	public void setUp() throws Exception {
		super.setUp();
		mapper = context.getBean(UserMapper.class);
	}
	
//	@Test
	public void testFindObjBySid() {
		try {
			UserVO vo= mapper.findObjBySid(1L);		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

//	@Test
	public void testQueryObjsList() {
		UserCond cond = new UserCond();
		cond.setUserName("test2");
		cond.setPassword("test2");
		cond.setRemark("test2");
		cond.setCurrentPage(1);
		try {
		Integer num = mapper.queryObjsCount(cond);
		cond.setTotalRecordsBuild(num);
		List<UserVO> vos = mapper.queryObjsList(cond);
		System.out.println("vos - "+vos.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testQueryObjsCount() {
		UserCond cond = new UserCond();
//		cond.setSid(1L);
		cond.setUserName("test2");
		cond.setPassword("test2");
		cond.setRemark("test2");

		try {
			Integer num = mapper.queryObjsCount(cond);
			System.out.println("num - "+num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	@Test
	public void testInsert() {
		UserCond cond = new UserCond();
		User table = new User();
		table.setSid(2L);
		table.setUserName("test2");
		table.setPassword("test2");
		table.setRemark("test2");

		//添加具体测试代码
		cond.setUser(table);
		try {
			mapper.insert(cond.getUser());
			System.out.println("new sid = "+ cond.getUser().getSid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

//	@Test
	public void testUpdate() {
		UserCond cond = new UserCond();
		User table = new User();
		table.setSid(1L);
		table.setUserName("test2");
		table.setPassword("test2");
		table.setRemark("test2");

		cond.setUser(table);
		try {
			mapper.update(cond.getUser());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

//	@Testz
	public void testDelete() {
		try {
			mapper.delete(1L);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

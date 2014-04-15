package com.demo.service.impl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entity.cond.UserCond;
import com.demo.entity.vo.UserVO;
import com.demo.mapper.UserMapper;
import com.demo.service.IUserService;
import com.framework.page.Paginator;
import com.framework.returnObj.Infos;

/**
 * desc   : 用户表 service实现类
 * author : luxiangxing
 * data   : 2013-04-12
 * email  : xiangxingchina@163.com
 **/

@Service(value = "userService")
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserMapper userMapper;
	

	public UserVO findObjBySid(Infos infos, Long sid) throws SQLException {
		return userMapper.findObjBySid(sid);
	}

	public Paginator queryObjs(Infos infos, UserCond cond) throws SQLException {
		Paginator page = new Paginator();
		page.setList(userMapper.queryObjsList(cond));
		page.setTotalRecords(userMapper.queryObjsCount(cond));
		page.setPage(cond);
		return page;
	}

	public void insert(Infos infos, UserCond cond) throws SQLException {
		userMapper.insert(cond.getUser());
	}

	public void update(Infos infos, UserCond cond) throws SQLException {
		userMapper.update(cond.getUser());
	}

	public void delete(Infos infos, Long sid) throws SQLException {
		userMapper.delete(sid);
	}
}

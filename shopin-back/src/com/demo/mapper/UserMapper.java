package com.demo.mapper;

import java.sql.SQLException;

import com.demo.entity.cond.UserCond;
import com.demo.entity.po.User;
import com.demo.entity.vo.UserVO;
import com.framework.IAbstractDAO;
import java.util.Date;
 /**
 * desc   : 用户表 mapper接口
 * author : luxiangxing
 * data   : 2013-04-12
 * email  : xiangxingchina@163.com
 **/

public interface UserMapper extends IAbstractDAO<UserCond, User, UserVO> {
 
}

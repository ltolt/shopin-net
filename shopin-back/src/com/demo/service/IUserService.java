package com.demo.service;

import java.sql.SQLException;

import com.demo.entity.cond.UserCond;
import com.demo.entity.po.User;
import com.demo.entity.vo.UserVO;
import com.framework.IAbstractService;
import com.framework.returnObj.Infos;

/**
 * desc   : 用户表 service�ӿ�
 * author : luxiangxing
 * data   : 2013-04-12
 * email  : xiangxingchina@163.com
 **/

public interface IUserService extends IAbstractService<UserCond, User, UserVO>{

}

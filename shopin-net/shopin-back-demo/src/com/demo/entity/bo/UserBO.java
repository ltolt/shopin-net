package com.demo.entity.bo;

import java.lang.reflect.InvocationTargetException;
import org.apache.commons.beanutils.BeanUtils;
import com.demo.entity.cond.UserCond;
import com.demo.entity.po.User;
import java.util.Date;
/**
 * desc   : 用户表 业务对象
 * author : luxiangxing
 * data   : 2013-04-12
 * email  : xiangxingchina@163.com
 **/

public class UserBO {
	public static void Con2Po(UserCond cond,User user){
		try {
			BeanUtils.copyProperties(user, cond);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	public static void Po2Con(User user,UserCond cond){
		try {
			BeanUtils.copyProperties(cond,user);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
}

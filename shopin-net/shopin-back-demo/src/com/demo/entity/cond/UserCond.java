package com.demo.entity.cond;

import java.util.Date;
import com.demo.entity.po.User;
import com.framework.AbstractCondtion;
import com.utils.JsonUtil;

 /**
 * desc   : 用户表 条件对象
 * author : luxiangxing
 * data   : 2013-04-12
 * email  : xiangxingchina@163.com
 **/
public class UserCond extends AbstractCondtion{

   private  String  userName ; //用户名
   private  String  password ; //密码
   private  String  remark ; //注释


   private User user;//对象   插入、修改使用
   private String userJson;

   public String getUserName() {
      return userName;
   }
   public void setUserName(String userName) {
      this.userName = userName;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getRemark() {
      return remark;
   }
   public void setRemark(String remark) {
      this.remark = remark;
   }



	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		if(user!=null){
			this.user = user;	
		}		
	}

	public String getUserJson() {
		return userJson;
	}

	public void setUserJson(String userJson) {
		this.userJson = userJson;
		if(userJson!=null&&!"".equals(userJson)){
			this.user = (User) JsonUtil.Json2Object(userJson, User.class);
		}
	}

}

package com.demo.entity.po;

import com.framework.AbstractPOEntity;
import java.util.Date;

/**
 * desc   : 用户表 实体对象
 * author : luxiangxing
 * data   : 2013-04-12
 * email  : xiangxingchina@163.com
 **/
public class User extends AbstractPOEntity{

   private  String  userName ; //用户名
   private  String  password ; //密码
   private  String  remark ; //注释


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


}

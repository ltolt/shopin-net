/**
 * @Probject Name: ESI
 * @Path: net.shopin.esi.serviceUserService.java
 * @Create By kongm
 * @Create In 2014-2-12 下午2:25:09
 * TODO
 */
package net.shopin.esi.service;

/**
 * @Class Name UserService
 * @Author kongm
 * @Create In 2014-2-12
 */
import java.util.ArrayList;  
import java.util.Date;  
import java.util.List;  

import net.shopin.esi.bean.User;
  
public class UserService {  
  
    private static List<User> users = new ArrayList<User>();  
      
    static{  
        for(int i=0;i<10;i++){  
            User u = new User(i,"esi"+i,i+10,new Date());  
            users.add(u);  
        }  
    }  
      
    public static List<User> getUsers(){  
        return users;  
    }  
      
    public static void delete(int index){  
        for(int i=0 ;i<users.size();i++){  
            User u = users.get(i);  
            if(u.getId()==index){  
                users.remove(u);  
                //users.remove(index);  
            }  
        }  
    }  
}  